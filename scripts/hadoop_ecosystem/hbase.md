# Set up ```HBase```

## Download & Install ```HBase```

```sh
cd /usr/local/hadoop_eco
wget http://apache.mirror.cdnetworks.com/hbase/stable/hbase-1.2.4-bin.tar.gz
tar zxvf hbase-1.2.4-bin.tar.gz
mv hbase-1.2.4 hbase
```
or make a ```link```:
```sh
ln -s hbase-1.2.4/ hbase
```

## ```.bashrc```
```sh
export HBASE_HOME=/usr/local/hadoop_eco/hbase
export PATH=$PATH:$HBASE_HOME
export PATH=$PATH:$HBASE_HOME/bin
```

## ```HBase``` Configuration

```sh
cd /usr/local/hadoop_eco/hbase
mkdir data
```

## Configure ```hbase-site.xml```

```sh
vi $HBASE_HOME/conf/hbase-site.xml 
```

```xml
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
        <property>
                <name>hbase.rootdir</name
                <value>hdfs://hd0m1:9000/hbase</value>
        </property>
        <property>
                <name>hbase.master</name
                <value>hd0m2:6000</value>
        </property>
        <property>
                <name>hbase.zookeeper.quorum</name
                <value>hd0m1,hd0m2,hd0s1,hd0s2,hd0s3,hd0s4</value>
        </property>
        <property>
                <name>hbase.zookeeper.property.dataDir</name
                <value>file:///usr/local/hadoop_eco/hbase/data</value>
        </property>
        <property>
                <name>hbase.cluster.distributed</name
                <value>true</value>
        </property>
        <property>
                <name>dfs.datanode.max.xcievers</name
                <value>4096</value>
        </property>
</configuration>
```

## Configure ```hbase-env.sh```

```sh
vi $HBASE_HOME/conf/hbase-env.sh 
```


IF ```ZOOKEEPER``` is not installed:
```sh
export HBASE_PID_DIR=/usr/local/hadoop_eco/hbase/pid/pids
export HBASE_MANAGES_ZK=false
export JAVA_HOME=$JAVA_HOME
```

## Configure```regionservers```

```sh
vi $HBASE_HOME/conf/regionservers
```
```sh
hd0m1
hd0m2
hd0s1
hd0s2
hd0s3
hd0s4
```

## Start ```HBase```

On ```HBase.Master```:
```sh
start-hbase.sh
```
In case you need to add hosts to known lists
```sh
yes
```

## Check ```HBase```
```sh
jps
hbase shell
```