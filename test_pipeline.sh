action=$1
job=$2

function get_job_list () {
  echo "['a','b','c','d']"
}

function do_job () {
  local job_name=$1
  local sleep_time
  
  sleep_time=$(( ( RANDOM % 20 )  + 1 ))
  echo "Executing job \"${job_name}\", sleeping ${sleep_time}"
  sleep ${sleep_time}
}

if [ "${action}" == "get_job_list" ] ; then
  get_job_list
elif [ "${action}" == "do_job" ] ; then
  do_job ${job}
fi
