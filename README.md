# mosaic

## HPE PMEM Server 

```
ssh samantam@daosserver.labs.hpecorp.net
```

## AWS Login Page

https://federation-proxy.cloudbank.org/aws?account=281247964862

## Debugging tool

iotop -o -b -d 5\
iostat\
sudo debugfs -R stats /dev/sa1 | grep Lifetime\
https://github.com/opcm/pcm \
echo 'READ WRITE IO ENERGY'; sudo pcm 1 -nc 2>&1 | egrep 'SKT   0' \
PCM: https://github.com/opcm/pcm \
PCM to work: modprobe msr

