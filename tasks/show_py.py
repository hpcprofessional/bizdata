#!/bin/python

LOCAL='http://localhost:8080'
#TODO: Remote

ALL_NODES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=num-nodes'
ALL_RES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=num-resources'
AVG_RES_PER_NODE='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=avg-resources-per-node'
PCT_DUP_RES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=pct-resource-dupes'

#Need tasks/plans info
#Need specific resource counts

TARGET=$LOCAL

#echo -n "Nodes managed: "
#DATA_ALL_NODES=$(curl ${TARGET}{$ALL_NODES} | grep -Eo "[0-9]+" 2>/dev/null)
#echo "$DATA_ALL_NODES"
#echo -n "Total resources managed: "
#DATA_ALL_RES=$(curl ${TARGET}{$ALL_RES} | grep -Eo "[0-9]+" 2>/dev/null)
#echo "$DATA_ALL_RES"
#echo -n "Average resources/node: "
#DATA_AVG_RES_PER_NODE=$(curl ${TARGET}{$AVG_RES_PER_NODE} | grep -Eo "[0-9]+" 2>/dev/null)
#echo ">>$DATA_AVG_RES_PER_NODE<<"
#
#PUPPET_RUNS_DAY=48
#SEC_SAVED_PER_RESOURCE=1
#HOURLY_WAGE=50
#let "TIME_SAVED_SS= $DATA_ALL_RES * $PUPPET_RUNS_DAY * $SEC_SAVED_PER_RESOURCE"
#TIME_SAVED_DDHHMMSS=$(printf '%dd:%dh:%dm:%ds\n' $(($TIME_SAVED_SS/86400)) $(($TIME_SAVED_SS%86400/3600)) $(($TIME_SAVED_SS%3600/60)) $(($TIME_SAVED_SS%60)) )
#COST_SAVINGS_DAY=$(echo "scale = 2; $TIME_SAVED_SS * $HOURLY_WAGE / 3600" | bc)
#COST_SAVINGS_WEK=$(echo "scale = 2; $TIME_SAVED_SS * $HOURLY_WAGE / 3600 * 5" | bc)
#COST_SAVINGS_QRT=$(echo "scale = 2; $TIME_SAVED_SS * $HOURLY_WAGE / 3600 * 5 * 13" | bc)
#COST_SAVINGS_ANN=$(echo "scale = 2; $TIME_SAVED_SS * $HOURLY_WAGE / 3600 * 5 * 52" | bc)
#COST_SAVINGS_DAY_PP=$(printf "%'.2d\n" $COST_SAVINGS_DAY)
#COST_SAVINGS_WEK_PP=$(printf "%'.2d\n" $COST_SAVINGS_WEK)
#COST_SAVINGS_QRT_PP=$(printf "%'.2d\n" $COST_SAVINGS_QRT)
#COST_SAVINGS_ANN_PP=$(printf "%'.2d\n" $COST_SAVINGS_ANN)
#CURRENCY='¤'
#
#echo "Daily time savings assuming ${PUPPET_RUNS_DAY} runs/day and ${SEC_SAVED_PER_RESOURCE} sec per resource (in sec): ${TIME_SAVED_SS}"
#echo "Daily time savings assuming above represented in DD:HH:MM:SS: ${TIME_SAVED_DDHHMMSS}"
#echo "Daily cost savings assuming an hourly wage of ${CURRENCY}${HOURLY_WAGE}: ${CURRENCY}${COST_SAVINGS_DAY_PP}"
#echo "Weekly cost savings: ${CURRENCY}${COST_SAVINGS_WEK_PP}"
#echo "Quarterly cost savings: ${CURRENCY}${COST_SAVINGS_QRT_PP}"
#echo "Annual cost savings: ${CURRENCY}${COST_SAVINGS_ANN_PP}"
