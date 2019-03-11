#!/bin/bash

touch /tmp/$$.all-dcs

# get the naked top level
./get-dcs.sh sony.com >> /tmp/$$.all-dcs
# then all the sub domains
for i in am eu jp ; do
    echo "============" >> /tmp/$$.all-dcs
    ./get-dcs.sh $i.sony.com >> /tmp/$$.all-dcs
    echo >> /tmp/$$.all-dcs
done

cat /tmp/$$.all-dcs
rm /tmp/$$.all-dcs
