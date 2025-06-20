/*
 * Copyright (c) 2003-2007 Intel Corporation
 * All rights reserved.
 */

#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include <errno.h>
#ifdef DOTNET
#include <cor.h>
#include <corprof.h>
#endif

#ifndef LINUX

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include "malloc.h"

#define UINT32 unsigned __int32
#define UINT64 unsigned __int64
#define PID_T DWORD
#define GETTIDY GetCurrentThreadId
#define GETPIDY GetCurrentProcessId
#define OS "Windows"
#ifdef _M_IA64
#define HARDWARE "IPF"
#endif
#ifdef _M_IX86
#define HARDWARE "x86"
#endif
#else
#define OS "Linux"
#ifdef _IA64_
#define HARDWARE "IPF"
#endif
#ifdef __i386__
#define HARDWARE "x86"
#endif
#ifdef __ia64__
#define _IA64_
#endif
#include <pthread.h>
#define UINT32 unsigned long
#define UINT64 unsigned long long
#define GETTIDY pthread_self
#define GETPIDY getpid
#define PID_T pid_t


#include <string.h>
#include <sys/types.h>
#include <unistd.h>
#include <malloc.h>

#include <time.h>
#include <sys/time.h>
#include <semaphore.h>

static void semaphore_init();
static void semaphore_acquire();
static void semaphore_release();
static void semaphore_destroy();


#endif

#ifndef HARDWARE
#define HARDWARE "x86_64"
#endif

#ifdef DOTNET
#define MAX_CLASSES 10000
#define MAX_METHODS 100000
static unsigned __int64 *known_methods = 0;
static int known_meth_ct = 0;
static unsigned __int64 *known_classes = 0;
static int known_class_ct = 0;
static HANDLE myHeap = 0;
#else
#include "jvmti.h"
static jvmtiEnv *JVMTI;
#define JIT_BREAK   1
#endif
#if defined(_IA64_)
int ipf_bea_hack_fix = 0;
#endif

#include "utils.h"

FILE *exceptions = 0;
void *dynamicmethodaddress = 0;


#ifdef FLUSH_ICACHE
void ia64_iflush(UINT64, UINT64);
#endif
void finish(void);

#define NUMBER_SIZE 16
#define SIZE_CORRECTION	0
#define JVMTISYM_OUT_BUF_SIZE				(1024*1024)

#define DYNAMIC_CODE_GENERATION_CLASS_NAME "DYNAMIC_CODE_GENERATION"
#define DYNAMIC_CODE_GENERATION_CLASS_NAME_LEN 23
#define DYNAMIC_CODE_GENERATION_CLASS_ID 0x10001

static char s_HexDigits[] = "0123456789ABCDEF";
static char *jformats[3]={"JVMTI_JLOCATION_OTHER","JVMTI_JLOCATION_JVMBCI","JVMTI_JLOCATION_MACHINEPC"};

// format of flushTime values is date "+%m%d%H%M%S"
#define MAX_FLUSH_TIME "1231235960"

static char flushAfterTime[11];

#ifdef JIT_BREAK
static char *BreakClass_names[101];
UINT64 BreakClass[101];
static char *BreakMethod_names[101];
UINT64 BreakMethod[101];
char BreakBuffer[32 * 1024];
#endif

#ifdef ENTRY_TRACE
#define TRACK_THREADS 1
#define MAX_PROCS 256
static int thread_count = 0;
static int trace_sleep = 0;
static int thread_of_interest[2] = { -1, -1 };
static int thread_of_interestPID[2] = { -1, -1 };
static int thread_max_flush = -1;
static PID_T the_tids[MAX_PROCS];
static FILE *the_traces[MAX_PROCS];
static char *the_buffers[MAX_PROCS];
static int the_indices[MAX_PROCS];
static int flush_count[MAX_PROCS];
#endif
static long base_sec = -1;
static long base_day = -1;

static FILE *s_OutStream = 0;

static int optCM = TRUE; // need CM records: CLASS-METHOD declarations prepended to every ML records

static char *s_Buf = NULL;
static int s_BufSize = JVMTISYM_OUT_BUF_SIZE;
static int s_BufIndex = 0;

#ifdef ENTRY_TRACE
static int MonitorMethodEnterExit = 1;
#else
static int MonitorMethodEnterExit = 0;
#endif

static int MonitorObjectMove = 1;
static int DumpMethodBinary = 1;

static int s_MaxBinarySize = 0;
static int s_ClassCount = 0;
static int s_ClassTableSize = 1717;
static HashTableInfo *s_ClassTable;
//static HashTableInfo* s_ClassTableInit;

static int s_Index = 0;
#ifndef LINUX
static CRITICAL_SECTION s_CS;
#else


#endif

#define PutCharToBuf(x)         s_Buf[s_BufIndex++] = x

static void PutBlockToBuf(char *x, int y) 
{
    memcpy(&s_Buf[s_BufIndex], x, y);
    s_BufIndex += y;
}

static void PutStringToBuf(char *x) 
{
  int len;
  if (x == NULL) {
    x = "<NULL>";
  }
    len = strlen(x);
    memcpy(&s_Buf[s_BufIndex], x, len);
    s_BufIndex += len;
}

int num = 0;
static jlong
JVMTI_Java_Helper (JNIEnv * jni, jclass junk, jlong mode)
{
  return (jlong) JVMTI;
}

void
PutDwordToBufAsHex (UINT64 x)
{
  int i;
  char *ptr = &s_Buf[s_BufIndex + NUMBER_SIZE - 1];

  // fix since cast of ptr to UINT64 sign extends first
  if (sizeof (void *) == 4)
    {
      x = x & 0xffffffff;
    }

  for (i = NUMBER_SIZE; i > 0; i--)
    {
      *ptr-- = s_HexDigits[x & 0xf];
      x = x >> 4;
    }

  s_BufIndex += NUMBER_SIZE;
}

void 
putDwordToBufAsHexTrim(UINT64 x) 
{
  int i;
  char *ptr;
  int numberSize = 0;
  UINT64 number = x;

  // count hex digits
  for(; number != 0; ++numberSize) {
    number >>= 4;
  }

  if (numberSize == 0) {
    numberSize = 1;
  }

  ptr = &s_Buf[s_BufIndex + numberSize - 1];

  // fix since cast of ptr to UINT64 sign extends first
  if (sizeof (void *) == 4) {
      x = x & 0xffffffff;
    }

  for (i = numberSize; i > 0; i--)
    {
      *ptr-- = s_HexDigits[x & 0xf];
      x = x >> 4;
    }

  s_BufIndex += numberSize;
}

static void PutDwordToBufAsHex0x0 (UINT64 x)
{
  PutCharToBuf (' ');
  PutCharToBuf ('0');
  PutCharToBuf ('x');
  PutDwordToBufAsHex(x);
}

void
FlushBuffer (int Size)
{
  if (!Size || (Size + s_BufIndex) > s_BufSize)
    {
      if (s_BufIndex)
    {
      fwrite (s_Buf, s_BufIndex, 1, s_OutStream);
#ifdef FLUSH_ALWAYS
      fflush (s_OutStream);
#else
      if (!Size)
        {
          fflush (s_OutStream);
        }
#endif
      s_BufIndex = 0;
    }
    }
}

static void
SaveJavaClassId (void *class_id)
{
  HashTable_Add (s_ClassTable, class_id, NULL);
}

void
ClearJavaClassId (void *class_id)
{
  HashTable_Remove (s_ClassTable, class_id);
}

#ifdef DOTNET
void
PrintClassMethod (ClassID classID, FunctionID functionID, const WCHAR * name)
#else
void
PrintClassMethods (jvmtiEnv * jvmti_env, JNIEnv * jni_env, jthread thread,
           jclass klass)
