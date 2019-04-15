#!/bin/bash

#
#------------------------------------------------------------------------------
# echo pass params and print them to a log file and terminal
# with timestamp and $host_name and $0 PID
# usage:
# doLog "INFO some info message"
# doLog "DEBUG some debug message"
# doLog "WARN some warning message"
# doLog "ERROR some really ERROR message"
# doLog "FATAL some really fatal message"
#------------------------------------------------------------------------------
write_log(){
	type_of_msg=$(echo $*|cut -d" " -f1)
	msg=$(echo "$*"|cut -d" " -f2-)
	[[ $type_of_msg == DEBUG ]] && [[ $do_print_debug_msgs -ne 1 ]] && return
	[[ $type_of_msg == INFO ]] && type_of_msg="INFO " # one space for aligning
	[[ $type_of_msg == WARN ]] && type_of_msg="WARN " # as well

	# print to the terminal if we have one
	test -t 1 && echo " [$type_of_msg] `date "+%Y.%m.%d-%H:%M:%S %Z"` [$run_unit][@$host_name] [$$] ""$msg"

	# define default log file none specified in cnf file
	test -z $log_file && \
	mkdir -p $product_instance_dir/dat/log/bash && \
	log_file="$product_instance_dir/dat/log/bash/$run_unit.`date "+%Y%m"`.log"
	echo " [$type_of_msg] `date "+%Y.%m.%d-%H:%M:%S %Z"` [$run_unit][@$host_name] [$$] ""$msg" >> $log_file
}

#eof func doLog
