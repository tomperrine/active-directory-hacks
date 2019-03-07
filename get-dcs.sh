#!/bin/bash

for i in `dig -t srv  _ldap._tcp.dc._msdcs.$1 | awk '{print $8}' | grep '\.$' ` ; do
    echo -n $i ' ' 
    dig +short $i
done > /tmp/$$.dclist

echo -n 'Net 43 DCs: '
grep ' 43' /tmp/$$.dclist | wc -l 

echo -n 'Non Net 43 DCs: '
grep -v ' 43' /tmp/$$.dclist | wc -l 

cat /tmp/$$.dclist
rm /tmp/$$.dclist





