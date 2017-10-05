mkdir ~/uncompressed
cd ~/Downloads
for i in $(ls| grep .tar)

do

echo $i
tar -xvf $i -C ~/uncompressed
rm -rf ~/Downloads/$i


done
