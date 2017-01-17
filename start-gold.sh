/opt/gold/sbin/goldd start

if [ ${USER} != "gold" ]; then
    echo "Gold should not run as ${USER}"
    exit 1
fi

/opt/gold/sbin/goldd --stop
