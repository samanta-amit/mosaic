#!/bin/bash
declare -a arr

start=`date +%s`
for i in {1..6}
   do
   taskset -c $i ./memory_profiler $i & # Put a function in the background
done
#taskset -c 1 python3 /home/samantam/mosaic/workloads/synthetic/memory-new.py --log_steps 10
#& taskset -c 2 python3 /home/samantam/mosaic/workloads/synthetic/memory-new.py --log_steps 10
end=`date +%s`

duration=$(echo "$(date +%s.%N) - $start" | bc)
execution_time=`printf "%.2f seconds" $duration`
echo "Script Execution Time: $execution_time"

#runtime=$(python -c "print(${end} - ${start})")
#runtime=$( echo "$end - $start" | bc -l )
#echo "Runtime was $runtime"
arr=($duration)

echo "array ${arr[@]}" 

sum=0
for i in ${arr[@]}
do
    sum=`expr $sum + $i`
done

echo $sum

wait
echo "All done"
