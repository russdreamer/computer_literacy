#!/bin/bash

function checkStructure_before {
	echo "Checking GIT structure..."

	if test ! -f conflict.txt; then
		echo "--------------------------------"
		echo "\"conflict.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -d work; then
		echo "--------------------------------"
		echo "\"work\" dirrectory is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	FILES_NUM=$((`ls -A work | wc -l`))
	if [[ $FILES_NUM -ne 2 ]]; then
		echo "--------------------------------"
		echo "There are $FILES_NUM elements in the \"work\" directory before your commands start. 2 are expected (actions.sh, personal info.txt). Check hidden files"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f work/personal\ info.txt; then
		echo "--------------------------------"
		echo "\"personal info.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f work/action.sh; then
		echo "--------------------------------"
		echo "\"action.sh\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	echo "GIT structure is correct!"
}

function checkStructure_after {

	FILES_NUM=$((`ls | wc -l`))
	if [[ $FILES_NUM -ne 3 ]]; then
		echo "--------------------------------"
		echo "There are $FILES_NUM elements in the \"work\" directory after your commands start. 3 are expected (actions.sh, personal info.txt, employee.info)."
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f personal\ info.txt; then
		echo "--------------------------------"
		echo "\"personal info.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f action.sh; then
		echo "--------------------------------"
		echo "\"action.sh\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f employee.info; then
		echo "--------------------------------"
		echo "\"employee.info\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

}

function checkConflict {
	echo "Checking conflict.txt file..."
	CONTENT_EXPECTED=$'3 + 4 = 7\n12 - 2 = 10\n7 + 2 = 9\n12 + 4 = 16\n0 + 0 = 0\n45 - 5 = 40\n10 + 10 = 20\n12 - 2 = 10'

	CONTENT_ACTUAL=`cat conflict.txt | grep -v -e '^$'`
	if [[ "$CONTENT_EXPECTED" != "$CONTENT_ACTUAL" ]]; then
		echo "--------------------------------"
		echo "Wrong \"conflict.txt\" file's content."
		echo "Difference:"
		diff <(echo -e "$CONTENT_EXPECTED") <(echo -e "$CONTENT_ACTUAL") 
		echo "--------------------------------"
		exit 1
	fi

	echo "The conflict.txt file is correct!"
}

function fillPersons {
	printf "$1">personal\ info.txt
}

function checkGit {
	if test ! -d .git; then
		echo "--------------------------------"
		echo "\"work\" directory isn't a git repository. You have to initialize git there."
		echo "--------------------------------"
		exit 1
	fi

	BRANCHES_NUM=$((`git branch | wc -l`))
	if [[ $BRANCHES_NUM -ne 1 ]]; then
		echo "--------------------------------"
		echo "You have to have 1 branch at the end of your script. $BRANCHES_NUM branches are found"
		echo "--------------------------------"
		exit 1
	fi

	BRANCH_NAME=`git for-each-ref --format='%(refname:short)' refs/heads | head -1`
	if [[ "master" != "$BRANCH_NAME" ]]; then
		echo "--------------------------------"
		echo "Your branch has to be named as \"master\", but actial name is \"$BRANCH_NAME\"."
		echo "--------------------------------"
		exit 1
	fi

	COMMITS_NUM=$((`git log --oneline | wc -l`))
	if [[ $COMMITS_NUM -ne 3 ]]; then
		echo "--------------------------------"
		echo -e "Wrong number of commits. \n--Expected:\n4\n--Actual:\n$COMMITS_NUM"
		git log --oneline
		echo "--------------------------------"
		exit 1
	fi

	COMMIT1=`git log --oneline | tail -1 | cut -f2- -d " "`
	COMMIT_EXPECTED="add basic information"
	if [[ "$COMMIT_EXPECTED" != "$COMMIT1" ]]; then
		echo "--------------------------------"
		echo -e "Your first commit has wrong message. \n--Expected:\n$COMMIT_EXPECTED\n--Actual:\n$COMMIT1"
		echo "--------------------------------"
		exit 1
	fi

	COMMIT2=`git log --oneline | tail -2 | head -1 | cut -f2- -d " "`
	COMMIT_EXPECTED="add education info"
	if [[ "$COMMIT_EXPECTED" != "$COMMIT2" ]]; then
		echo "--------------------------------"
		echo -e "Your second commit has wrong message. \n--Expected:\n$COMMIT_EXPECTED\n--Actual:\n$COMMIT2"
		echo "--------------------------------"
		exit 1
	fi

	COMMIT3=`git log --oneline |  tail -3 | head -1 | cut -f2- -d " "`
	COMMIT_EXPECTED="add work experience info"
	if [[ "$COMMIT_EXPECTED" != "$COMMIT3" ]]; then
		echo "--------------------------------"
		echo -e "Your third commit has wrong message. \n--Expected:\n$COMMIT_EXPECTED\n--Actual:\n$COMMIT3"
		echo "--------------------------------"
		exit 1
	fi
}

