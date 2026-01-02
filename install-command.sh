#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]
then
    echo "Error : Please run this script with root access"
    echo $USERID
    exit 1
else
    echo "Script running with root access"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
echo "installation success"
else
echo "installation failure"
fi
