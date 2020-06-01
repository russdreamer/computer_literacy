#!/bin/bash

function checkStructure {
	echo "Checking GIT structure..."

	if test ! -d work; then
		echo "--------------------------------"
		echo "\"work\" dirrectory is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	FILES_NUM=$((`ls -A work | wc -l`))
	if [[ $FILES_NUM -ne 2 ]]; then
		echo "--------------------------------"
		echo "There are $FILES_NUM elements in the \"work\" directory before your commands start. 2 are expected (actions.sh, persons.txt). Check hidden files"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f work/persons.txt; then
		echo "--------------------------------"
		echo "\"persons.txt\" file is not found or wrong located"
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

function fillPersons {
	printf "$1">work/persons.txt
}

function checkRest {
	cd work

	if test ! -f google\ site.html; then
		echo "--------------------------------"
		echo "\"google site.html\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	HTML_ACTUAL=`cat google\ site.html | wc -l`
	HTML_EXPECTED=`curl https://www.google.com 2>/dev/null | wc -l`

	if [[ $HTML_ACTUAL -ne $HTML_EXPECTED ]]; then
		echo "--------------------------------"
		echo "wrong \"google site.html\" file's content."
		echo "Difference:"
		diff <(echo "$HTML_EXPECTED") <(echo "$HTML_ACTUAL") 
		echo "--------------------------------"
		exit 1
	fi

	LINKS_EXPECTED=`curl https://github.com/russdreamer/computer_literacy 2>/dev/null | grep -E "<a(\s)+href"`
	LINKS_ACTUAL=`cat links.html`

	if [[ "$LINKS_EXPECTED" != "$LINKS_ACTUAL" ]]; then
		echo "--------------------------------"
		echo -e "wrong links.html file's content."
		echo "Difference:"
		diff <(echo "$LINKS_EXPECTED") <(echo "$LINKS_ACTUAL")
		echo "--------------------------------"
		exit 1
	fi

	BREW_VERSION=`brew -v`

	if ! [[ $BREW_VERSION ]]; then
		echo "--------------------------------"
		echo "Homebrew seems not to be installed. You have to install it via your action.sh file"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f tree_result.txt; then
		echo "--------------------------------"
		echo "tree_result.txt file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	TREE_VERSION=`tree --version`

	if ! [[ $TREE_VERSION ]]; then
		echo "--------------------------------"
		echo "\"tree\" command seems not to be installed. You have to install it via your action.sh file using Homebrew"
		echo "--------------------------------"
		exit 1
	fi

	TREE_RES=`tree`
	TREE_ACTUAL=`cat tree_result.txt`

	if [[ "$TREE_RES" != "$TREE_ACTUAL" ]]; then
		echo "--------------------------------"
		echo -e "wrong tree_result.txt file's content. \n--Expected:\n$TREE_RES\n--Actual:\n$TREE_ACTUAL"
		echo "--------------------------------"
		exit 1
	fi

	cd ..
}

function clearProject {
	find work -type f -not \( -name 'persons.txt' -or -name 'action.sh' \) -delete
}

function checkScript1 {
	cd work
	echo "starting action.sh..."
	ERROR=$(sh action.sh 2>&1 1>/dev/null)
	test $? -eq 1 && test "$ERROR" != "" && { echo -e "action.sh ran with an error: \n $ERROR"; exit 1; } || echo "action.sh has been completed"
	echo "Checking action.sh result..."

	if test ! -f content.txt; then
		echo "--------------------------------"
		echo "\"content.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	CONTENT_CAT=`cat content.txt`

	if [ "$CONTENT_CAT" != "" ]; then
		echo "--------------------------------"
		echo -e "\"content.txt\" contains wrong result. \n--Blank file is expected\n--Actual:\n$CONTENT_CAT"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f error.txt; then
		echo "--------------------------------"
		echo "\"error.txt\" file should be created as a result"
		echo "--------------------------------"
		exit 1
	fi

	ERROR_CAT=`cat error.txt`

	if [ "$ERROR_CAT" != "no entities" ]; then
		echo "--------------------------------"
		echo -e "wrong error.txt file's content. \n--Expected:\nno entities\n--Actual:\n$ERROR_CAT"
		echo "--------------------------------"
		exit 1
	fi

	cd ..
}

function checkScript2 {
	cd work
	echo "starting action.sh..."
	ERROR=$(sh action.sh 2>&1 1>/dev/null)
	test $? -eq 1 && test "$ERROR" != "" && { echo -e "action.sh ran with an error: \n $ERROR"; exit 1; } || echo "action.sh has been completed"
	echo "Checking action.sh result..."

	if test ! -f content.txt; then
		echo "--------------------------------"
		echo "\"content.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	CONTENT_NUM=`cat content.txt | grep -v -e '^$' | wc -l`
	CONTENT_ACT=`cat content.txt`
	CONTENT_EXP="Isabella Milestone	532 Nostrand Avenue\nIsabella Brown	63 Wall Street"

	if [ $CONTENT_NUM -ne 2 ]; then
		echo "--------------------------------"
		echo -e "\"content.txt\" contains wrong result. \n--Expected:\n$CONTENT_EXP\n--Actual:\n$CONTENT_ACT"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f 63_Wall_Street_1.txt; then
		echo "--------------------------------"
		echo "\"63_Wall_Street_1.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f 63_Wall_Street_2.txt; then
		echo "--------------------------------"
		echo "\"63_Wall_Street_2.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f 63_Wall_Street_3.txt; then
		echo "--------------------------------"
		echo "\"63_Wall_Street_3.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	STREET_CAT=`cat 63_Wall_Street_1.txt`
	STREET_EXP="Florance Anderson	63 Wall Street"

	if [ "$STREET_CAT" != "$STREET_EXP" ]; then
		echo "--------------------------------"
		echo -e "wrong 63_Wall_Street_1.txt file's content. \n--Expected:\n$STREET_EXP\n--Actual:\n$STREET_CAT"
		echo "--------------------------------"
		exit 1
	fi

	STREET_CAT=`cat 63_Wall_Street_2.txt`
	STREET_EXP="Peter Davidson	63 Wall Street"

	if [ "$STREET_CAT" != "$STREET_EXP" ]; then
		echo "--------------------------------"
		echo -e "wrong 63_Wall_Street_2.txt file's content. \n--Expected:\n$STREET_EXP\n--Actual:\n$STREET_CAT"
		echo "--------------------------------"
		exit 1
	fi

	STREET_CAT=`cat 63_Wall_Street_3.txt`
	STREET_EXP="Isabella Brown	63 Wall Street"

	if [ "$STREET_CAT" != "$STREET_EXP" ]; then
		echo "--------------------------------"
		echo -e "wrong 63_Wall_Street_3.txt file's content. \n--Expected:\n$STREET_EXP\n--Actual:\n$STREET_CAT"
		echo "--------------------------------"
		exit 1
	fi

	cd ..
}

function checkScript3 {
	cd work
	echo "starting action.sh..."
	ERROR=$(sh action.sh 2>&1 1>/dev/null)
	test $? -eq 1 && test "$ERROR" != "" && { echo -e "action.sh ran with an error: \n $ERROR"; exit 1; } || echo "action.sh has been completed"
	echo "Checking action.sh result..."

	if test ! -f content.txt; then
		echo "--------------------------------"
		echo "\"content.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	CONTENT_NUM=`cat content.txt | grep -v -e '^$' | wc -l`
	CONTENT_ACT=`cat content.txt`
	CONTENT_EXP="Isabella Milestone	532 Nostrand Avenue\nIsabella Brown	63 Wall Street"

	if [ $CONTENT_NUM -ne 2 ]; then
		echo "--------------------------------"
		echo -e "\"content.txt\" contains wrong result. \n--Expected:\n$CONTENT_EXP\n--Actual:\n$CONTENT_ACT"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f 63_Wall_Street_1.txt; then
		echo "--------------------------------"
		echo "\"63_Wall_Street_1.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f 63_Wall_Street_2.txt; then
		echo "--------------------------------"
		echo "\"63_Wall_Street_2.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f 63_Wall_Street_3.txt; then
		echo "--------------------------------"
		echo "\"63_Wall_Street_3.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	STREET_CAT=`cat 63_Wall_Street_1.txt`
	STREET_EXP="Florance Anderson	63 Wall Street"

	if [ "$STREET_CAT" != "$STREET_EXP" ]; then
		echo "--------------------------------"
		echo -e "wrong 63_Wall_Street_1.txt file's content. \n--Expected:\n$STREET_EXP\n--Actual:\n$STREET_CAT"
		echo "--------------------------------"
		exit 1
	fi

	STREET_CAT=`cat 63_Wall_Street_2.txt`
	STREET_EXP="no second line"

	if [ "$STREET_CAT" != "$STREET_EXP" ]; then
		echo "--------------------------------"
		echo -e "wrong 63_Wall_Street_2.txt file's content. \n--Expected:\n$STREET_EXP\n--Actual:\n$STREET_CAT"
		echo "--------------------------------"
		exit 1
	fi

	STREET_CAT=`cat 63_Wall_Street_3.txt`
	STREET_EXP="no third line"

	if [ "$STREET_CAT" != "$STREET_EXP" ]; then
		echo "--------------------------------"
		echo -e "wrong 63_Wall_Street_3.txt file's content. \n--Expected:\n$STREET_EXP\n--Actual:\n$STREET_CAT"
		echo "--------------------------------"
		exit 1
	fi

	cd ..
}

function checkScript4 {
	cd work
	echo "starting action.sh..."
	ERROR=$(sh action.sh 2>&1 1>/dev/null)
	test $? -eq 1 && test "$ERROR" != "" && { echo -e "action.sh ran with an error: \n $ERROR"; exit 1; } || echo "action.sh has been completed"
	echo "Checking action.sh result..."

	if test ! -f content.txt; then
		echo "--------------------------------"
		echo "\"content.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	CONTENT_NUM=`cat content.txt | grep -v -e '^$' | wc -l`
	CONTENT_ACT=`cat content.txt`
	CONTENT_EXP="Isabella Milestone	532 Nostrand Avenue\nIsabella Brown	63 Wall Street"

	if [ $CONTENT_NUM -ne 2 ]; then
		echo "--------------------------------"
		echo -e "\"content.txt\" contains wrong result. \n--Expected:\n$CONTENT_EXP\n--Actual:\n$CONTENT_ACT"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f 63_Wall_Street.txt; then
		echo "--------------------------------"
		echo "\"63_Wall_Street_1.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	STREET_CAT=`cat 63_Wall_Street.txt`
	STREET_EXP=`printf "Florance Anderson	63 Wall Street\nPeter Davidson	63 Wall Street\nIsabella Brown	63 Wall Street\nLucy Charles	63 Wall Street"`

	if [ "$STREET_CAT" != "$STREET_EXP" ]; then
		echo "--------------------------------"
		cat 63_Wall_Street.txt | wc
		printf "$STREET_EXP" | wc
		echo -e "wrong 63_Wall_Street.txt file's content. \n--Expected:\n$STREET_EXP\n--Actual:\n$STREET_CAT"
		echo "--------------------------------"
		exit 1
	fi

	cd ..
}

function checkScript5 {
	cd work
	echo "starting action.sh..."
	ERROR=$(sh action.sh 2>&1 1>/dev/null)
	test $? -eq 1 && test "$ERROR" != "" && { echo -e "action.sh ran with an error: \n $ERROR"; exit 1; } || echo "action.sh has been completed"
	echo "Checking action.sh result..."

	if test ! -f content.txt; then
		echo "--------------------------------"
		echo "\"content.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	CONTENT_NUM=`cat content.txt | grep -v -e '^$' | wc -l`
	CONTENT_ACT=`cat content.txt`
	CONTENT_EXP="Isabella Milestone	532 Nostrand Avenue\nIsabella Brown	63 Wall Street"

	if [ $CONTENT_NUM -ne 2 ]; then
		echo "--------------------------------"
		echo -e "\"content.txt\" contains wrong result. \n--Expected:\n$CONTENT_EXP\n--Actual:\n$CONTENT_ACT"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f 63_Wall_Street_1.txt; then
		echo "--------------------------------"
		echo "\"63_Wall_Street_1.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f 63_Wall_Street_2.txt; then
		echo "--------------------------------"
		echo "\"63_Wall_Street_2.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	if test ! -f 63_Wall_Street_3.txt; then
		echo "--------------------------------"
		echo "\"63_Wall_Street_3.txt\" file is not found or wrong located"
		echo "--------------------------------"
		exit 1
	fi

	STREET_CAT=`cat 63_Wall_Street_1.txt`
	STREET_EXP="Florance Anderson	63 Wall Street"

	if [ "$STREET_CAT" != "$STREET_EXP" ]; then
		echo "--------------------------------"
		echo -e "wrong 63_Wall_Street_1.txt file's content. \n--Expected:\n$STREET_EXP\n--Actual:\n$STREET_CAT"
		echo "--------------------------------"
		exit 1
	fi

	STREET_CAT=`cat 63_Wall_Street_2.txt`
	STREET_EXP="Isabella Brown	63 Wall Street"

	if [ "$STREET_CAT" != "$STREET_EXP" ]; then
		echo "--------------------------------"
		echo -e "wrong 63_Wall_Street_2.txt file's content. \n--Expected:\n$STREET_EXP\n--Actual:\n$STREET_CAT"
		echo "--------------------------------"
		exit 1
	fi

	STREET_CAT=`cat 63_Wall_Street_3.txt`
	STREET_EXP="no third line"

	if [ "$STREET_CAT" != "$STREET_EXP" ]; then
		echo "--------------------------------"
		echo -e "wrong 63_Wall_Street_3.txt file's content. \n--Expected:\n$STREET_EXP\n--Actual:\n$STREET_CAT"
		echo "--------------------------------"
		exit 1
	fi

	cd ..
}


LIST_1="Alex Johnes	45 Albee Square
Sandra Maloc	14 Broadway
Florance Anderson	63 Jamaica Avenue
Lisabella Milestone	532 Nostrand Avenue
Peter Davidson	62 Wall Street
Isabela Brown	3 Wall Street"

LIST_2="Alex Johnes	45 Albee Square
Sandra Maloc	14 Broadway
Florance Anderson	63 Wall Street
Isabella Milestone	532 Nostrand Avenue
Peter Davidson	63 Wall Street
Isabella Brown	63 Wall Street"

LIST_3="Alex Johnes	45 Albee Square
Sandra Maloc	14 Broadway
Florance Anderson	63 Wall Street
Isabella Milestone	532 Nostrand Avenue
Peter Davidson	63 Eastern Parkway
Isabella Brown	61 Wall Street"

LIST_4="Alex Johnes	45 Albee Square
Sandra Maloc	14 Broadway
Florance Anderson	63 Wall Street
Isabella Milestone	532 Nostrand Avenue
Peter Davidson	63 Wall Street
Isabella Brown	63 Wall Street
Ronald Cornes	418 Albee Square
Lucy Charles	63 Wall Street"

LIST_5="Alex Johnes	45 Albee Square
Sandra Maloc	14 Broadway
Florance Anderson	63 Wall Street
Isabella Milestone	532 Nostrand Avenue
Isabella Brown	63 Wall Street
Ronald Cornes	418 Albee Square"


checkStructure
echo "************** TEST №1: **************"
fillPersons "$LIST_1"
checkScript1
clearProject

echo "************** TEST №2: **************"
fillPersons "$LIST_2"
checkScript2
clearProject

echo "************** TEST №3: **************"
fillPersons "$LIST_3"
checkScript3
clearProject

echo "************** TEST №4: **************"
fillPersons "$LIST_4"
checkScript4

echo "************** TEST №5: **************"
fillPersons "$LIST_5"
checkScript5

checkRest
echo "--------------------------------"
echo "Congratulation! Everything went well!"
echo "--------------------------------"
