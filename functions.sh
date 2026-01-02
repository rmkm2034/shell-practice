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

VALIDATE(){

     if [ $1 -eq 0 ]
    then
        echo "installation for $2 is success"
    else
        echo "installation for $2 is failure"
        exit 1
    fi 
}
    

dnf list installed mysql

if [ $? -nq 0 ]
then
    echo "mysql is not installed , going to istalll now"
    dnf install mysql -y
    VALIDATE $? mysql 
else
    echo "mysql already installed"  
fi         

dnf list installed python3

if [ $? -nq 0 ]
then
    echo "mysql is not installed , going to istalll now"
    dnf install mysql -y
    VALIDATE $? python3 
else
    echo "python3 already installed"  
fi   

dnf list installed nginx

if [ $? -nq 0 ]
then
    echo "mysql is not installed , going to istalll now"
    dnf install mysql -y
    VALIDATE $? nginx 
else
    echo "nginx already installed"  
fi  
 