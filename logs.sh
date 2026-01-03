#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executed at : $(date)" | tee -a &>>LOG_FILE


if [ $USERID -ne 0 ]
then
    echo -e "$R Error : Please run this script with root access $N" | tee -a &>>LOG_FILE
    echo $USERID tee -a &>>LOG_FILE
    exit 1
else
    echo "Script running with root access"
fi

VALIDATE(){

     if [ $1 -eq 0 ]
    then
        echo -e " $Y installation for $2 is success $N" | tee -a &>>LOG_FILE
    else
        echo "installation for $2 is failure"
        exit 1
    fi 
}
    

dnf list installed mysql  &>>LOG_FILE

if [ $? -ne 0 ]
then
    echo -e " $G mysql is not installed , going to istalll now $N" | tee -a &>>LOG_FILE
    dnf install mysql -y  &>>LOG_FILE
    VALIDATE $? mysql 
else
    echo "mysql already installed"  
fi         

dnf list installed python3  &>>LOG_FILE

if [ $? -ne 0 ]
then
    echo -e " $Y python3 is not installed , going to istalll now $N" | tee -a &>>LOG_FILE
    dnf install python3 -y  &>>LOG_FILE
    VALIDATE $? python3 
else
    echo "python3 already installed"  
fi   

dnf list installed nginx

if [ $? -ne 0 ]
then
    echo -e " $R nginx is not installed , going to istalll now $N"
    dnf install nginx -y
    VALIDATE $? nginx 
else
    echo "nginx already installed"  
fi  
 