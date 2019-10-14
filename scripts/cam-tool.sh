#!/bin/bash
LOCAL='http://localhost:8080'

ALL_NODES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=num-nodes'
ALL_RES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=num-resources'
AVG_RES_PER_NODE='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=avg-resources-per-node'
PCT_DUP_RES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=pct-resource-dupes'

#Need tasks/plans info
#Need specific resource counts

TARGET=$LOCAL

echo -n "Nodes managed:"
DATA_ALL_NODES=$(curl ${TARGET}{$ALL_NODES} | grep -Eo "[0-9]+" 2>/dev/null)
echo "$DATA_ALL_NODES"
echo -n "Total resources managed:"
DATA_ALL_RES=$(curl ${TARGET}{$ALL_RES} | grep -Eo "[0-9]+" 2>/dev/null)
echo "$DATA_ALL_RES"
echo -n "Average resources/node:"
DATA_AVG_RES_PER_NODE=$(curl ${TARGET}{$AVG_RES_PER_NODE} | grep -Eo "[0-9]+" 2>/dev/null)
echo "$DATA_AVG_RES_PER_NODE"

PUPPET_RUNS_DAY=48
SEC_SAVED_PER_RESOURCES=15
HOURLY_WAGE=50
