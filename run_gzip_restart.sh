PREV_JOB=$1
DATARATE=$2
new_workdir="/data/results/$JOB_ID/ckpt"
prev_workdir="/data/results/$PREV_JOB/ckpt"
mkdir -p $new_workdir
cp -Pr $prev_workdir/* $new_workdir
env=$new_workdir/dmtcp_env.txt
cp dmtcp_env_template.txt $env
sed -i -e "s/__DATARATE__/$DATARATE/g" $env
sed -i -e 's/__DELAY__/2ms/g' $env
$new_workdir/dmtcp_restart_script.sh --ckptdir $new_workdir
