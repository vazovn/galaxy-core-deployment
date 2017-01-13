# Setup GOLD PATH
if [ ! `echo $PATH | /bin/grep "gold/sbin"` ]; then
  export PATH=$PATH:/opt/test_gold/gold/sbin
fi
if [ ! `echo $PATH | /bin/grep "gold/bin"` ]; then
  export PATH=$PATH:/opt/test_gold/gold/bin
fi

# Setup Gold HOME
export GOLD_HOME=/opt/test_gold/gold
