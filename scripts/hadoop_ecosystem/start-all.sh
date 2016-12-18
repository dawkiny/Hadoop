#--------------Start all ----------------#

# HDFS
start-dfs.sh


# Yarn
start-yarn.sh


# MR History Server
mr-jobhistory-daemon.sh start historyserver



# Zookeeper
zkServer.sh start
ssh dawkiny@hd0m2 "/usr/local/hadoop_eco/zookeeper/bin/zkServer.sh start"    
ssh dawkiny@hd0s1 "/usr/local/hadoop_eco/zookeeper/bin/zkServer.sh start" 
ssh dawkiny@hd0s2 "/usr/local/hadoop_eco/zookeeper/bin/zkServer.sh start" 
ssh dawkiny@hd0s3 "/usr/local/hadoop_eco/zookeeper/bin/zkServer.sh start" 
ssh dawkiny@hd0s4 "/usr/local/hadoop_eco/zookeeper/bin/zkServer.sh start" 


# HBase
start-hbase.sh


# Kafka
kafka-server-start.sh server.properties
ssh dawkiny@hd0m2 <(kafka-server-start.sh server.properties)
ssh dawkiny@hd0s1 <(kafka-server-start.sh server.properties)
ssh dawkiny@hd0s2 <(kafka-server-start.sh server.properties)
ssh dawkiny@hd0s3 <(kafka-server-start.sh server.properties)
ssh dawkiny@hd0s4 <(kafka-server-start.sh server.properties)