
def handle(req):
    d = {}
    i = 0;
    sum = 0;
    for i in range(0, 10000000):
        d[i] = 'A'*1024
        if i % 10000 == 0:
            sum = i + 1024
            print(sum)
    return sum


