#ifndef ONLY_WRITE_H_
#define ONLY_WRITE_H_

#include <stddef.h>

#ifdef __SSE4_1__
void write_memory_nontemporal_sse(void*, size_t);
void write_memory_sse(void*, size_t);
#endif

#endif  // ONLY_WRITE_H_
