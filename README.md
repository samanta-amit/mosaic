# mosaic

## Debugging tool

iotop -o -b -d 5\
iostat\
sudo debugfs -R stats /dev/sa1 | grep Lifetime\
https://github.com/opcm/pcm\
echo 'READ WRITE IO ENERGY'; sudo pcm 1 -nc 2>&1 | egrep 'SKT   0'

## Hadoop and Hive Instructions

which hdfs dfsadmin -safemode leave

hdfs dfsadmin -report

netstat -ntlp

stop-all.sh

hdfs namenode -format

sbin/start-dfs.sh

sbib/start-yarn.sh

telnet localhost 9000 

sudo rm -rf /tmp/*

hdfs dfs -df -h

hdfs dfsadmin -report

benchmark/partioned

set hive.tez.java.opts=-XX:+PrintGCDetails -verbose:gc -XX:+PrintGCTimeStamps -XX:+UseNUMA -XX:+UseParallelGC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp/;

<property>
    <name>mapred.child.java.opts</name>
    <value>-Xmx4096m</value>
</property>

export HADOOP_OPTS="-Xmx4096m"




<configuration>
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn</value>
    </property>
    <property>
        <name>yarn.app.mapreduce.am.env</name>
        <value>HADOOP_MAPRED_HOME=${HADOOP_HOME}</value>
    </property>
    <property>
        <name>mapreduce.map.env</name>
        <value>HADOOP_MAPRED_HOME=${HADOOP_HOME}</value>
    </property>
    <property>
        <name>mapreduce.reduce.env</name>
        <value>HADOOP_MAPRED_HOME=${HADOOP_HOME}</value>
    </property>
</configuration>

## Spark and TPC-DS Instructions

### Running TPC-DS queries with Spark


For the Java Out-of-Memory Bug. Set the Variables at /spark/bin/spark-class
#### Set SPARK_MEM if it isn't already set since we also use it for this process
SPARK_MEM=${SPARK_MEM:-512m}\
export SPARK_MEM

#### Set JAVA_OPTS to be able to load native libraries and to set heap size
JAVA_OPTS="$OUR_JAVA_OPTS"\
JAVA_OPTS="$JAVA_OPTS -Djava.library.path=$SPARK_LIBRARY_PATH"\
JAVA_OPTS="$JAVA_OPTS -Xms$SPARK_MEM -Xmx$SPARK_MEM"\

https://github.com/IBM/spark-tpc-ds-performance-test/issues/32

Tested with Spark 2.4.5

Download Mirror: http://mirrors.myaegean.gr/apache/spark/spark-2.4.5/

Building With Hive and JDBC Support

./build/mvn -Pyarn -Phive -Phive-thriftserver -DskipTests clean package

TPC-DS kit to generate Dataset

https://github.com/gregrahn/tpcds-kit

Tool for TPC-DS queries

https://github.com/IBM/spark-tpc-ds-performance-test



