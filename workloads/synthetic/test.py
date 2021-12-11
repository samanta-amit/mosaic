import numpy as np
import csv
import mmap
import linecache
import pandas as pd

def test():
    d = {}
    i = 0;
    with open('text.csv', 'r') as f:
        for i in range(0, 100000000):
            for j in range(0, 100000000):
                df=pd.read_csv('text.csv')
                df=pd.read_csv('text.csv')
                df=pd.read_csv('data/country_classification.csv')
                df=pd.read_csv('data/revised.csv')
                lines = f.readlines(2000000000)
                lines = f.readlines(2000000000)
                lines = f.readlines(2000000000)
                lines = f.readlines(2000000000)
                lines = f.readlines(2000000000)
                lines = f.readlines(2000000000)
                linecache.getline('text.csv', 10000000)
                i = i +1
                print(i)


t = test()

