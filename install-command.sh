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

dnf list installed mysql

if [ $? -nq 0 ]
then
    echo "mysql is not installed , going to istalll now"
    dnf install mysql -y
        if [ $? -eq 0 ]
    then
        echo "installation success"
    else
        echo "installation failure"
        exit 1
    fi  
else
    echo "mysql already installed"
    exit 1
fi         

# dnf install mysql -y

# if [ $? -eq 0 ]
# then
#     echo "installation success"
# else
#     echo "installation failure"
#     exit 1
# fi    
 