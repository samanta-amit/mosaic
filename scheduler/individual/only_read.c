#include "./only_read.h"
#include <assert.h>
#include <stdint.h>
#include <string.h>

#ifdef __SSE4_1__
#include <smmintrin.h>
#endif


#ifdef __SSE4_1__
void read_memory_sse(void* array, size_t size) {
  __m128i* varray = (__m128i*) array;
  __m128i accum = _mm_set1_epi32(0xDEADBEEF);
  size_t i;
  for (i = 0; i < size / sizeof(__m128i); i++) {
    accum = _mm_add_epi16(varray[i], accum);
  }

  assert(!_mm_testz_si128(accum, accum));
}
#endif

