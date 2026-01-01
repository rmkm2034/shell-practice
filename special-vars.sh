#!/bin/bash

echo "All variables passed in the script : $@"
echo "number of variables : $#"
echo "script name : $0"
echo "current directory : $PWD"
echo "home directory : $HOME"
echo "user running in the script : $USER"
echo "PID of the script : $$"
sleep 10 &
echo "PID of last command in background : $!"