# mosaic

which hdfs dfsadmin -safemode leave

stop-all.sh
hdfs namenode -format
sbin/start-dfs.sh
sbib/start-yarn.sh

telnet localhost 9000 
sudo rm -rf /tmp/*

hdfs dfs -df -h
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