#endif
{
  int NameLen, i;
  int SignatureLen;

#ifdef DOTNET
  NameLen = (int) wcslen (name);
  SignatureLen = 0;
#else
  int method_ct;
  char *name_ptr, *sig_ptr, *gen_ptr;
  jmethodID *methods_ptr;
  (*jvmti_env)->GetClassMethods (jvmti_env, klass, &method_ct, &methods_ptr);
  if (method_ct)
    {
      assert (methods_ptr);
    };
  for (i = 0; i < method_ct; i++)
    {
      (*jvmti_env)->GetMethodName (jvmti_env, methods_ptr[i], &name_ptr,
                   &sig_ptr, &gen_ptr);

      NameLen = strlen (name_ptr);
      SignatureLen = strlen (sig_ptr);
#endif

#ifdef FLUSH_ALWAYS
      FlushBuffer (0);
#else
      FlushBuffer (NameLen + SignatureLen + 100);
#endif

      PutCharToBuf ('M');
      PutCharToBuf ('M');

      PutCharToBuf (' ');
      PutCharToBuf ('0');
      PutCharToBuf ('x');
#ifdef DOTNET
      PutDwordToBufAsHex ((UINT64) classID);
#else
      PutDwordToBufAsHex ((UINT64) klass);
#endif

      PutCharToBuf (' ');
      PutCharToBuf ('0');
      PutCharToBuf ('x');
#ifdef DOTNET
      PutDwordToBufAsHex ((UINT64) functionID);
#else
      PutDwordToBufAsHex ((UINT64) methods_ptr[i]);
#endif

      PutCharToBuf (' ');
#ifdef DOTNET
      for (int i = 0; i < NameLen; i++)
    {
      PutCharToBuf ((char) name[i]);
    }
#else
      PutBlockToBuf (name_ptr, NameLen);
      PutCharToBuf (' ');
      PutBlockToBuf (sig_ptr, SignatureLen);
#endif

      PutCharToBuf ('\n');
#ifdef JIT_BREAK
      {
    int z;
    for (z = 0; BreakClass[z] && BreakClass[z] != (UINT64) klass; z++)
      {
      };
    if (BreakClass[z] && !strcmp (BreakMethod_names[z], name_ptr))
      {
        fprintf (stderr, "JVMTISYM: Found method %s::%s\n",
             BreakClass_names[z], BreakMethod_names[z]);
        BreakMethod[z] = (UINT64) methods_ptr[i];
      }
      }
#endif
#ifndef DOTNET
      (*jvmti_env)->Deallocate (jvmti_env, name_ptr);
      (*jvmti_env)->Deallocate (jvmti_env, sig_ptr);
      if (gen_ptr)
    {
      (*jvmti_env)->Deallocate (jvmti_env, gen_ptr);
    }
    }
  if (methods_ptr)
    {
      (*jvmti_env)->Deallocate (jvmti_env, (void *) methods_ptr);
    }
#endif
}

// CM clID mID clName mName mSig clSource
static void DumpClassMethodDecl(jvmtiEnv * jvmti_env, jclass clID, jmethodID mID) 
{
  char *mName;
  char *mSig;
  char *mGen;
  int mNameLen;
  int mSigLen;

  char *clName;
  char *clGen;
  char *file_name = 0;
  int clNameLen;
  char *file_name_tmp = "n/a";
  int file_name_len = 3;
  int jvmtiError;

  (*jvmti_env)->GetClassSignature (jvmti_env, clID, &clName, &clGen);
  if (clGen) {
    (*jvmti_env)->Deallocate (jvmti_env, clGen);
  }
  clNameLen = strlen(clName);
  (*jvmti_env)->GetSourceFileName (jvmti_env, clID, &file_name);
  if (file_name) {
    file_name_len = strlen (file_name);
    file_name_tmp = file_name;
  }
  assert (clName);

  (*jvmti_env)->GetMethodName (jvmti_env, mID, &mName, &mSig, &mGen);
  
  if (mGen) {
    (*jvmti_env)->Deallocate (jvmti_env, mGen);
  }
  mNameLen = strlen (mName);
  mSigLen = strlen (mSig);

#ifdef FLUSH_ALWAYS
  FlushBuffer (0);
#else
  FlushBuffer (clNameLen + file_name_len + mNameLen + mSigLen + 100);
#endif

  PutCharToBuf ('C');
  PutCharToBuf ('M');
  PutDwordToBufAsHex0x0((UINT64) clID);
  PutDwordToBufAsHex0x0((UINT64) mID);
  PutCharToBuf (' ');
  PutBlockToBuf (clName, clNameLen);
  PutCharToBuf (' ');
  PutStringToBuf (mName);
  PutCharToBuf (' ');
  PutStringToBuf (mSig);
  PutCharToBuf (' ');
  PutBlockToBuf (file_name_tmp, file_name_len);
  PutCharToBuf ('\n');

  (*jvmti_env)->Deallocate (jvmti_env, clName);
  if (file_name) {
    (*jvmti_env)->Deallocate (jvmti_env, file_name);
  }

  (*jvmti_env)->Deallocate (jvmti_env, mName);
  (*jvmti_env)->Deallocate (jvmti_env, mSig);
}

#ifdef DOTNET
extern "C" void
DumpClassPrepare (ClassID classID, const WCHAR * name)
#else
static void JNICALL
DumpClassPrepareNOCS (jvmtiEnv * jvmti_env, JNIEnv * jni_env, jthread thread,
              jclass klass)
#endif
{
  int z = 0;
#ifdef DOTNET
  int len = (int) wcslen (name);
#else
  char *sig_ptr;
  char *gen_ptr;
  char *file_name = 0, *file_name_tmp = "n/a";
  jint status, tmp;
  int file_name_len = 3, len;
  (*jvmti_env)->GetClassSignature (jvmti_env, klass, &sig_ptr, &gen_ptr);
  assert (sig_ptr);
  if (gen_ptr)
    {
      (*jvmti_env)->Deallocate (jvmti_env, gen_ptr);
    }
  len = strlen (sig_ptr);
  (*jvmti_env)->GetSourceFileName (jvmti_env, klass, &file_name);
  if (file_name)
    {
      file_name_len = strlen (file_name);
      file_name_tmp = file_name;
    }
#endif

#ifdef FLUSH_ALWAYS
  FlushBuffer (0);
#else
  FlushBuffer (len + file_name_len + 100);
#endif

  PutCharToBuf ('C');
  PutCharToBuf ('L');

  PutCharToBuf (' ');
  PutCharToBuf ('0');
  PutCharToBuf ('x');
#ifdef DOTNET
  PutDwordToBufAsHex ((unsigned __int64) classID);
#else
  PutDwordToBufAsHex ((UINT64) klass);
#endif

  PutCharToBuf (' ');
#ifdef DOTNET
  for (int i = 0; i < len; i++)
    {
      PutCharToBuf ((char) name[i]);
    }
#else
  PutBlockToBuf (sig_ptr, len);
  PutCharToBuf (' ');
  PutBlockToBuf (file_name_tmp, file_name_len);
#endif

  PutCharToBuf ('\n');


#ifdef JIT_BREAK
  for (z = 0; BreakClass_names[z] && strcmp (BreakClass_names[z], sig_ptr);
       z++)
    {
    };
  if (BreakClass_names[z])
    {
      fprintf (stderr, "JVMTISYM: Found class %s\n", BreakClass_names[z]);
      BreakClass[z] = (UINT64) klass;
    }
#endif

#ifndef DOTNET
  (*jvmti_env)->Deallocate (jvmti_env, sig_ptr);
  if (file_name)
    {
      (*jvmti_env)->Deallocate (jvmti_env, file_name);
    }
  (*jvmti_env)->GetClassStatus (jvmti_env, klass, &status);
  if (status)
    PrintClassMethods (jvmti_env, jni_env, thread, klass);
  SaveJavaClassId (klass);
#endif

  s_ClassCount++;

}

static void JNICALL
DumpException (jvmtiEnv * jvmti_env, JNIEnv * jni_env, jthread thread,
           jmethodID method, jlocation location, jobject exception,
           jmethodID catch_method, jlocation catch_location)
{
#ifdef LINUX
  semaphore_acquire ();
#else
  EnterCriticalSection (&s_CS);
#endif
  fprintf (exceptions, "T   0x%08x  0x%08x  0x%08x  0x%08x  0x%08x\n",
       (unsigned int) thread,
       (unsigned int) method, (unsigned int) location,
       (unsigned int) catch_method, (unsigned int) catch_location);
#ifdef LINUX
  semaphore_release ();
#else
  LeaveCriticalSection (&s_CS);
#endif
}
static void JNICALL
DumpExceptionCatch (jvmtiEnv * jvmti_env, JNIEnv * jni_env, jthread thread,
            jmethodID method, jlocation location, jobject exception)
{
#ifdef LINUX
  semaphore_acquire ();
#else
  EnterCriticalSection (&s_CS);
#endif
  fprintf (exceptions, "C   0x%08x  0x%08x  0x%08x\n",
       (unsigned int) thread, (unsigned int) method,
       (unsigned int) location);
#ifdef LINUX
  semaphore_release ();
#else
  LeaveCriticalSection (&s_CS);
#endif
}

