PREV_JOB=$1
DATARATE=$2
#export TESTNAME="$JOB_ID"
#workdir="/data/results/$JOB_ID"

workdir="/data/results/$PREV_JOB/ckpt"
cd $workdir
env=$workdir/dmtcp_env.txt
cp /data/dmtcp_env_template.txt $env
sed -i -e "s/__DATARATE__/$DATARATE/g" $env
sed -i -e 's/__DELAY__/2ms/g' $env
$workdir/dmtcp_restart_script.sh
