#include <assert.h>
#include <math.h>
#ifdef WITH_OPENMP
#include <omp.h>
#endif  // WITH_OPENMP
#include <stdlib.h>
#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <unistd.h>

#include "./functions.h"
#include "./monotonic_timer.h"

#define SAMPLES 5
#define TIMES 5
#define BYTES_PER_GB (1024*1024*1024LL)
#define SIZE (2*BYTES_PER_GB)
#define PAGE_SIZE (1<<12)

char array[SIZE + PAGE_SIZE] __attribute__((aligned (32)));

static inline double to_bw(size_t bytes, double secs) {
  double size_bytes = (double) bytes;
  double size_gb = size_bytes / ((double) BYTES_PER_GB);
  return size_gb / secs;
}

#ifdef WITH_OPENMP
#define timefunp(f) timeitp(f, #f)
void timeitp(void (*function)(void*, size_t), char* name) {
  double min = INFINITY;
  size_t i;
  for (i = 0; i < SAMPLES; i++) {
    double before, after, total;

    assert(SIZE % omp_get_max_threads() == 0);

    size_t chunk_size = SIZE / omp_get_max_threads();
#pragma omp parallel
    {
#pragma omp barrier
#pragma omp master
      before = monotonic_time();
      int j;
      for (j = 0; j < TIMES; j++) {
	function(&array[chunk_size * omp_get_thread_num()], chunk_size);
      }
#pragma omp barrier
#pragma omp master
      after = monotonic_time();
    }

    total = after - before;
    if (total < min) {
      min = total;
    }
  }

  //printf("\n %28s_omp: %5.2f GiB/s\n", name, to_bw(SIZE * TIMES, min));
  printf("\n time %f\n", min);
}
#endif  // WITH_OPENMP

#define timefun(f) timeit(f, #f)
void timeit(void (*function)(void*, size_t), char* name) {
  double min = INFINITY;
  size_t i;
  for (i = 0; i < SAMPLES; i++) {
    double before, after, total;

    before = monotonic_time();
    int j;
    for (j = 0; j < TIMES; j++) {
      function(array, SIZE);
    }
    after = monotonic_time();

    total = after - before;
    if (total < min) {
      min = total;
    }
  }

  //printf("%32s: %5.2f GiB/s\n", name, to_bw(SIZE * TIMES, min));
  printf("\n time %f\n", min);
}

int main() {
  memset(array, 0xFF, SIZE);  // un-ZFOD the page.
  * ((uint64_t *) &array[SIZE]) = 0;

#ifdef __SSE4_1__
  timefun(read_memory_sse);
#endif

#ifdef __SSE4_1__
  //timefun(write_memory_sse);
  timefun(write_memory_nontemporal_sse);
#endif

  return 0;
}
