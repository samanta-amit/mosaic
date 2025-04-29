

## Debugging tool

iotop -o -b -d 5\
iostat\
sudo debugfs -R stats /dev/sa1 | grep Lifetime\
https://github.com/opcm/pcm \
echo 'READ WRITE IO ENERGY'; sudo pcm 1 -nc 2>&1 | egrep 'SKT   0' \
PCM: https://github.com/opcm/pcm \
PCM to work: modprobe msr

