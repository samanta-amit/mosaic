#!/bin/bash

start=`date +%s`
for i in {1..4}
   do
   taskset -c $i ./memory_write $i &
done

for i in {5..20}
   do
   taskset -c $i ./memory_read $i &
done
#taskset -c 1 python3 /home/samantam/mosaic/workloads/synthetic/memory-new.py --log_steps 10
#& taskset -c 2 python3 /home/samantam/mosaic/workloads/synthetic/memory-new.py --log_steps 10
end=`date +%s`

duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`
echo "Script Execution Time: $execution_time"

wait

echo "All done"
