#!/bin/bash

USERID=$(id -u)


if [ $USERID -ne 0 ]
then
    echo "Error : Please run this script with root access"
    exit 1
else
    echo "Script running with root access"
fi

dnf install mysql -y