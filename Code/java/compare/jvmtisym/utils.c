/*
 * Copyright (c) 2001-2007 Intel Corporation
 * All rights reserved.
 * Yevgeniy Y. Yarmosh 
 */

#include <malloc.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include "utils.h"




DLinkList* MakeDLinkList(void (*DisposeNodeProc)(DLinkNode*, void*), 
						 void* DisposeParam)
{
	DLinkList * ptr = (DLinkList*)malloc(sizeof(DLinkList));
	if ( ptr != NULL )
	{
		InitDLinkList(ptr, DisposeNodeProc, DisposeParam);
	}
	return ptr;
}

void InitDLinkList(DLinkList* l, 
				   void (*DisposeNodeProc)(DLinkNode*, void*), 
				    void* DisposeParam)
{
	l->first = l->last = NULL;
	l->count = 0;

	l->FindCmp = NULL;
	l->FindCmp_p1 = NULL;
	l->FindCmp_p2 = NULL;
	l->FindCmp_p3 = NULL;
	l->DisposeNode = DisposeNodeProc;
	l->DisposeNode_p1 = DisposeParam;
};


void SetFindCallBack(DLinkList* l, 
					bool (*FindCmpProc)(DLinkNode*, void*, void*, void*),
					void* Param1, 
					void* Param2,
					void* Param3)
{
	l->FindCmp = FindCmpProc;
	l->FindCmp_p1 = Param1;
	l->FindCmp_p2 = Param2;
	l->FindCmp_p3 = Param3;
};

int DLinkList_GetCount(DLinkList* l)
{
	return l->count;
};

DLinkNode* DLinkList_GetHead(DLinkList* l)
{
	return l->first;
}

DLinkNode* DLinkList_GetTail(DLinkList* l)
{
	return l->last;
};

DLinkNode* DLinkList_GetNext(DLinkList* l, DLinkNode* n)
{
	return n->next;
};

DLinkNode* DLinkList_GetPrev(DLinkList* l, DLinkNode* n)
{
	return n->prev;
};


void DLinkList_AddTail(DLinkList* l, DLinkNode* n)
{
	if ( l->first == NULL )
	{
		l->first = l->last = n;
		n->next = n->prev = NULL;
	}
	else
	{
		n->next = NULL;
		n->prev = l->last;
		(l->last)->next = n;
		l->last = n;
	}
	l->count++;
}

void DLinkList_AddHead(DLinkList* l, DLinkNode* n)
{
	if ( l->last == NULL )
	{
		l->first = l->last = n;
		n->next = n->prev = NULL;
	}
	else
	{
		n->prev = NULL;
		n->next = l->first;
		(l->first)->prev = n;
		l->first = n;
	}
	l->count++;
}

void DLinkList_AddAfter(DLinkList* l, DLinkNode* n, DLinkNode* after)
{
	n->next = after->next;
	n->prev = after;
	if ( after->next != NULL )
		(after->next)->prev = n;
	after->next = n;
	
	if ( l->last == after )
		l->last = n;
	l->count++;
}

void DLinkList_AddBefore(DLinkList* l, DLinkNode* n, DLinkNode* before)
{
	n->next = before;
	n->prev = before->prev;
	if ( before->prev != NULL )
		(before->prev)->next = n;
	before->prev = n;

	if ( l->first == before )
		l->first = n;
	l->count++;
}

DLinkNode* DLinkList_Find(DLinkList* l, DLinkNode* start, bool bReverse)
{
	DLinkNode* node = start;
	
	if ( node == NULL )
		node = (bReverse) ? l->last : l->first;
	
	if ( l->FindCmp == NULL )
		return NULL;
	
	while(node != NULL)
	{
		if ( l->FindCmp(node, l->FindCmp_p1, l->FindCmp_p2, l->FindCmp_p3) )
		{
			break;
		}
		node = (bReverse) ? node->prev : node->next;
	}

	return node;
}

void DLinkList_RemoveTail(DLinkList* l)
{
	DLinkList_RemoveNode(l, l->last);
}

void DLinkList_RemoveHead(DLinkList* l)
{
	DLinkList_RemoveNode(l, l->first);
}

void DLinkList_RemoveNode(DLinkList* l, DLinkNode* n)
{
	if ( n != NULL )
	{
		l->count--;
		if ( l->first == n )
			l->first = n->next;
		if ( l->last == n )
			l->last = n->prev;
		if ( n->next != NULL )
			(n->next)->prev = n->prev;
		if ( n->prev != NULL )
			(n->prev)->next = n->next;
		if ( l->DisposeNode != NULL )
			l->DisposeNode(n, l->DisposeNode_p1);
	}
}

void DLinkList_RemoveAll(DLinkList* l)
{
	while(l->count != 0)
	{
		DLinkList_RemoveHead(l);
	}
}


bool CmpStrCallback(DLinkNode* n, void* p1, void* p2, void* p3)
{
	if ( n->data == p1 )
		return 0;
	if ( n->data == NULL )
		return (-1);
	return strcmp(n->data, (char*)p1);
}

void DisposeNodeCallback(DLinkNode* n, void* p)
{
	free(n);
}

