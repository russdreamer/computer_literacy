#!/bin/bash

echo "Checking GIT structure..."

if test ! -d sh; then
	echo "--------------------------------"
	echo "\"sh\" dirrectory is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

cd sh

if test ! -f first.sh; then
	echo "--------------------------------"
	echo "first.sh file is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

if test ! -f second.sh; then
	echo "--------------------------------"
	echo "second.sh file is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

if test ! -f third.sh; then
	echo "--------------------------------"
	echo "third.sh file is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

FILES_NUM=$((`ls -A | wc -l`))
if [[ $FILES_NUM -ne 3 ]]; then
	echo "--------------------------------"
	echo "There are $FILES_NUM elements in the root repo directory. 3 are expected. Check hidden files"
	echo "--------------------------------"
	exit 1
fi

echo "GIT structure is correct!"

mkdir repo
cd repo

echo "starting first.sh..."
ERROR=$(sh ../first.sh 2>&1 1>/dev/null)
test "$ERROR" = "" && echo "first.sh has been completed" || { echo -e "first.sh ran with an error: \n $ERROR"; exit 1; }

echo "Checking first.sh result..."

if test ! -d work; then
	echo "--------------------------------"
	echo "work dirrectory is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

cd work

if test ! -f employees.list; then
	echo "--------------------------------"
	echo "employees.list file is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

EMLOYEES_NUM=$((`cat employees.list | grep -c '[^[:space:]]'`))

if [[ $EMLOYEES_NUM -ne 5 ]]; then
	echo "--------------------------------"
	echo "There are $EMLOYEES_NUM names in the employees.list file. 5 are expected."
	echo "--------------------------------"
	exit 1
fi

if test ! -d reports/2020/january/31/logitech/Europe/Netherlands/Utrecht/design/web\ design; then
	echo "--------------------------------"
	echo "\"reports/2020/january/31/logitech/Europe/Netherlands/Utrecht/design/web design/\" directories structure is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

if test ! -f reports/2020/january/31/logitech/Europe/Netherlands/Utrecht/design/web\ design/list.txt; then
	echo "--------------------------------"
	echo "list.txt file is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

if test ! -f reports/2020/january/31/logitech/Europe/Netherlands/Utrecht/design/web\ design/path.txt; then
	echo "--------------------------------"
	echo "path.txt file is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

LIST_CAT=$((`cat reports/2020/january/31/logitech/Europe/Netherlands/Utrecht/design/web\ design/list.txt | grep -c '[^[:space:]]'`))
if [[ $LIST_CAT -ne 0 ]]; then
	echo "--------------------------------"
	echo "list.txt have to be empty"
	echo "--------------------------------"
	exit 1
fi

PATH_CAT=`cat reports/2020/january/31/logitech/Europe/Netherlands/Utrecht/design/web\ design/path.txt`
PWD=`pwd`

if [ $PATH_CAT != $PWD ]; then
	echo "--------------------------------"
	echo "path.txt contains wrong path"
	echo "--------------------------------"
	exit 1
fi

echo "first.sh result is correct!"

cd ..
echo "starting second.sh..."
ERROR=$(sh ../second.sh 2>&1 1>/dev/null)
test "$ERROR" = "" && echo "second.sh has been completed" || { echo -e "second.sh ran with an error: \n $ERROR"; exit 1; }

echo "Checking second.sh result..."

if test ! -d work; then
	echo "--------------------------------"
	echo "work dirrectory is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

cd work

if test ! -f reports/2020/january/31/logitech/Europe/Netherlands/Utrecht/design/web\ design/list.txt; then
	echo "--------------------------------"
	echo "list.txt file is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

LS=`ls -A`
CAT_LS=`cat reports/2020/january/31/logitech/Europe/Netherlands/Utrecht/design/web\ design/list.txt`
if [[ $LS != $CAT_LS ]]; then
	echo "--------------------------------"
	echo -e "wrong list.txt file contents. \n--Expected:\n$LS\n--Actual:\n$CAT_LS"
	echo "--------------------------------"
	exit 1
fi

if test ! -f employees.list; then
	echo "--------------------------------"
	echo "employees.list file is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

EMLOYEES_NUM=$((`cat employees_backup.list | grep -c '[^[:space:]]'`))

if [[ $EMLOYEES_NUM -ne 6 ]]; then
	echo "--------------------------------"
	echo "There are $EMLOYEES_NUM lines in the employees_backup.list file. 6 are expected."
	echo "--------------------------------"
	exit 1
fi

EMLOYEES_FIRST_LINE=`cat employees_backup.list | head -n1`

if [ $EMLOYEES_FIRST_LINE != "Employees:" ]; then
	echo "--------------------------------"
	echo "employees_backup contains wrong text"
	echo "--------------------------------"
	exit 1
fi

echo "second.sh result is correct!"

cd ..
echo "starting third.sh..."
ERROR=$(sh ../third.sh 2>&1 1>/dev/null)
test "$ERROR" = "" && echo "third.sh has been completed" || { echo -e "third.sh ran with an error: \n $ERROR"; exit 1; }

echo "Checking third.sh result..."

if test ! -d work; then
	echo "--------------------------------"
	echo "work dirrectory is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

cd work

if test -d reports; then
	echo "--------------------------------"
	echo "reports dirrectory have to be removed"
	echo "--------------------------------"
	exit 1
fi

if test ! -d backups; then
	echo "--------------------------------"
	echo "backups dirrectory is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

if test -f employees_backup.list; then
	echo "--------------------------------"
	echo "employees_backup.list file have to be moved from work directory"
	echo "--------------------------------"
	exit 1
fi

if test ! -f backups/employees_backup.list; then
	echo "--------------------------------"
	echo "employees_backup.list file is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

if test ! -f show_all_files.sh; then
	echo "--------------------------------"
	echo "employees_backup.list file is not found or wrong located"
	echo "--------------------------------"
	exit 1
fi

RES=`./show_all_files.sh`
LS=`ls`

if [ "$RES" != "$LS" ]; then
	echo "--------------------------------"
	echo "wrong show_all_files.sh execution result. Check file permisssion for execution"
	echo "--------------------------------"
	exit 1
fi

echo "third.sh result is correct!"

echo "--------------------------------"
echo "Congratulation! Everything went well!"
echo "--------------------------------"
