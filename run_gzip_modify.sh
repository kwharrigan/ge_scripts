SCRIPT_NAME=$1
export TESTNAME="$JOB_ID"
workdir="/data/results/$JOB_ID"
mkdir -p $workdir/ckpt
cd /data/ns-3-dev-git
dmtcp_launch --modify-env --new-coordinator --no-hbict --ckptdir $workdir/ckpt ./waf --cwd=$workdir --run $SCRIPT_NAME
ls -la $workdir/ckpt/ckpt_$SCRIPT_NAME* | awk '{print $5,$9}' > $workdir/ckpt/sizes.csv
