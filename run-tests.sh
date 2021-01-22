#!/bin/bash

rm -rf results;
mkdir results;
cd results;

gcc -g -Wall -o hb ../myhb.c -lpthread

######################################################################
# WARNING: we need sudo for perf and to set the priority of the process
# PERF SCHED GENERATES VERY BIG FILES!!!
######################################################################

for i in 150; do
	for j in 1 2 3 4 5; do
		let p=j*100
		sudo ./hb $i process $p > noperf-"$i"-"$j"
		sudo perf stat ./hb $i process $p 2> perf-stat-"$i"-"$j"
		sudo perf sched record -o perf-sched-"$i"-"$j" ./hb $i process $p
	done
done

for i in 150; do
	for j in 1 2 3 4 5; do
		let p=j*100
		sudo ./hb $i process $p 0 > no-prio-noperf-"$i"-"$j"
		sudo perf stat ./hb $i process $p 0 2> no-prio-perf-stat-"$i"-"$j"
		sudo perf sched record -o no-prio-perf-sched-"$i"-"$j" ./hb $i process $p
	done
done
