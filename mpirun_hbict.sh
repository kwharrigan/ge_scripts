#SCRIPT_NAME="manet-routing-compare-checkpoint"
SCRIPT_NAME=$1
export TESTNAME="$JOB_ID"
workdir="/data/results/$JOB_ID"
mkdir $workdir
mkdir $workdir/ckpt
cd /data/ns-3-dev-git
dmtcp_launch --new-coordinator --hbict --ckptdir $workdir/ckpt mpirun -np 2 -hostfile /home/sgeadmin/hostfile ./waf --cwd=$workdir --run $SCRIPT_NAME
ls -la $workdir/ckpt/ckpt_$SCRIPT_NAME* | awk '{print $5,$9}' > $workdir/ckpt/sizes.csv
