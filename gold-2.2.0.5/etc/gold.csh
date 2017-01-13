# Setup GOLD PATH
if ( "$PATH" !~  */gold/sbin* ) then
        setenv PATH "${PATH}:/opt/test_gold/gold/sbin"
endif
if ( "$PATH" !~  */gold/bin* ) then
        setenv PATH "${PATH}:/opt/test_gold/gold/bin"
endif

# Setup GOLD HOME
setenv GOLD_HOME /opt/test_gold/gold
