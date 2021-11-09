import os

"""
while True:
    for i in range(0,100000000):
        Gig = 1024*1024*1024*2#A Gig multiplied by 2
        a = 787878788888888888888888888888 * (i * Gig)
        a = a * i
        print str(a)*2
"""


if __name__ == '__main__':
    d = {}
    i = 0;
    for i in range(0, 10000000):
        d[i] = 'A'*1024
        if i % 10000 == 0:
            print(i)
