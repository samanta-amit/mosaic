#include "./only_write.h"
#include <assert.h>
#include <stdint.h>
#include <string.h>

#ifdef __SSE4_1__
#include <smmintrin.h>
#endif


#ifdef __SSE4_1__
void write_memory_nontemporal_sse(void* array, size_t size) {
  __m128i* varray = (__m128i*) array;

  __m128i vals = _mm_set1_epi32(1);
  size_t i;
  for (i = 0; i < size / sizeof(__m128i); i++) {
    _mm_stream_si128(&varray[i], vals);
    vals = _mm_add_epi16(vals, vals);
  }
}

void write_memory_sse(void* array, size_t size) {
  __m128i* varray = (__m128i*) array;

  __m128i vals = _mm_set1_epi32(1);
  size_t i;
  for (i = 0; i < size / sizeof(__m128i); i++) {
    _mm_store_si128(&varray[i], vals);
    vals = _mm_add_epi16(vals, vals);
  }
}

#endif

