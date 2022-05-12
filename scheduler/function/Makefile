function_memory: main.c monotonic_timer.c functions.c
	gcc -O3 -march=native $^ -o $@ -fopenmp -DWITH_OPENMP

.PHONY: run
run: function_memory
	./function_memory
	

