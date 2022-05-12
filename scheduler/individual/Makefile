memory_write: main_write.c monotonic_timer.c only_write.c
	gcc -O3 -march=native $^ -o $@ -fopenmp -DWITH_OPENMP

.PHONY: run
run: memory_write
	./memory_write
	