#ifndef DOTNET
static void JNICALL
DumpClassPrepare (jvmtiEnv * jvmti_env, JNIEnv * jni_env, jthread thread,
          jclass klass)
{
#ifdef LINUX
  semaphore_acquire ();
#else
  EnterCriticalSection (&s_CS);
#endif
  DumpClassPrepareNOCS (jvmti_env, jni_env, thread, klass);
#ifdef LINUX
  semaphore_release ();
#else
  LeaveCriticalSection (&s_CS);
#endif
}

static void JNICALL
VM_SayHola (jvmtiEnv * jvmti_env, JNIEnv * jni_env, jthread thread)
{
  int i;
  jint class_ct, tmp;
  jclass *classes;

#ifdef LINUX
  semaphore_acquire ();
#else
  EnterCriticalSection (&s_CS);
#endif
  (*jvmti_env)->GetLoadedClasses (jvmti_env, &class_ct, &classes);
  for (i = 0; i < class_ct; i++)
    {
      DumpClassPrepareNOCS (jvmti_env, jni_env, 0, classes[i]);
    }
  if (classes)
    {
      (*jvmti_env)->Deallocate (jvmti_env, (void *) classes);
    }

  (*jvmti_env)->SetEventNotificationMode (jvmti_env, JVMTI_ENABLE,
                      JVMTI_EVENT_CLASS_PREPARE, NULL);
  (*jvmti_env)->SetEventNotificationMode (jvmti_env, JVMTI_ENABLE,
                      JVMTI_EVENT_DYNAMIC_CODE_GENERATED,
                      NULL);
  (*jvmti_env)->SetEventNotificationMode (jvmti_env, JVMTI_ENABLE,
                      JVMTI_EVENT_COMPILED_METHOD_LOAD,
                      NULL);
  (*jvmti_env)->SetEventNotificationMode (jvmti_env, JVMTI_ENABLE,
                      JVMTI_EVENT_COMPILED_METHOD_UNLOAD,
                      NULL);
  if (MonitorMethodEnterExit)
    {
      (*jvmti_env)->SetEventNotificationMode (jvmti_env, JVMTI_ENABLE,
                          JVMTI_EVENT_METHOD_ENTRY, NULL);
      (*jvmti_env)->SetEventNotificationMode (jvmti_env, JVMTI_ENABLE,
                          JVMTI_EVENT_METHOD_EXIT, NULL);
    }

#ifdef LINUX
  semaphore_release ();
#else
  LeaveCriticalSection (&s_CS);
#endif
  (*jvmti_env)->GenerateEvents (jvmti_env, JVMTI_EVENT_COMPILED_METHOD_LOAD);
  (*jvmti_env)->GenerateEvents (jvmti_env,
                JVMTI_EVENT_DYNAMIC_CODE_GENERATED);
#ifdef LINUX
  semaphore_acquire ();
#else
  EnterCriticalSection (&s_CS);
#endif
  FlushBuffer (0);
  fprintf (s_OutStream, "IN initialized JVMTI\n");
  FlushBuffer (0);
#ifdef LINUX
  semaphore_release ();
#else
  LeaveCriticalSection (&s_CS);
#endif
}

static void JNICALL
VM_GoByeBye (jvmtiEnv * jvmti_env, JNIEnv * jni_env)
{
#ifdef LINUX
  semaphore_acquire ();
#else
  EnterCriticalSection (&s_CS);
#endif
  finish ();
#ifdef LINUX
  semaphore_release ();
#else
  LeaveCriticalSection (&s_CS);
#endif
}
#endif

void
SpecialFunction ()
{
  fprintf (stderr,
       "JVMTISYM: If you set your BREAK_ONJIT breakpoint, you'd have broken in by now!\n");
}

#ifndef DOTNET
static void JNICALL
DumpThreadStart (jvmtiEnv * jvmti_env, JNIEnv * jnienv, jthread thread)
{
  int i;
  char buf[1024];
  PID_T mytid;
#ifdef LINUX
  semaphore_acquire ();
#else
  EnterCriticalSection (&s_CS);
#endif
  mytid = GETTIDY ();
#ifdef ENTRY_TRACE
  for (i = 0; i < MAX_PROCS; i++)
    {
      if (mytid == the_tids[i])
    {
      return;
    }
      assert (mytid != the_tids[i]);
    }
  for (i = 0; the_tids[i] && (i < MAX_PROCS); i++)
    {
    };
  assert (i < MAX_PROCS);
  the_tids[i] = mytid;
  sprintf (buf, "jvmtitrace-%d.txt", mytid);
  the_traces[i] = fopen (buf, "wa");
  assert (the_traces[i]);
  the_buffers[i] = (char *) malloc (JVMTISYM_OUT_BUF_SIZE);
  assert (the_buffers[i]);
  fprintf (stderr,
       "JVMTISYM: Started Thread %d index=%d indexp=0x%08x%08x bufp=0x%08x%08x",
       mytid, i, (UINT32) (((UINT64) (void *) &the_indices[i]) >> 32),
       (UINT32) (void *) &the_indices[i],
       (UINT32) (((UINT64) (void *) the_buffers[i]) >> 32),
       (UINT32) (void *) the_buffers[i]);
  thread_count++;
  if (thread_count == thread_of_interest[0])
    {
      thread_of_interestPID[0] = mytid;
    }
  if (thread_count == thread_of_interest[1])
    {
      thread_of_interestPID[1] = mytid;
    }
  if (thread_of_interest[0] == -1 || thread_of_interestPID[0] == mytid
      || thread_of_interestPID[1] == mytid)
    {
      fprintf (stderr, "JVMTISYM:   trace\n");
    }
  else
    {
      fprintf (stderr, "JVMTISYM:   NOtrace\n");
    }
#else
  fprintf (stderr, "JVMTISYM: Started Thread %d\n", mytid);
#endif
#ifdef LINUX
  semaphore_release ();
#else
  LeaveCriticalSection (&s_CS);
#endif
}
#endif

#ifndef DOTNET
static void JNICALL
DumpThreadEnd (jvmtiEnv * jvmti_env, JNIEnv * jnienv, jthread thread)
{
  int i, j;
  FILE *f;
  char buf[1024];
  char *bp;
  PID_T mytid;
#ifdef LINUX
  semaphore_acquire ();
#else
  EnterCriticalSection (&s_CS);
#endif
  mytid = GETTIDY ();
#ifdef ENTRY_TRACE
  for (i = 0; (i < MAX_PROCS) && (the_tids[i] != mytid); i++)
    {
//        fprintf(stderr, "JVMTISYM: %d\n",i);
    }
  if (i == MAX_PROCS)
    {
      fprintf (stderr,
           "JVMTISYM: JVM BUG: End of thread that never started %d!\n",
           mytid);
      return;
    }
  for (j = i + 1; (j < MAX_PROCS) && the_tids[j]; j++)
    {
//        fprintf(stderr, "JVMTISYM: %d\n",j);
    }
  bp = the_buffers[i];
  the_buffers[i] = 0;
  f = the_traces[i];
  the_traces[i] = 0;
  assert (j < MAX_PROCS);
  if (!f)
    {
      fprintf (stderr, "JVMTISYM: JVM BUG: Repeat end of thread %d!\n",
           mytid);
      return;
    }
  assert (f);
  assert (bp);
  if (the_indices[i])
    {
      fwrite (bp, the_indices[i], 1, f);
      fflush (f);
    }
  the_indices[i] = 0;
  if (f)
    fclose (f);
  if (bp)
    free (bp);
#endif
  fprintf (stderr, "JVMTISYM: Ended Thread %d\n", mytid);
#ifdef LINUX
  semaphore_release ();
#else
  LeaveCriticalSection (&s_CS);
#endif
}
#endif

#ifdef DOTNET
void
HandleClassDefinition (ClassID classID, FunctionID functionID,
               CONST WCHAR * name)
{
  int i;
  for (i = 0; i < known_meth_ct; i++)
    {
      if (known_methods[i] == functionID)
    {
      return;       // known method; therefore known class
    }
    }
  known_methods[known_meth_ct++] = functionID;
  PrintClassMethod (classID, functionID, name);
}
#endif

