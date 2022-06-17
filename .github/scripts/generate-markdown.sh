echo "Script start"
cd ~.flutter_driver_test_sample
ls
echo "\n\n navigate to screenshoots \n\n"
cd test/failures
ls
echo "start writing to file:::"
touch files.txt
 
for entry in  *.png ; do
   #https://stackoverflow.com/a/50428634
   echo "![$entry]( https://firebasestorage.googleapis.com/v0/b/undeground-ji2/o/failures%2F$entry?alt=media )" >> files.txt
done