void DisposeNodeDataCallback(DLinkNode* n, void* p)
{
	if ( n->data != NULL )
		free(n->data);
}

void DisposeNodeAndDataCallback(DLinkNode* n, void* p)
{
	if ( n->data != NULL )
		free(n->data);
	free(n);
}


void StrToUpper(char* str)
{
	while(*str)
	{
		*str = toupper(*str);
		str++;
	}
}

char* CloneStr(char* str, int len)
{
	char* ptr;
	if ( len < 0 )
		len = (int)strlen(str);
	if ( (ptr = malloc(len + 1)) != NULL )
	{
		memcpy(ptr, str, len + 1);
	}
	return ptr;
}


int MakeHash(const char* str)
{
	unsigned hash = 0;
	while(*str)
	{
		hash += (hash<<5) + hash + ((unsigned)*str++);
	}
	return (int)hash;
}

char* SkipSeparators(char* str, const char* separators, int len)
{
	while(str && *str)
	{
		int i;
		for(i = 0; i < len; i++)
		{
			if ( separators[i] == *str )
				break;
		}
		if ( i >= len )
			break;
		str++;
	}

	return str;
}


int MakeTokenInfo(char* str, TokenInfo* ti, int ti_len)
{
	static char s_Separators[] = " ,\r\n\t";
	static int s_SeparatorsLen = sizeof(s_Separators) - 1;
	int i;
	int count = 0;
	for(i = 0; i < ti_len; i++)
	{
		memset(&ti[i], 0, sizeof(TokenInfo));
	}

	while(*str && ti_len > count)
	{
		char* origin = str;
		if ( (str = SkipWhiteSpaces(str)) == NULL || *str == 0 )
			break;

		if ( *str == '\"' )
		{
			char* ptr;
			str++;
			
			ti[count].start = str;
			ptr = strchr(str, '\"');
			if ( ptr == NULL )
			{
				ti[count].len = (int)strlen(str);
				ptr = str + ti[count].len;
			}
			else
			{
				ti[count].savedchar = *ptr;
				ti[count].len = (int)(ptr - str);
				*ptr++ = 0;
			}		
			str = SkipSeparators(ptr, s_Separators, s_SeparatorsLen);
		}
		else
		{
			char* ptr;
			ti[count].start = str;
			ptr = FindSeparator(str, s_Separators, s_SeparatorsLen);

			ti[count].len = (int)(ptr - str);
			str = ptr;
			ti[count].savedchar = *str;
			
			if ( *str != 0 )
				*str++ = 0;
		}
	
		ti[count].origin = origin;
		ti[count].hash = MakeHash(ti[count].start);
		count++;
	}

	return count;
}


char* SkipWhiteSpaces(char* str)
{
	while(*str == ' ' 
			   ||
		  *str == '\t' 
			   ||
		  *str == '\n' 
			   ||
		  *str == '\r' )
	{
		*str++;
	}
	return str;
}


char* TrimString(char* str)
{
	char* ptr = SkipWhiteSpaces(str);
	int len = (int)strlen(ptr);
	
	while( len > 0 )
	{
		len--;
		if ( !isspace(ptr[len]) )
		{
			len++;
			break;
		}
	}
	ptr[len] = 0;

	return ptr;
}


char* FindSeparator(char* str, char* separators, int separatorslen)
{
	if ( separatorslen < 0 )
		separatorslen = (int)strlen(separators);

	while(*str)
	{
		int i;
		for(i = 0; i < separatorslen; i++)
		{
			if ( separators[i] == *str )
				break;
		}
	
		if ( i < separatorslen )
			break;

		str++;
	}

	return str;
}


FILE* OpenFileStream(const char* name, const char* mode)
{
	FILE* s;
	if ( (s = fopen(name, mode)) == NULL )
	{
		fprintf(stderr, 
				"Failed to open file %s: %s\n", 
				name, 
				strerror(errno));
	}
	return s;
}

char* ReadFileStream(char* buf, int bufsize, FILE* f, const char* fname)
{
	if ( fgets(buf, bufsize, f) != NULL )
		return buf;

	if ( errno )
		fprintf(stderr, 
				"Failed to read file %s: %s\n", 
				(!fname) ? "" : fname,
				strerror(errno));

	return NULL;
}

int WriteStrToFileStream(char* str, FILE* f, const char* fname)
{
	int ret_val;
	if ( (ret_val = fputs(str, f)) >= 0 )
		return ret_val;

	if ( errno )
		fprintf(stderr, 
				"Failed to write a string to file %s: %s\n", 
				(!fname) ? "" : fname,
				strerror(errno));

	return ret_val;
}


