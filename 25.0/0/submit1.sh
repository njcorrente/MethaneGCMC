#!/bin/bash
#SBATCH --job-name=25.0C1low
#SBATCH --time=14-0:0
#SBATCH --output=25.0C1low.output
#SBATCH --error=25.0C1low.err
#SBATCH --partition=main
#SBATCH -n 16
#SBATCH --mail-user=amk410@scarletmail.rutgers.edu
#SBATCH --mail-type=END
#SBATCH --mem-per-cpu=3500
#SBATCH -N 1
MYHDIR=$PWD             # directory with input/output filesecho $MYHDIR
MYTMP="/scratch/$USER/$SLURM_JOB_ID"    # local scratch directory on the node
mkdir -p $MYTMP                     # create scratch directory on the node
cp -r $MYHDIR/*  $MYTMP           # copy the executable into the scratch
cd $MYTMP                           # run tasks in the scratch
for dir in $MYTMP/*/
do
	cd $dir
	echo $dir > output.txt
	./run &
	cd ../
done
wait
cp -r $MYTMP/* $MYHDIR           # copy the results data back into the home dir
rm -rf  $MYTMP                      # remove scratch directory
