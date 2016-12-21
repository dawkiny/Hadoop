[← back to *Main Page*](https://github.com/dawkiny/Hadoop/blob/master/README.md)



# Set up ```Tez```

## Install Requirements
You might have already installed ```JDK6``` or later.

Install ```Maven3``` or later.

```sh
wget https://archive.apache.org/dist/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz
```

Install ```protobuf 2.5```  (**_2.5 version is MANDATORY_**)

```sh
cd /usr/local/hadoop_eco
wget https://github.com/google/protobuf/releases/download/v2.5.0/protobuf-2.5.0.tar.gz
tar -zxf protobuf-2.5.0.tar.gz 
mv protobuf-2.5.0 protobuf
cd protobuf-2.5.0/
sudo ./configure
sudo make
sudo make check
sudo make install
sudo ldconfig
protoc --version 
-------------------
libprotoc 2.5.0

```


## Download & Install ```Tez```

```sh
cd /usr/local/hadoop_eco
wget http://apache.mirror.cdnetworks.com/tez/0.8.4/apache-tez-0.8.4-src.tar.gz
tar -zxf apache-tez-0.8.4-src.tar.gz 
ln -s apache-tez-0.8.4-src tez
```

### Configure ```pom.xml```
Check & change ```Hadoop``` version in the top-level ```pom.xml``` to match the version of the ```Hadoop``` branch being used.
```sh
hadoop version
--------------------
Hadoop 2.7.2
Subversion https://git-wip-us.apache.org/repos/asf/hadoop.git -r b165c4fe8a74265c792ce23f546c64604acf0e41
Compiled by jenkins on 2016-01-26T00:08Z
Compiled with protoc 2.5.0
From source with checksum d0fda26633fa762bff87ec759ebe689c
This command was run using /usr/local/hadoop/share/hadoop/common/hadoop-common-2.7.2.jar
```

```sh
cd tez
vi pom.xml
```
```xml
    <hadoop.version>2.7.2</hadoop.version>
    <jetty.version>6.1.26</jetty.version>
    <pig.version>0.16.0</pig.version>

```


### Install ```Tez```
```sh
mvn clean package -DskipTests=true -Dmaven.javadoc.skip=true
```


## Configure ```~/.bashrc```

```sh
vi ~/.bashrc
```
```sh
# Tez
export TEZ_HOME=/usr/local/hadoop_eco/tez
export TEZ_JARS=$TEZ_HOME/tez-dist/target/tez-0.8.4-SNAPSHOT
export TEZ_CONF_DIR=$TEZ_JARS/conf
export HADOOP_CLASSPATH=$HADOOP_CLASSPATH:$TEZ_CONF_DIR:$TEZ_JARS/*:$TEZ_JARS/lib/*
```


## Configure ```tez-site.xml```
```sh
cd tez-dist/target/tez-0.8.4-SNAPSHOT
mkdir conf
vi conf/tez-site.xml
```
```xml
<?xml version="1.0" encoding="UTF-8"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<configuration>
    <property>
       <name>tez.lib.uris</name>
       <value>${fs.defaultFS}/apps/tez/tez-0.7.0-SNAPSHOT.tar.gz</value>
    </property>
    <property>
        <name>tez.use.cluster.hadoop-libs</name>
        <value>true</value>
    </property>
</configuration>
```
[[```tez-site.xml``` example]](https://github.com/dawkiny/Hadoop/edit/master/scripts/hadoop_ecosystem/tez-site.xml)

## Configure ```hdfs-site.xml```
```
cd 
```
```xml
<?xml version="1.0"?>
<!-- mapred-site.xml -->
<configuration>
    <property>
        <name>mapreduce.framework.name</name>
        <value>yarn-tez</value>
        <description>
        If running existing MapReduce jobs on Tez, "yarn-tez". or just "yarn"
        </description>
    </property>
</configuration>
```


[← back to *Main Page*](https://github.com/dawkiny/Hadoop/blob/master/README.md)