bool ProcessCmdLineArgs(CmdLineArgInfo* info, int argc, char* argv[])
{
	bool ret_val = true;
	int i;
	for(i = 0; i < argc; i++)
	{
		if ( *argv[i] == '-' )
		{
			int j;
			for(j = 0; info[j].argname != NULL; j++)
			{
				if ( !info[j].bFound && !strcmp(info[j].argname, argv[i]) )
				{
					int Index = j;
					if ( info[j].AliasIndex >= 0 )
						Index = info[j].AliasIndex;
					info[Index].bFound = true;
					if ( argc > (i + 1) && *argv[i + 1] != '-' )
						info[Index].value = argv[i + 1];
					break;
				}
			}
		}
	}
	
	for(i = 0; info[i].argname != NULL; i++)
	{
		if ( info[i].AliasIndex < 0 )
		{
			if ( info[i].bRequired && !info[i].bFound )
			{
				fprintf(stderr, 
						"Required option %s is not found\n",
						info[i].argname);
				ret_val = false;
				break;
			}

			if ( info[i].bFound 
					&& 
				 info[i].bMustHaveValue 
				    && 
				 !info[i].value )
			{
				fprintf(stderr, 
						"Option %s must have value\n",
						info[i].argname);
				ret_val = false;
				break;
			}
		}
	}
	
	return ret_val;
}



HashTableInfo* HashTable_Make(int Size, 
							  unsigned long (*HashFunc)(void*, void*), 
						      void* HashFuncParam,
     						  bool FindCallback(DLinkNode*, void*, void*, void*),
						      void* p1,
						      void* p2,
						      void* p3)
{
	HashTableInfo* info = (HashTableInfo*)malloc(sizeof(HashTableInfo));
	HashTable_Init(info, Size, HashFunc, HashFuncParam, FindCallback, p1, p2, p3);
	return info;
}

void HashTable_Init(HashTableInfo* info,
					int Size, 
					unsigned long (*HashFunc)(void*, void*), 
					void* HashFuncParam,
					bool FindCallback(DLinkNode*, void*, void*, void*),
					void* p1,
					void* p2,
					void* p3)
{
	int i;
	info->HashFunc = HashFunc;
	info->HashFuncParam = HashFuncParam;
	info->Size = Size;
	info->PrevNode = NULL;
	info->NextListIndex = info->Size;

	info->ListArray = malloc(info->Size * sizeof(DLinkList));
	for(i = 0; i < info->Size; i++)
	{
		InitDLinkList(&info->ListArray[i], DisposeNodeCallback, NULL);
		SetFindCallBack(&info->ListArray[i], FindCallback, p1, p2, p3);
	}
}

void HashTable_Dispose(HashTableInfo* info)
{
	int i;
	for(i = 0; i < info->Size; i++)
		DLinkList_RemoveAll(&info->ListArray[i]);
	free(info->ListArray);
	free(info);
}


bool HashTable_DwordLookupCallback(DLinkNode* node, void* p1, void* p2, void* p3)
{
	return (((HashTableEntry*)node)->Key == p1);
}


HashTableEntry* HashTable_DoLookup(HashTableInfo* info, int index, void* key)
{
	DLinkNode* node = DLinkList_Find(&info->ListArray[index], 0, false);
	return (HashTableEntry*)node;
}


bool HashTable_Add(HashTableInfo* info, void* key, void* val)
{
	int index;
	HashTableEntry* entry;

	HashTable_Remove(info, key);
	
	if ( (entry = (HashTableEntry*)malloc(sizeof(HashTableEntry))) != NULL )
	{
		entry->Key = key;
		entry->Node.data = val;
	
		index = info->HashFunc(key, info->HashFuncParam) % info->Size;
		DLinkList_AddHead(&info->ListArray[index], &entry->Node);
	}
	return (entry != NULL);
}

bool HashTable_Remove(HashTableInfo* info, void* key)
{
	bool ret_val = false;
	int index = info->HashFunc(key, info->HashFuncParam) % info->Size;
	HashTableEntry* entry = HashTable_DoLookup(info, index, key);
	if ( entry )
	{
		DLinkList_RemoveNode(&info->ListArray[index], &entry->Node);
		ret_val = true;
	}

	return ret_val;
}

bool HashTable_Lookup(HashTableInfo* info, void* key, void** valptr)
{
	int index = info->HashFunc(key, info->HashFuncParam) % info->Size;
	HashTableEntry* entry = HashTable_DoLookup(info, index, key);
	
	if ( entry && valptr )
		*valptr = entry->Node.data;

	return (entry != NULL);
}


bool HashTable_First(HashTableInfo* info, void** keyptr, void** valptr)
{
	info->PrevNode = NULL;
	info->NextListIndex = 0;
	return HashTable_Next(info, keyptr, valptr);
}

bool HashTable_Next(HashTableInfo* info, void** keyptr, void** valptr)
{
	for(; info->NextListIndex < info->Size; info->NextListIndex++)
	{
		if ( info->PrevNode )
			info->PrevNode = DLinkList_GetNext(&info->ListArray[info->NextListIndex], 
											   info->PrevNode);
		else
			info->PrevNode = DLinkList_GetHead(&info->ListArray[info->NextListIndex]);
	
		if ( info->PrevNode != NULL )
		{
			*keyptr = ((HashTableEntry*)info->PrevNode)->Key;
			*valptr = ((HashTableEntry*)info->PrevNode)->Node.data;
			break;
		}
	}

	return (info->PrevNode != NULL);
}




unsigned long MakeDwordHash(void* key, void* param)
{
	return ((unsigned long)key >> 4);
}

