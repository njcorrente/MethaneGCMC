for ndir in ./*/
do
cd $ndir
for pdir in ./*/
do
cp $pdir/Restart/System_0/restart_* $pdir/RestartInitial/System_0/
cd $pdir/RestartInitial/System_0
sed -i '' 's/41.850000000000/42.250000000000/g' restart_*
pwd
cd ../../../
done
cd ../
done 
cd ../
