#ifndef FUNCTIONS_H_
#define FUNCTIONS_H_

#include <stddef.h>

#ifdef __SSE4_1__
void write_memory_nontemporal_sse(void*, size_t);
void write_memory_sse(void*, size_t);
void read_memory_sse(void*, size_t);
#endif

#endif  // FUNCTIONS_H_
