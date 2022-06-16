echo "Script start"
cd ../..
ls
echo "\n\n navigate to screenshoots \n\n"
cd test/failures
ls

for entry in  *.png ; do
   echo "![$entry]( $(realpath $entry) )"
done