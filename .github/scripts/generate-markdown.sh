echo "Script start"
cd ../../
ls
echo "\n\n navigate to screenshoots \n\n"
cd test/failures
ls
echo "start writing to file:::"
touch files.txt
 
for entry in  *.png ; do
   #https://stackoverflow.com/a/50428634
   echo "![$entry]( https://firebasestorage.googleapis.com/v0/b/undeground-ji2/o/failures%2F$entry?alt=media )" 
   #or
   # echo `<img width="300" alt="$entry" src="https://firebasestorage.googleapis.com/v0/b/undeground-ji2/o/failures%2F$entry?alt=media">` >> files.txt
done

echo "fff"
body="$(cat files.txt)"
body="${body//'%'/'%25'}"
body="${body//$'\n'/'%0A'}"
body="${body//$'\r'/'%0D'}" 
echo "body ${body}"
echo "::set-output name=body::$body"