// fills timechars with the string of localtime (11 chars)
void
getTimeChars (char *timechars)
{
#ifdef LINUX
  time_t mytime_t;
  struct tm *mytime;
#else
  SYSTEMTIME mytime;
#endif

#ifdef LINUX
  time (&mytime_t);
  mytime = localtime (&mytime_t);
  mytime->tm_mon++;     // On UNIX, month is zero based
  timechars[0] = (mytime->tm_mon > 9 ? '1' : '0');
  timechars[1] = ('0' + (mytime->tm_mon % 10));
  timechars[2] = ('0' + (mytime->tm_mday / 10));
  timechars[3] = ('0' + (mytime->tm_mday % 10));
  timechars[4] = ('0' + (mytime->tm_hour / 10));
  timechars[5] = ('0' + (mytime->tm_hour % 10));
  timechars[6] = ('0' + (mytime->tm_min / 10));
  timechars[7] = ('0' + (mytime->tm_min % 10));
  timechars[8] = ('0' + (mytime->tm_sec / 10));
  timechars[9] = ('0' + (mytime->tm_sec % 10));
#else
  GetLocalTime (&mytime);
  timechars[0] = (mytime.wMonth > 9 ? '1' : '0');
  timechars[1] = ('0' + (mytime.wMonth % 10));
  timechars[2] = ('0' + (mytime.wDay / 10));
  timechars[3] = ('0' + (mytime.wDay % 10));
  timechars[4] = ('0' + (mytime.wHour / 10));
  timechars[5] = ('0' + (mytime.wHour % 10));
  timechars[6] = ('0' + (mytime.wMinute / 10));
  timechars[7] = ('0' + (mytime.wMinute % 10));
  timechars[8] = ('0' + (mytime.wSecond / 10));
  timechars[9] = ('0' + (mytime.wSecond % 10));
#endif
  timechars[10] = 0;
}

// must be called synchronized
void
flushBufferAfterTime (char *event, char *timechars)
{
  FlushBuffer (0);
  strncpy (flushAfterTime, MAX_FLUSH_TIME, 10);
  timechars[10] = 0;
  fprintf (stderr, "JVMTISYM: %s buffer flushed at %s\n", event, timechars);
}

#ifdef DOTNET
extern "C" void
DumpMethodLoad (FunctionID functionID, ClassID classID, ModuleID moduleID,
        const char *address, ULONG meth_sz, const WCHAR * name)
#else
static void JNICALL
DumpMethodLoad (jvmtiEnv * jvmti_env, jmethodID functionID,
        jint meth_sz, const void *address,
        jint map_length, const jvmtiAddrLocationMap * map,
        const void *compile_info)
