import time
import numpy as np
import csv
import mmap
import linecache
import pandas as pd

def handle(req):
    all_times = []
    d = {}
    i = 0;
    sum = 0;
    start_t = time.time()
    for i in range(0, 1000):
        d[i] = 'A'*1024
        if i % 10000 == 0:
            sum = i + 1024
            print(sum)
    data = pd.read_csv('country_classification.csv', low_memory=False)
    end_t = time.time()
    all_times.append(end_t - start_t)
    return all_times


