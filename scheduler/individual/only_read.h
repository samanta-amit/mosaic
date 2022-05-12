#ifndef ONLY_READ_H_
#define ONLY_READ_H_

#include <stddef.h>

#ifdef __SSE4_1__
void read_memory_sse(void*, size_t);
#endif

#endif  // ONLY_READ_H_
