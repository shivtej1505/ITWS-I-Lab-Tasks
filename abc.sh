cd ~/Downloads
for a in $(ls -1 *.tar)
do tar -xvf $a -C ~/uncompressed
done