function checkScript1 {
	echo "starting action.sh..."
	ERROR=$(sh action.sh 2>&1 1>/dev/null)
	test $? -eq 1 && test "$ERROR" != "" && { echo -e "action.sh ran with an error: \n $ERROR"; exit 1; } || echo "action.sh has been completed"
	echo "Checking action.sh result..."

	checkStructure_after
	checkGit

	CONTENT_EXPECTED="name: Kevin
sex: male
age: 26
education: MIT, Cambridge, USA
work: Consultant at Itera, Oslo, Norway"

	CONTENT_ACTUAL=`cat employee.info | grep -v -e '^$'`
	if [[ "$CONTENT_EXPECTED" != "$CONTENT_ACTUAL" ]]; then
		echo "--------------------------------"
		echo "Wrong \"employee.info\" file's content."
		echo "Difference:"
		diff <(echo -e "$CONTENT_EXPECTED") <(echo -e "$CONTENT_ACTUAL") 
		echo "--------------------------------"
		exit 1
	fi
}

function checkScript2 {
	echo "starting action.sh..."
	ERROR=$(sh action.sh 2>&1 1>/dev/null)
	test $? -eq 1 && test "$ERROR" != "" && { echo -e "action.sh ran with an error: \n $ERROR"; exit 1; } || echo "action.sh has been completed"
	echo "Checking action.sh result..."

	checkStructure_after
	checkGit

	CONTENT_EXPECTED="name: Kevin
sex: male
age: 26
education: University of Bergen, Norway
work: Software Engineer at Google, Zurich, Switzerland"

	CONTENT_ACTUAL=`cat employee.info | grep -v -e '^$'`
	if [[ "$CONTENT_EXPECTED" != "$CONTENT_ACTUAL" ]]; then
		echo "--------------------------------"
		echo "Wrong \"employee.info\" file's content."
		echo "Difference:"
		diff <(echo -e "$CONTENT_EXPECTED") <(echo -e "$CONTENT_ACTUAL") 
		echo "--------------------------------"
		exit 1
	fi
}

LIST_1="name: Lucy
location: Oregon, USA
education: MIT, Cambridge, USA
work: QA Engineer, Amazon, USA

name: Jakob
location: Oslo, Norway
education: University of Bergen, Norway
work: Consultant at Itera, Oslo, Norway

name: Anatoly
location: Moscow, Russia
education: Belarusian State University, Minsk, Belorussia
work: out of employment"

LIST_2="name: Jakob
location: Oslo, Norway
education: University of Bergen, Norway
work: Consultant at Itera, Oslo, Norway

name: James
location: Zurich, Switzerland
education: Belarusian State University, Minsk, Belorussia
work: Software Engineer at Google, Zurich, Switzerland

name: Alex
location: Oregon, USA
education: MIT, Cambridge, USA
work: QA Engineer, Amazon, USA

name: Anatoly
location: Moscow, Russia
education: Belarusian State University, Minsk, Belorussia
work: out of employment"

checkStructure_before
checkConflict
git config --global user.email "student@example.com"
git config --global user.name "Student"
cd work
echo "************** TEST №1: **************"
fillPersons "$LIST_1"
checkScript1
rm employee.info .git
rm -r .git

echo "************** TEST №2: **************"
fillPersons "$LIST_2"
checkScript2

echo "--------------------------------"
echo "Congratulation! Everything went well!"
echo "--------------------------------"