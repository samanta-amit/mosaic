#!/bin/bash

start=`date +%s`
for i in {1..32}
   do
   taskset -c $i ./function_memory $i & # Put a function in the background
done
#taskset -c 1 ./memory_profiler --log_steps 10 & taskset -c 2 ./memory_profiler --log_steps 10 & taskset -c 3 ./memory_profiler --log_steps 10 & taskset -c 4 ./memory_profiler --log_steps 10 & taskset -c 5 ./memory_profiler --log_steps 10 & taskset -c 6 ./memory_profiler --log_steps 10 & taskset -c 7 ./memory_profiler --log_steps 10 & taskset -c 8 ./memory_profiler --log_steps 10
#& taskset -c 2 python3 /home/samantam/mosaic/workloads/synthetic/memory-new.py --log_steps 10
end=`date +%s`

duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`
echo "Script Execution Time: $execution_time"

wait

echo "All done"