#endif
{
#ifndef FLUSH_ALWAYS
  char timechars[11];
#endif
  int i, z = 0;
#ifdef DOTNET
  HandleClassDefinition (classID, functionID, name);
#else
  jint line_ct = 0;
  jvmtiLineNumberEntry *lines = 0;
  if (dynamicmethodaddress == address)
    {
      //
      // NOTE: semaphore is reserved coming into the method from
      // DumpDynamicCode()
      //
      dynamicmethodaddress = 0;
    }
  else
    {
#ifdef LINUX
      semaphore_acquire ();
#else
      EnterCriticalSection (&s_CS);
#endif
#ifndef IGNORE_CLASS_METHOD_DECL
      if (optCM)
      { // non-dynamic method load
        jclass klass;
        int jvmtiError = (*jvmti_env)->GetMethodDeclaringClass(jvmti_env, functionID, &klass);
        assert(jvmtiError == JVMTI_ERROR_NONE);
        DumpClassMethodDecl(jvmti_env, klass, functionID);
      }
#endif
      (*jvmti_env)->GetLineNumberTable (jvmti_env, functionID, &line_ct,
                    &lines);
    }
#endif

#ifdef FLUSH_ALWAYS
  FlushBuffer (0);
#else
  FlushBuffer (100);
#endif

  PutCharToBuf ('M');
  PutCharToBuf ('L');

  PutCharToBuf (' ');
  PutCharToBuf ('0');
  PutCharToBuf ('x');
  PutDwordToBufAsHex ((UINT64) functionID);

#if defined(_IA64_)
//
// Correct for BEA bug where they have methods starting at non-bundle boundaries
//
  if (((UINT64) address) & 0x0f)
    {
      meth_sz += (((UINT64) address) & 0x0f);
      address = (void *) (((UINT64) address) - (((UINT64) address) & 0x0f));
      ipf_bea_hack_fix++;
    }
  if (((UINT64) meth_sz) & 0x0f)
    {
      meth_sz = (((UINT64) meth_sz) & ~(0x10 - 1)) + 0x10;
      ipf_bea_hack_fix++;
    }
#endif

  PutCharToBuf (' ');
  PutCharToBuf ('0');
  PutCharToBuf ('x');
  PutDwordToBufAsHex ((UINT64) address);

  PutCharToBuf (' ');
  PutCharToBuf ('0');
  PutCharToBuf ('x');
  PutDwordToBufAsHex ((UINT64) (meth_sz + SIZE_CORRECTION));

  PutCharToBuf (' ');
  getTimeChars (&s_Buf[s_BufIndex]);
  s_BufIndex += 10;

#ifndef FLUSH_ALWAYS
  strncpy (timechars, s_Buf + s_BufIndex - 10, 10);
#endif

#ifndef DOTNET
  // Put Count of Byte Code Indices and Line Number Indices
  PutCharToBuf (' ');
  PutCharToBuf ('0');
  PutCharToBuf ('x');
  assert (map_length < 0x10000);
  z = (map_length & 0x0f000) >> 12;
  PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
  z = (map_length & 0x00f00) >> 8;
  PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
  z = (map_length & 0x000f0) >> 4;
  PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
  z = (map_length & 0x0000f) >> 0;
  PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
  PutCharToBuf (' ');
  PutCharToBuf ('0');
  PutCharToBuf ('x');
  assert (line_ct < 0x10000);
  z = (line_ct & 0x0f000) >> 12;
  PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
  z = (line_ct & 0x00f00) >> 8;
  PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
  z = (line_ct & 0x000f0) >> 4;
  PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
  z = (line_ct & 0x0000f) >> 0;
  PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
#endif

#ifdef FLUSH_ICACHE
  ia64_iflush ((UINT64) address, (UINT64) meth_sz);
#endif

  if (DumpMethodBinary && meth_sz)
    {
      unsigned char *ptr = (unsigned char *) address;
      int len = meth_sz + SIZE_CORRECTION;
      int LargeBinary = ((len * 5) < s_BufSize) ? 0 : 1;
      int i;

      //fprintf(stderr, "JVMTISYM: Enter binary dump %i\n", len);
#ifdef FLUSH_ALWAYS
      FlushBuffer (0);
#else
      FlushBuffer (len * 5);
#endif

      if (s_MaxBinarySize < len)
    s_MaxBinarySize = len;


      for (i = 0; i < len; i += 16)
    {
      int j;
      int jlen = ((len - i) > 16) ? 16 : (len - i);

      PutCharToBuf ('\n');
      PutCharToBuf ('M');
      PutCharToBuf ('B');

      for (j = 0; j < jlen; j++)
        {
          if ((j & 3) == 0)
        PutCharToBuf (' ');

          PutCharToBuf (s_HexDigits[(*ptr >> 4) & 0xf]);
          PutCharToBuf (s_HexDigits[*ptr & 0xf]);
          PutCharToBuf (' ');
          ptr++;
        }
      if (LargeBinary)
        FlushBuffer (0);
#ifdef FLUSH_ALWAYS
      FlushBuffer (0);
#endif

    }
      //fprintf(stderr, "JVMTISYM: Exit binary dump\n");
    }

  PutCharToBuf ('\n');
#ifndef DOTNET
#ifdef FLUSH_ALWAYS
  FlushBuffer (0);
#else
  FlushBuffer (map_length * 50);
#endif
  // Dump JLocation information
  for (i = 0; i < map_length; i++)
    {
      PutCharToBuf ('J');
      PutCharToBuf ('L');
      PutCharToBuf (' ');
      PutCharToBuf ('0');
      PutCharToBuf ('x');
      PutDwordToBufAsHex ((UINT64) (map[i].start_address));
      PutCharToBuf (' ');
      PutCharToBuf ('0');
      PutCharToBuf ('x');
      assert (map[i].location < 0x10000);
      z = (map[i].location & 0x0f000) >> 12;
      PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
      z = (map[i].location & 0x00f00) >> 8;
      PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
      z = (map[i].location & 0x000f0) >> 4;
      PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
      z = (map[i].location & 0x0000f) >> 0;
      PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
      PutCharToBuf ('\n');
    }
  FlushBuffer (line_ct * 50);
  // Dump Line Number information
  for (i = 0; i < line_ct; i++)
    {
      PutCharToBuf ('L');
      PutCharToBuf ('N');
      PutCharToBuf (' ');
      PutCharToBuf ('0');
      PutCharToBuf ('x');
      assert (lines[i].start_location < 0x10000);
      z = (lines[i].start_location & 0x0f000) >> 12;
      PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
      z = (lines[i].start_location & 0x00f00) >> 8;
      PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
      z = (lines[i].start_location & 0x000f0) >> 4;
      PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
      z = (lines[i].start_location & 0x0000f) >> 0;
      PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
      PutCharToBuf (' ');
      PutCharToBuf ('0');
      PutCharToBuf ('x');
      assert (lines[i].line_number < 0x10000);
      z = (lines[i].line_number & 0x0f000) >> 12;
      PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
      z = (lines[i].line_number & 0x00f00) >> 8;
      PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
      z = (lines[i].line_number & 0x000f0) >> 4;
      PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
      z = (lines[i].line_number & 0x0000f) >> 0;
      PutCharToBuf (z + (z > 9 ? 'a' - 10 : '0'));
      PutCharToBuf ('\n');
    }
  if (lines)
    {
      (*jvmti_env)->Deallocate (jvmti_env, (void *) lines);
    }

#ifdef FLUSH_ALWAYS
  FlushBuffer (0);
#else
  if (strncmp (timechars, flushAfterTime, 10) > 0)
    {
      flushBufferAfterTime ("ML", timechars);
    }
#endif
#endif
#ifdef JIT_BREAK
  for (z = 0; BreakMethod[z] && BreakMethod[z] != (UINT64) functionID; z++)
    {
    };
  if (BreakMethod[z])
    {
      fprintf (stderr, "JVMTISYM: Jitting %s::%s\n", BreakClass_names[z],
           BreakMethod_names[z]);
#ifndef LINUX
      fprintf (stderr, "JVMTISYM: Execute bp 0x%08x%08x\n",
#else
      fprintf (stderr, "JVMTISYM: Execute break *0x%08x%08x\n",
#endif
           (UINT32) ((UINT64) address >> 32), (UINT32) address);
      SpecialFunction ();
    }
#endif
#ifndef DOTNET
#ifdef LINUX
  semaphore_release ();
#else
  LeaveCriticalSection (&s_CS);
#endif
#endif
}

#ifndef DOTNET
static void JNICALL
DumpGarbage (const char *mystr)
{
  long timey, timeyms;
#ifdef LINUX
  struct timeval mytime;
#else
  SYSTEMTIME mytime;
#endif
  // get current time
#ifdef LINUX
  gettimeofday (&mytime, 0);
  timeyms = mytime.tv_usec / 1000;
  if (base_sec < 0)
    {
      base_sec = mytime.tv_sec;
    }
  timey = mytime.tv_sec - base_sec;
#else
  GetSystemTime (&mytime);
  timeyms = mytime.wMilliseconds;
  if (base_day < 0)
    {
      base_day = mytime.wDay;
      base_sec =
    (60 * ((60 * (mytime.wHour)) + mytime.wMinute)) + mytime.wSecond;
    }
  if (mytime.wDay != base_day)
    {
      fprintf (stderr, "JVMTISYM: Cannot handle change of day during run!\n");
      assert (0);
    }
  timey =
    (60 * ((60 * (mytime.wHour)) + mytime.wMinute)) + mytime.wSecond -
    base_sec;
#endif
  fprintf (stderr, "JVMTISYM: %s at \n", mystr);
}
static void JNICALL
DumpGarbageS (jvmtiEnv * jvmti_env)
{
  DumpGarbage ("Starting GC at ");
}
static void JNICALL
DumpGarbageE (jvmtiEnv * jvmti_env)
{
  DumpGarbage ("Ending GC at ");
}

// prepend methodCount and change ' ' to '_'
static void printDynamicMethodName(int methodCount, char *name, int nameLen) {
  putDwordToBufAsHexTrim ((UINT64) methodCount);
  PutCharToBuf ('_');

  {
    char *str = name;
    char *end = name + nameLen;
    char *begin = name;
    while (str < end)
    {
      if (*str == ' ')
    {
        PutBlockToBuf (begin, (str-begin));
        PutCharToBuf ('_');
        begin = str+1;
    }
      str += 1;
    }
    PutBlockToBuf (begin, (end-begin));
  }
}

static void JNICALL
DumpDynamicCode (jvmtiEnv * jvmti_env, const char *name,
         const void *address, jint length)
{
  static int dynamoCT = 0;
  int i, nameLen;
#ifdef LINUX
  semaphore_acquire ();
#else
  EnterCriticalSection (&s_CS);
#endif
  if (!dynamoCT)
    {
      FlushBuffer (0);
      PutCharToBuf ('C');
      PutCharToBuf ('L');
      PutCharToBuf (' ');
      PutCharToBuf ('0');
      PutCharToBuf ('x');
      PutDwordToBufAsHex ((UINT64) DYNAMIC_CODE_GENERATION_CLASS_ID);
      PutCharToBuf (' ');
      PutBlockToBuf (DYNAMIC_CODE_GENERATION_CLASS_NAME, DYNAMIC_CODE_GENERATION_CLASS_NAME_LEN);
      PutCharToBuf ('\n');
    }
  dynamoCT++;
  nameLen = strlen (name);
  FlushBuffer (100 + nameLen);
  PutCharToBuf ('M');
  PutCharToBuf ('M');
  PutCharToBuf (' ');
  PutCharToBuf ('0');
  PutCharToBuf ('x');
  PutDwordToBufAsHex ((UINT64) 0x10001);
  PutCharToBuf (' ');
  PutCharToBuf ('0');
  PutCharToBuf ('x');
  PutDwordToBufAsHex ((UINT64) address);
  PutCharToBuf (' ');
  printDynamicMethodName(dynamoCT, name, nameLen);
  //
  // Note in a normal MM line there is a space followed by the method
  // signature.  Since dynamicgenerated code has no such concept
  // we omit this last field.  Consumers such as jdump should handle
  // this but be aware in case of future issues.
  //
  PutCharToBuf ('\n');

#ifndef IGNORE_CLASS_METHOD_DECL
  if (optCM) {
    FlushBuffer (100 + nameLen);
    PutCharToBuf ('C');
    PutCharToBuf ('M');
    PutDwordToBufAsHex0x0((UINT64) DYNAMIC_CODE_GENERATION_CLASS_ID);
    PutDwordToBufAsHex0x0((UINT64) address);
    PutCharToBuf (' ');
    PutBlockToBuf (DYNAMIC_CODE_GENERATION_CLASS_NAME, DYNAMIC_CODE_GENERATION_CLASS_NAME_LEN);
    PutCharToBuf (' ');
    printDynamicMethodName(dynamoCT, name, nameLen);
    PutCharToBuf ('\n');
  }
#endif

  assert (dynamicmethodaddress == 0);
  dynamicmethodaddress = address;
//
//NOTE: WE PASS THE SEMAPHORE OFF TO THE DUMPMETHODLOAD
//      semaphore_release();
  DumpMethodLoad (jvmti_env, address, length, address, 0, 0, 0);
}
#endif


#ifndef DOTNET
static void JNICALL
DumpMethodUnload (jvmtiEnv * jvmti_env, jmethodID method,
          const void *code_addr)
{
#ifdef LINUX
  time_t mytime_t;
  struct tm *mytime;
  semaphore_acquire ();
#else
  SYSTEMTIME mytime;
  EnterCriticalSection (&s_CS);
#endif
#ifdef FLUSH_ALWAYS
  FlushBuffer (0);
#else
  FlushBuffer (100);
#endif

  PutCharToBuf ('M');
  PutCharToBuf ('U');

  PutCharToBuf (' ');
  PutCharToBuf ('0');
  PutCharToBuf ('x');
  PutDwordToBufAsHex ((UINT64) method);
  PutCharToBuf (' ');
  PutCharToBuf ('0');
  PutCharToBuf ('x');
  PutDwordToBufAsHex ((UINT64) code_addr);
  PutCharToBuf (' ');
  getTimeChars (&s_Buf[s_BufIndex]);
  s_BufIndex += 10;

#ifndef FLUSH_ALWAYS
  if (strncmp (s_Buf + s_BufIndex - 10, flushAfterTime, 10) > 0)
    {
      flushBufferAfterTime ("MU", s_Buf + s_BufIndex - 10);
    }
#endif
  PutCharToBuf ('\n');

#ifdef LINUX
  semaphore_release ();
#else
  LeaveCriticalSection (&s_CS);
#endif
}
#endif

long base_time = -1;

#ifndef DOTNET
void
DumpMethodEnterExit (jvmtiEnv * jvmti_env, JNIEnv * jni_env,
             jthread thread, jmethodID method, char whichone)
{
#ifdef ENTRY_TRACE
  int i, j;
  UINT64 x;
  long timey, timeyms;
#ifdef LINUX
  struct timeval mytime;
#else
  SYSTEMTIME mytime;
#endif
  PID_T mytid = GETTIDY ();
  if (thread_of_interest[0] != -1 && mytid != thread_of_interestPID[0]
      && mytid != thread_of_interestPID[1])
    {
      return;
    }
  // get current time
#ifdef LINUX
  gettimeofday (&mytime, 0);
  timeyms = mytime.tv_usec / 1000;
  if (base_sec < 0)
    {
      base_sec = mytime.tv_sec;
    }
  timey = mytime.tv_sec - base_sec;
#else
  GetSystemTime (&mytime);
  timeyms = mytime.wMilliseconds;
  if (base_day < 0)
    {
      base_day = mytime.wDay;
      base_sec =
    (60 * ((60 * (mytime.wHour)) + mytime.wMinute)) + mytime.wSecond;
    }
  if (mytime.wDay != base_day)
    {
      fprintf (stderr, "JVMTISYM: Cannot handle change of day during run!\n");
      assert (0);
    }
  timey =
    (60 * ((60 * (mytime.wHour)) + mytime.wMinute)) + mytime.wSecond -
    base_sec;
#endif
  assert (timeyms < 1000);
  assert (timey < 99999);

  if (trace_sleep > timey)
    {
      return;
    }
  if (base_time < 0)
    {
      base_time = timey * 1000 + timeyms;
    }

  for (i = 0; (the_tids[i] != mytid) && (i < MAX_PROCS); i++)
    {
    };
  if (i == MAX_PROCS)
    {
      fprintf (stderr, "JVMTISYM: Cant find pid=%d... compensating\n", mytid);
#ifdef LINUX
      semaphore_acquire ();
#else
      EnterCriticalSection (&s_CS);
#endif
      DumpThreadStart (0, 0, 0);
#ifdef LINUX
      semaphore_release ();
#else
      LeaveCriticalSection (&s_CS);
#endif
      for (i = 0; (the_tids[i] != mytid) && (i < MAX_PROCS); i++)
    {
    };
      assert (i < MAX_PROCS);
    }
  if (!the_buffers[i])
    {
//    fprintf(stderr, "JVMTISYM: Missing buffer for pid=%d.  Thread exited already!\n",mytid);
      return;
    }
  if ((the_indices[i] + 64) > JVMTISYM_OUT_BUF_SIZE)
    {
//fprintf(stderr, "JVMTISYM: Flushing %d bytes=%d\n",i,the_indices[i]);
      fwrite (the_buffers[i], the_indices[i], 1, the_traces[i]);
      fflush (the_traces[i]);
      the_indices[i] = 0;
      flush_count[i]++;
      if (flush_count[i] >= thread_max_flush)
    {
      fprintf (the_traces[i], "TIME_TRACED= %d ms\n",
           (timey * 1000 + timeyms) - base_time);
    }
    }
  if (thread_max_flush != -1 && flush_count[i] >= thread_max_flush)
    {
      return;
    }
  the_buffers[i][the_indices[i]++] = 'M';
  the_buffers[i][the_indices[i]++] = whichone;
  the_buffers[i][the_indices[i]++] = ' ';
  the_buffers[i][the_indices[i]++] = '0';
  the_buffers[i][the_indices[i]++] = 'x';
  the_indices[i] += 16;
  x = (UINT64) method;
  // fix since cast of ptr to UINT64 sign extends first
  if (sizeof (void *) == 4)
    {
      x = x & 0xffffffff;
    }
  for (j = the_indices[i] - 1; j > the_indices[i] - 17; j--)
    {
      the_buffers[i][j] = s_HexDigits[x & 0xf];
      x = x >> 4;
    }
  the_buffers[i][the_indices[i]++] = ' ';

  // put msec
  the_buffers[i][the_indices[i] + 7] = timeyms % 10 + '0';
  timeyms = timeyms / 10;
  the_buffers[i][the_indices[i] + 6] = timeyms % 10 + '0';
  timeyms = timeyms / 10;
  the_buffers[i][the_indices[i] + 5] = timeyms % 10 + '0';
  timeyms = timeyms / 10;

  // put sec
  the_buffers[i][the_indices[i] + 4] = timey % 10 + '0';
  timey = timey / 10;
  the_buffers[i][the_indices[i] + 3] = timey % 10 + '0';
  timey = timey / 10;
  the_buffers[i][the_indices[i] + 2] = timey % 10 + '0';
  timey = timey / 10;
  the_buffers[i][the_indices[i] + 1] = timey % 10 + '0';
  timey = timey / 10;
  the_buffers[i][the_indices[i] + 0] = timey % 10 + '0';
  timey = timey / 10;

  the_indices[i] += 8;
  the_buffers[i][the_indices[i]++] = '\n';

#ifdef FLUSH_ALWAYS
  fwrite (the_buffers[i], the_indices[i], 1, the_traces[i]);
  fflush (the_traces[i]);
  the_indices[i] = 0;
#endif
  return;
#endif
#ifdef FLUSH_ALWAYS
  FlushBuffer (0);
#else
  FlushBuffer (100);
#endif

  PutCharToBuf ('M');
  PutCharToBuf (whichone);

  PutCharToBuf (' ');
  PutCharToBuf ('0');
  PutCharToBuf ('x');
  PutDwordToBufAsHex ((UINT64) method);
  PutCharToBuf ('\n');
}
static void JNICALL
DumpMethodEnter (jvmtiEnv * jvmti_env, JNIEnv * jni_env,
         jthread thread, jmethodID method)
{
  DumpMethodEnterExit (jvmti_env, jni_env, thread, method, 'E');
}
static void JNICALL
DumpMethodExit (jvmtiEnv * jvmti_env, JNIEnv * jni_env,
        jthread thread, jmethodID method,
        jboolean exception, jvalue returnval)
{
  DumpMethodEnterExit (jvmti_env, jni_env, thread, method, 'X');
}
#endif

#ifdef LINUX
// the first argument of the function is an int of seconds to delay
void *
defferedFlusher (void *ptr)
{
  char timechars[11];
  int seconds = (int) ptr;

  sleep (seconds);
  getTimeChars (timechars);

#ifdef LINUX
  semaphore_acquire ();
#else
  EnterCriticalSection (&s_CS);
#endif

  flushBufferAfterTime ("TIMER", timechars);

#ifdef LINUX
  semaphore_release ();
#else
  LeaveCriticalSection (&s_CS);
#endif
}

#endif

static void initModeFlags(char* agentOptions) {
  char* mode;
  size_t modeLen;
  char *opt;

  if (!agentOptions) {
    return;
  }

  mode = strstr(agentOptions, "mode=");
  if (!mode) {
    return;
  }

  mode += 5;
  modeLen = strcspn(mode, ",");
  
  opt = strstr(mode, "CMoff");
  if (opt && (opt-mode) < modeLen) {
    optCM = FALSE;
  }

  opt = strstr(mode, "CMon");
  if (opt && (opt-mode) < modeLen) {
    optCM = TRUE;
  }
}


static void openOutputFile(char* agentOptions) {
    if (s_OutStream) {
        return;
    } else {
        const char* fileName = "jvmtisym.txt";
        char* commaPos = NULL;
        if (agentOptions) {
            char* oFileOpt = strstr(agentOptions, "ofile=");
            if (oFileOpt) {
                fileName = oFileOpt + 6;
                commaPos = strstr(fileName, ",");
                if (commaPos) {
                    *commaPos = '\0';
                }
            }
        }
        s_OutStream = fopen(fileName, "w");
        if (commaPos) {
            *commaPos = ',';
        }
        if (!s_OutStream) {
            fprintf(stderr, "JVMTISYM: jvmtisym outfile=%s\n", fileName);
			perror("JVMTISYM: cannot open file");
            exit(1);
        }
        fprintf (stderr, "JVMTISYM: Starting jvmtisym outfile=%s\n", fileName);
    }
}


// JVMTI entry point
#ifdef DOTNET
extern "C"
jvmtisym_onenter (void)
#else
JNIEXPORT jint JNICALL
Agent_OnLoad (JavaVM * jvm, char *options, void *reserved)
#endif
{
  int z = 0;
  FILE *trcCfg;
  FILE *jitf;
  char *p;
  char trcBuffer[1024];
#ifdef LINUX
  time_t mytime_t;
  struct tm *mytime;
#endif

#ifndef DOTNET
  jvmtiJlocationFormat jformat;
  jvmtiCapabilities capabilities;
  jvmtiEventCallbacks callbacks;
#endif

  fprintf (stderr, "JVMTISYM: %s -- %s\n", __DATE__, __TIME__);
  initModeFlags(options);

#ifdef FLUSH_ALWAYS
  fprintf (stderr, "JVMTISYM:  -- FLUSH_ALWAYS");
#else
  strncpy (flushAfterTime, MAX_FLUSH_TIME, 10);
#ifdef LINUX
  p = getenv ("JVMTISYM_FLUSH_AFTER_SECONDS");
  if (p != NULL)
    {
      pthread_t flusherThread;
      int delaySeconds = atoi (p);

      time (&mytime_t);
      mytime_t += delaySeconds;
      mytime = localtime (&mytime_t);
      mytime->tm_mon++;     // On UNIX, month is zero based
      flushAfterTime[0] = mytime->tm_mon > 9 ? '1' : '0';
      flushAfterTime[1] = ('0' + (mytime->tm_mon % 10));
      flushAfterTime[2] = ('0' + (mytime->tm_mday / 10));
      flushAfterTime[3] = ('0' + (mytime->tm_mday % 10));
      flushAfterTime[4] = ('0' + (mytime->tm_hour / 10));
      flushAfterTime[5] = ('0' + (mytime->tm_hour % 10));
      flushAfterTime[6] = ('0' + (mytime->tm_min / 10));
      flushAfterTime[7] = ('0' + (mytime->tm_min % 10));
      flushAfterTime[8] = ('0' + (mytime->tm_sec / 10));
      flushAfterTime[9] = ('0' + (mytime->tm_sec % 10));
      flushAfterTime[10] = 0;
      fprintf (stderr, "JVMTISYM: will flush in %s seconds after %s\n", p,
           flushAfterTime);
      pthread_create (&flusherThread, NULL, defferedFlusher,
              (void *) delaySeconds);
      pthread_detach (flusherThread);
    }
#endif // LINUX
#endif
#ifdef ENTRY_TRACE
  fprintf (stderr, "JVMTISYM:  -- ENTRY_TRACE\n");
#else
  fprintf (stderr, "JVMTISYM: \n");
#endif


#ifdef ENTRY_TRACE
  for (z = 0; z < MAX_PROCS; z++)
    {
      the_tids[z] = 0;
      the_traces[z] = 0;
      the_buffers[z] = 0;
      the_indices[z] = 0;
      flush_count[z] = 0;
    }
  trcCfg = fopen ("TRACE_CONFIG", "r");
  fprintf (stderr, "JVMTISYM: trcCfg=%d\n", trcCfg);
  if (trcCfg)
    {
      for (z = 0; (trcBuffer[z] = fgetc (trcCfg)) != '\n'; z++)
    {
      assert (z < 1024);
    }
      trcBuffer[z] = 0;
      assert (trcBuffer[0] == 'T' && trcBuffer[1] == '=');
      thread_of_interest[0] = atoi (&trcBuffer[2]);
      for (z = 0; (trcBuffer[z] = fgetc (trcCfg)) != '\n'; z++)
    {
      assert (z < 1024);
    }
      trcBuffer[z] = 0;
      if (trcBuffer[0] == 'T')
    {
      assert (trcBuffer[0] == 'T' && trcBuffer[1] == '=');
      thread_of_interest[1] = atoi (&trcBuffer[2]);
      for (z = 0; (trcBuffer[z] = fgetc (trcCfg)) != '\n'; z++)
        {
          assert (z < 1024);
        }
      trcBuffer[z] = 0;
    }
      assert (trcBuffer[0] == 'S' && trcBuffer[1] == '=');
      thread_max_flush = atoi (&trcBuffer[2]);
      for (z = 0; (trcBuffer[z] = fgetc (trcCfg)) != '\n'; z++)
    {
      assert (z < 1024);
    }
      trcBuffer[z] = 0;
      assert (trcBuffer[0] == 'Z' && trcBuffer[1] == '=');
      trace_sleep = atoi (&trcBuffer[2]);
      fclose (trcCfg);
    }
  fprintf (stderr, "JVMTISYM: Tracing Threads=%d", thread_of_interest[0]);
  if (thread_of_interest[1] != -1)
    {
      fprintf (stderr, "JVMTISYM: ,%d", thread_of_interest[1]);
    }
  fprintf (stderr, "JVMTISYM:  -- Max Trace=%dMB -- Trace Sleep=%d sec\n",
       thread_max_flush, trace_sleep);
#endif

  openOutputFile(options);

#ifdef JIT_BREAK
  for (z = 0; z < 101; z++)
    {
      BreakClass_names[z] = 0;
      BreakClass[z] = 0;
      BreakMethod_names[z] = 0;
      BreakMethod[z] = 0;
    }
  jitf = fopen ("BREAK_ONJIT", "r");
  fprintf (stderr, "JVMTISYM: JITFILE=%d\n", jitf);
  if (jitf)
    {
      for (z = 0; (BreakBuffer[z] = fgetc (jitf)) != '\n'; z++)
    {
    }
      BreakBuffer[z] = 0;
      p = strstr (BreakBuffer, "::");
      fprintf (stderr, "JVMTISYM: BREAKBUFFER=%s p=%p\n", BreakBuffer, p);
      if (p)
    {
      BreakClass_names[0] = &BreakBuffer[0];
      *p = 0;
      BreakMethod_names[0] = p + 2;
      fprintf (stderr, "JVMTISYM: Setting up to Break on JIT of %s::%s\n",
           BreakClass_names[0], BreakMethod_names[0]);
#ifndef LINUX
      fprintf (stderr, "JVMTISYM: To catch the break, bp 0x%08x%08x\n",
           (UINT32) (((UINT64) (void *) SpecialFunction) >> 32),
           (UINT32) (void *) SpecialFunction);
#else
      fprintf (stderr,
           "JVMTISYM: To catch the break, break *0x%08x%08x\n",
           (UINT32) (((UINT64) * ((UINT64 *) SpecialFunction)) >> 32),
           (UINT32) (*(UINT64 *) SpecialFunction));
#endif
    }
      fclose (jitf);
    }
#endif
  FlushBuffer (0);
  fprintf (s_OutStream, "IM initializing JVMTI\n");
  fprintf (s_OutStream, "PF %s %s\n", OS, HARDWARE);
  fprintf (s_OutStream, "PI 0x%X\n", GETPIDY ());

#ifdef LINUX
  semaphore_init ();
#else
  InitializeCriticalSection (&s_CS);
#endif

  s_ClassTable = HashTable_Make (s_ClassTableSize,
                 MakeDwordHash,
                 NULL,
                 HashTable_DwordLookupCallback,
                 NULL, NULL, NULL);
//      s_ClassTableInit = HashTable_Make(s_ClassTableSize,
//                                                                MakeDwordHash,
//                                                                NULL,
//                                                                HashTable_DwordLookupCallback,
//                                                                NULL,
//                                                                NULL,
//                                                                NULL);

#ifndef DOTNET
  // get jvmti interface pointer
  if (((*jvm)->GetEnv (jvm, (void **) &JVMTI, JVMTI_VERSION)) != JNI_OK)
    {
      fprintf (s_OutStream,
           "ER error in obtaining jvmti interface pointer\n");
      return JNI_ERR;
    }

// FOR VTUNE DEBUGGING
//{ FILE *tmpf;
//  tmpf=fopen("JVMTI.addr","w");
//  if(tmpf) {
//    fprintf(tmpf,"%p",JVMTI);
//    fclose(tmpf);
//  }
//}

  (*JVMTI)->GetJLocationFormat (JVMTI, &jformat);
  assert (jformat < 3);
  fprintf (s_OutStream, "IM JLocationFormat = %s\n", jformats[jformat]);
  (*JVMTI)->GetCapabilities (JVMTI, &capabilities);
  capabilities.can_get_source_file_name = 1;
  capabilities.can_get_line_numbers = 1;
#ifdef DOGC
  capabilities.can_generate_garbage_collection_events = 1;
#endif
#if defined(TRACK_EXCEPTIONS)
  capabilities.can_generate_exception_events = 1;
#endif
  capabilities.can_generate_compiled_method_load_events = 1;
  if (MonitorMethodEnterExit)
    {
      capabilities.can_generate_method_entry_events = 1;
      capabilities.can_generate_method_exit_events = 1;
    }
  (*JVMTI)->AddCapabilities (JVMTI, &capabilities);
  memset (&callbacks, 0, sizeof (callbacks));
  callbacks.VMInit = &VM_SayHola;
  callbacks.VMDeath = &VM_GoByeBye;
  callbacks.ClassPrepare = &DumpClassPrepare;
#if defined(TRACK_EXCEPTIONS)
  exceptions = fopen ("exceptions.txt", "wa");
  callbacks.Exception = &DumpException;
  callbacks.ExceptionCatch = &DumpExceptionCatch;
#endif
#ifdef TRACK_THREADS
  callbacks.ThreadStart = &DumpThreadStart;
  callbacks.ThreadEnd = &DumpThreadEnd;
#endif
  callbacks.ThreadEnd = &DumpThreadEnd;
  callbacks.DynamicCodeGenerated = &DumpDynamicCode;
  callbacks.GarbageCollectionStart = &DumpGarbageS;
  callbacks.GarbageCollectionFinish = &DumpGarbageE;
  callbacks.CompiledMethodUnload = &DumpMethodUnload;
  callbacks.CompiledMethodLoad = &DumpMethodLoad;
  callbacks.CompiledMethodUnload = &DumpMethodUnload;
  if (MonitorMethodEnterExit)
    {
      callbacks.MethodEntry = &DumpMethodEnter;
      callbacks.MethodExit = &DumpMethodExit;
    }
  (*JVMTI)->SetEventCallbacks (JVMTI, &callbacks, sizeof (callbacks));
#if defined(TRACK_EXCEPTIONS)
  (*JVMTI)->SetEventNotificationMode (JVMTI, JVMTI_ENABLE,
                      JVMTI_EVENT_EXCEPTION_CATCH, NULL);
  (*JVMTI)->SetEventNotificationMode (JVMTI, JVMTI_ENABLE,
                      JVMTI_EVENT_EXCEPTION, NULL);
#endif
  (*JVMTI)->SetEventNotificationMode (JVMTI, JVMTI_ENABLE,
                      JVMTI_EVENT_VM_INIT, NULL);
  (*JVMTI)->SetEventNotificationMode (JVMTI, JVMTI_ENABLE,
                      JVMTI_EVENT_VM_DEATH, NULL);
#ifdef DOGC
  (*JVMTI)->SetEventNotificationMode (JVMTI, JVMTI_ENABLE,
                      JVMTI_EVENT_GARBAGE_COLLECTION_START,
                      NULL);
  (*JVMTI)->SetEventNotificationMode (JVMTI, JVMTI_ENABLE,
                      JVMTI_EVENT_GARBAGE_COLLECTION_FINISH,
                      NULL);
#endif

#ifdef TRACK_THREADS
  (*JVMTI)->SetEventNotificationMode (JVMTI, JVMTI_ENABLE,
                      JVMTI_EVENT_THREAD_START, NULL);
  (*JVMTI)->SetEventNotificationMode (JVMTI, JVMTI_ENABLE,
                      JVMTI_EVENT_THREAD_END, NULL);
#endif

#endif

  FlushBuffer (0);
  // initialize jvmti interface
#ifdef DOTNET
  myHeap = HeapCreate (0, 1024 * 1024, 0);
  if (!myHeap)
    {
      fprintf (stderr, "JVMTISYM: Cant create a heap!\n");
      assert (0);
    }
  s_Buf = (char *) HeapAlloc (myHeap, 0, JVMTISYM_OUT_BUF_SIZE);
  known_methods =
    (unsigned __int64 *) HeapAlloc (myHeap, 0,
                    sizeof (unsigned __int64) * MAX_METHODS);
  known_classes =
    (unsigned __int64 *) HeapAlloc (myHeap, 0,
                    sizeof (unsigned __int64) * MAX_CLASSES);
  if ((!known_methods) || (!known_classes))
    {
      fprintf (stderr,
           "JVMTISYM: Fatal error allocating class/method space in MethodNotify\n");
      assert (0);
    }
#else
  s_Buf = (char *) malloc (s_BufSize);
#endif
  fprintf (stderr, "JVMTISYM: s_Buf: 0x%08x%08x\n",
       (UINT32) (((UINT64) (void *) s_Buf) >> 32),
       (UINT32) (void *) s_Buf);
  fprintf (stderr, "JVMTISYM: &s_BufIndex: 0x%08x%08x\n",
       (UINT32) (((UINT64) (void *) &s_BufIndex) >> 32),
       (UINT32) (void *) &s_BufIndex);

  FlushBuffer (0);
  fprintf (s_OutStream, "IM Init done\n\n");
#ifdef LINUX
//      on_exit(my_buddy,0);
#endif
#ifndef DOTNET
  return JNI_OK;
#endif
}

#ifndef LINUX
#ifndef DOTNET
BOOL APIENTRY
DllMain (HANDLE hModule, DWORD ul_reason_for_call, LPVOID lpReserved)
{
  switch (ul_reason_for_call)
    {
    case DLL_PROCESS_DETACH:
      finish ();
      break;
    }
  return TRUE;
}
#endif
#endif

#ifdef DOTNET
extern "C" void
jvmtisym_onexit (void)
#else
void
finish (void)
#endif
{
  static int done = 0;
  int i = 0;
  if (done)
    {
      return;
    }
  done = 1;
  fprintf (stderr, "JVMTISYM: Starting jvmtisym shutdown\n");
  FlushBuffer (0);
  fprintf (s_OutStream, "IM Class Count = %i\n", s_ClassCount);
  fprintf (s_OutStream, "IM Max Binary Size = %i\n", s_MaxBinarySize);
  fflush (s_OutStream);
  fclose (s_OutStream);
  s_OutStream = 0;
#ifdef ENTRY_TRACE
  for (i = 0; i < MAX_PROCS; i++)
    {
      if (the_tids[i])
    {
      if (the_traces[i])
        {
          fclose (the_traces[i]);
          fprintf (stderr, "JVMTISYM: thread %d now finalized\n",
               the_tids[i]);
        }
      else
        {
          fprintf (stderr, "JVMTISYM: thread %d already finalized\n",
               the_tids[i]);
        }
      the_tids[i] = 0;
      the_traces[i] = 0;
      the_buffers[i] = 0;
      the_indices[i] = 0;
      flush_count[i] = 0;
    }
    }
#endif
#if defined(_IA64_)
  if (ipf_bea_hack_fix)
    {
      fprintf (stderr,
           "JVMTISYM: The VM provided %d unaligned (bogus) JIT addresses.  Please report a bug against the JVM\n",
           ipf_bea_hack_fix);
    }
#endif
  fprintf (stderr, "JVMTISYM: Finishing jvmtisym\n");
}

#ifdef LINUX

static sem_t lock;

static void
semaphore_init ()
{

    if (-1 == sem_init(&lock, 0, 1)) {
    perror("JVMTISYM: sem_init");
    exit(1);
    }
}

static inline void
semaphore_acquire ()
{  
	int s; 
	while ((s = sem_wait(&lock)) == -1 && errno == EINTR)
      continue; // Retry if interrupted
    if (s == -1) {
      perror("JVMTISYM: sem_wait");
      exit(1);
    }
}

static inline void
semaphore_release ()
{
    if (-1 == sem_post(&lock)) {
      perror("JVMTISYM: sem_post");
      exit(1);
    }
}


static void
semaphore_destroy ()
{
    sem_destroy(&lock);
}
#endif
