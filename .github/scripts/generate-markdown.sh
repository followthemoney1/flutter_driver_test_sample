echo "Script start"
cd ~.flutter_driver_test_sample
ls
echo "\n\n navigate to screenshoots \n\n"
cd test/failures
ls
echo "start writing to file:::"
touch files.txt
 
for entry in  *.png ; do
   echo "![$entry]( $(realpath $entry) )" >> files.txt
done