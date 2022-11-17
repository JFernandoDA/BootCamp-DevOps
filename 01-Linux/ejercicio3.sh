cd ~
echo $1
mkdir -p foo/dummy
cd foo
mkdir empty
cd dummy
if (( $# >= 1)); then
  echo $1 > file1.txt
else
  echo 'Que me gusta la bash!!!!' > file1.txt
fi
> file2.txt
cat file1.txt > file2.txt
mv file2.txt ../empty/