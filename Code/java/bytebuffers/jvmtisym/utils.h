/*
 * Copyright (c) 2001-2007 Intel Corporation
 * All rights reserved.
 * Yevgeniy Y. Yarmosh 
 */


#ifndef __UTILS_H__
#define __UTILS_H__

#ifndef LINUX
#pragma pack(push)
#pragma pack(1)
#else
#pragma pack(push,1)
#endif

#ifndef NULL
#define NULL	((void*)0)
#endif

#ifndef __cplusplus

#ifndef bool
typedef unsigned char bool;
#define TRUE	1
#define true	1
#define false	0
#define FALSE	0
#endif

#endif

#ifndef const
#define const
#endif


#define TOKEN_INDEX_CR3				0
#define TOKEN_INDEX_PID				1
#define TOKEN_INDEX_CLASS_NAME		2
#define TOKEN_INDEX_METHOD_NAME		3
#define TOKEN_INDEX_HIT_COUNT		4
#define TOKEN_INDEX_PERCENT			5
#define TOKEN_INDEX_CALL_COUNT		6
#define TOKEN_TOTAL_COUNT			7

#define JIT_CLASS_SUFFIX		"_jitssg"
#define NAME_FOR_ALL			"*ALL*"

typedef struct __DLinkNode
{
	struct __DLinkNode* next;
	struct __DLinkNode* prev;
	void* data;
} DLinkNode;

typedef struct __DLinkList
{
	DLinkNode* first;
	DLinkNode* last;
	int count;

	bool (*FindCmp)(DLinkNode* n, void* p1, void* p2, void* p3);
	void* FindCmp_p1;
	void* FindCmp_p2;
	void* FindCmp_p3;
	void (*DisposeNode)(DLinkNode* n, void* p1);
	void* DisposeNode_p1;
	
} DLinkList;

typedef struct __TokenInfo
{
	char* origin;
	char* start;
	char savedchar;
	int hash;
	int len;
} TokenInfo;

typedef struct __CmdLineArgInfo
{
	const char* argname;
	bool bRequired;
	bool bMustHaveValue;
	bool bFound;
	int AliasIndex;
	const char* value;
} CmdLineArgInfo;


typedef struct __HashTableInfo
{
	int Size;
	unsigned long (*HashFunc)(void*, void*);
	void* HashFuncParam;
	int NextListIndex;
	DLinkNode* PrevNode;
	DLinkList* ListArray;
} HashTableInfo;


typedef struct __HashTableEntry
{
	DLinkNode Node;
	void* Key;
} HashTableEntry;


#ifdef __cplusplus
extern "C" {
#endif

extern char* FindSeparator(char* str, 
						   char* separators, 
						   int separatorslen);
extern char* SkipWhiteSpaces(char* str);
extern char* TrimString(char* str);
extern int MakeTokenInfo(char* str, TokenInfo* ti, int ti_len);
//extern int PrintAsIs(FILE* f, TokenInfo* ti, int ti_len);
//extern int PrintAsCsv(FILE* f, TokenInfo* ti, int ti_len);

extern DLinkList* MakeDLinkList
	(void (*DisposeNodeProc)(DLinkNode*, void*), 
							void* DisposeParam);
extern void InitDLinkList(DLinkList* l, 
		  void (*DisposeNodeProc)(DLinkNode*, void*), 
		  void* DisposeParam);
extern void SetFindCallBack(DLinkList* l, 
				bool (*FindCmpProc)(DLinkNode*, void*, void*, void*),
				void* Param1, 
				void* Param2,
				void* Param3);
extern int DLinkList_GetCount(DLinkList* l);
extern DLinkNode* DLinkList_GetHead(DLinkList* l);
extern DLinkNode* DLinkList_GetTail(DLinkList* l);
extern DLinkNode* DLinkList_GetNext(DLinkList* l, DLinkNode* n);
extern DLinkNode* DLinkList_GetPrev(DLinkList* l, DLinkNode* n);
extern void DLinkList_AddTail(DLinkList* l, DLinkNode* n);
extern void DLinkList_AddHead(DLinkList* l, DLinkNode* n);
extern void DLinkList_AddAfter(DLinkList* l, 
							   DLinkNode* n, 
							   DLinkNode* after);
extern void DLinkList_AddBefore(DLinkList* l, 
								DLinkNode* n, 
								DLinkNode* before);
extern DLinkNode* DLinkList_Find(DLinkList* l, 
								 DLinkNode* start, 
								 bool bReverse);

extern void DLinkList_RemoveTail(DLinkList* l);
extern void DLinkList_RemoveHead(DLinkList* l);
extern void DLinkList_RemoveNode(DLinkList* l, DLinkNode* n);
extern void DLinkList_RemoveAll(DLinkList* l);
extern void DisposeNodeCallback(DLinkNode* n, void* p);
extern void DisposeNodeDataCallback(DLinkNode* n, void* p);
extern void DisposeNodeAndDataCallback(DLinkNode* n, void* p);
extern bool CmpStrCallback(DLinkNode* n, void* p1, void* p2, void* p3);

extern int MakeHash(char* str);
 // set len to (-1) if it is unknown
extern char* CloneStr(char* str, int len);
extern void StrToUpper(char* str);

extern FILE* OpenFileStream(const char* name, const char* mode);
extern char* ReadFileStream(char* buf, 
							int bufsize, 
							FILE* f, 
							const char* fname);
extern int WriteStrToFileStream(char* str, 
								FILE* f, 
								const char* fname);

extern bool ProcessCmdLineArgs(CmdLineArgInfo* args, 
							   int argc, 
							   char* argv[]);


extern HashTableInfo* HashTable_Make(int Size, 
						   unsigned long (*HashFunc)(void*, void*), 
						   void* HashFuncParam,
						   bool FindCallback(DLinkNode*, void*, void*, void*),
						   void* p1,
						   void* p2,
						   void* p3);
extern void HashTable_Init(HashTableInfo* info,
						   int Size, 
						   unsigned long (*HashFunc)(void*, void*), 
						   void* HashFuncParam,
   						   bool FindCallback(DLinkNode*, void*, void*, void*),
						   void* p1,
						   void* p2,
						   void* p3);
extern void HashTable_Dispose(HashTableInfo* info);
extern bool HashTable_Add(HashTableInfo* info, void* key, void* val);
extern bool HashTable_Remove(HashTableInfo* info, void* key);
extern bool HashTable_Lookup(HashTableInfo* info, void* key, void** valptr); //valptr can be NULL
extern unsigned long MakeDwordHash(void* key, void* param);
extern bool HashTable_DwordLookupCallback(DLinkNode* node, void* p1, void* p2, void* p3);
extern bool HashTable_First(HashTableInfo* info, void** keyptr, void** valptr);
extern bool HashTable_Next(HashTableInfo* info, void** keyptr, void** valptr);



#ifdef __cplusplus
}
#endif

#pragma pack(pop)

#endif //__UTILS_H__

