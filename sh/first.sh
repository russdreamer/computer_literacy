mkdir work
cd work/
touch employees.list.txt
echo "Kate" > employees.list.txt
echo "Bob" >> employees.list.txt
echo "John" >> employees.list.txt
echo "Beta" >> employees.list.txt
echo "Zeta" >> employees.list.txt
mkdir -p reports/2020/january/31/logitech/Europe/Netherlands/Utrecht/design/web\ design/
cd reports/2020/january/31/logitech/Europe/Netherlands/Utrecht/design/web\ design/
touch list.txt
touch path.txt
myvar=`pwd`
echo $myvar > path.txt
cd ../../../../../../../../../../..