#!/bin/sh

# Functions
# --------------------------------------------------------


usage(){
    echo "usage: ... [-e \"CRON=55 23 * * *\"] [-e \"ES_HOST=<hostname | ip>\"] [-e \"KEEP_DAYS=<number of days to keep indices>\"] [-e \"CLOSE_OLDER_THEN=<number of days to keep indices open>\"] [-e \"ACTION_FILE_PATH=<path to action file>\"] [-e \"CONFIG_FILE_PATH=<path to config file>\"] <image-name> [[-c command ] [-d] [-o] | [-h]]"
        echo "----------------------------------------------------------"
        echo `curator --help`
}


# Main
# --------------------------------------------------------

DEBUG=${DEBUG:-"0"}
DRYRUN=${DRYRUN:-""}

while [ "$1" != "" ]; do
    case $1 in
        -c | --command )        shift
                                COMMAND=$1
                                ;;
        -d | --debug )          DEBUG="1"
                                ;;
		-o | --dry-run )        DRYRUN="--dry-run"
                                ;;
        -h | --help )           usage
                                exit
                                ;;
        * )                     usage
                                exit 1
    esac
    shift
done

CRON=${CRON:-"55 23 * * *"}
ES_HOST=${ES_HOST:-"elasticsearch"}
KEEP_DAYS=${KEEP_DAYS:-"10"}
CLOSE_OLDER_THEN=${CLOSE_OLDER_THEN:-"7"}
CONFIG_FILE_PATH=${CONFIG_FILE_PATH:-"/config/config.yml"}
ACTION_FILE_PATH=${ACTION_FILE_PATH:-"/config/action.yml"}

COMMAND=${COMMAND:-"--config ${CONFIG_FILE_PATH} ${DRYRUN} ${ACTION_FILE_PATH}"}

if [ "$DEBUG" == "0" ]; then
        echo "${CRON} curator ${COMMAND}" >>/etc/crontabs/root
        crond -f -l 15
elif [ "$DEBUG" == "1" ]; then
        echo "Writing to /etc/crontabs/root: ${CRON} curator ${COMMAND}"
        echo "${CRON} curator ${COMMAND}" >>/etc/crontabs/root
        crond -f -d 8 -l 0
fi