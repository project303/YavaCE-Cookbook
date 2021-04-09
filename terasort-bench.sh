#!/bin/bash

USER_NAME=$(whoami)
MAP_REDUCE_EXAMPLE=/usr/yava/3.0.0.0-0000/hadoop-mapreduce/hadoop-mapreduce-examples.jar
FILE_ZIE=10000000

time yarn jar $MAP_REDUCE_EXAMPLE teragen $FILE_ZIE /user/$USER_NAME/teragen/input
time yarn jar $MAP_REDUCE_EXAMPLE terasort /user/$USER_NAME/teragen/input /user/$USER_NAME/teragen/output
time yarn jar $MAP_REDUCE_EXAMPLE teravalidate /user/$USER_NAME/teragen/output /user/$USER_NAME/teragen/validate

hdfs dfs  -rm -r -skipTrash /user/$USER_NAME/teragen
hdfs dfs -ls /user/$USER_NAME

