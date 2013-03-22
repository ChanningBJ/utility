#!/bin/sh
# Will remove all shared memory of current user

ids=`ipcs | grep $USER | grep staff | grep ^m | awk '{print $2}' `
for id in $ids; do
    ipcrm -m $id
done