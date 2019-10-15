#!/bin/bash
#Need alt to bc, e.g. "echo print 1/3. | python"
#Need agentless info (e.g. tasks/plans run, etc.)
#Need specific resource counts (e.g. some more valuable than others)

DAILY_RUNS=48
RESOURCE_SECONDS=10
RATE=50
CURRENCY='¤'

if [[ -n $PT_daily_runs ]]; then
  DAILY_RUNS=$PT_daily_runs
fi
if [[ -n $PT_resource_seconds ]]; then
  RESOURCE_SECONDS=$PT_resource_seconds
fi
if [[ -n $PT_rate ]]; then
  RATE=$PT_rate
fi
if [[ -n $PT_currency ]]; then
  CURRENCY=$PT_currency
fi

LOCAL='http://localhost:8080'
TARGET=$LOCAL

ALL_NODES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=num-nodes'
ALL_RES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=num-resources'
AVG_RES_PER_NODE='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=avg-resources-per-node'
PCT_DUP_RES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=pct-resource-dupes'

function get_integer () {
  echo $1 | grep -Eo "[0-9]+" 2>/dev/null
}

function to_ddhhmmss () {
  printf '%dd:%dh:%dm:%ds\n' $(($1/86400)) $(($1%86400/3600)) $(($1%3600/60)) $(($1%60)) 
}

function to_currency () {
  printf "%'.2d" $1
}

function to_commas () {
  printf "%'d" $1
}


echo "Source data from PuppetDB:"
DATA_ALL_RES=$(get_integer $(curl ${TARGET}${ALL_RES}))
echo "  ${DATA_ALL_RES} resources managed by Puppet Enterprise"
DATA_ALL_NODES=$(get_integer $(curl ${TARGET}${ALL_NODES}))
echo "  ${DATA_ALL_NODES} nodes actively managed via Puppet agent"
echo ""

let "TIME_DAY= $DATA_ALL_RES * $DAILY_RUNS * $RESOURCE_SECONDS"
let "TIME_WEK= $TIME_DAY * 7" 
let "TIME_QRT= $TIME_WEK * 13" 
let "TIME_ANN= $TIME_WEK * 52" 
COST_DAY=$(echo "scale = 2; $TIME_DAY * $RATE / 3600" | bc)
COST_WEK=$(echo "scale = 2; $TIME_WEK * $RATE / 3600" | bc)
COST_QRT=$(echo "scale = 2; $TIME_QRT * $RATE / 3600" | bc)
COST_ANN=$(echo "scale = 2; $TIME_ANN * $RATE / 3600" | bc)

echo "Values used for time and labor calculations:"
echo "  ${RESOURCE_SECONDS} seconds labor saved for each managed resource"
echo "  ${DAILY_RUNS} puppet runs per day for each node"
echo "  ${CURRENCY}${RATE} average hourly labor rate"
echo ""

echo "Time Savings:"
echo "  $(to_commas ${TIME_DAY}) seconds saved by Puppet daily ($(to_ddhhmmss $TIME_DAY))"
echo "  $(to_commas ${TIME_WEK}) seconds saved by Puppet weekly ($(to_ddhhmmss $TIME_WEK))"
echo "  $(to_commas ${TIME_QRT}) seconds saved by Puppet quarterly ($(to_ddhhmmss $TIME_QRT))"
echo "  $(to_commas ${TIME_ANN}) seconds saved by Puppet annually ($(to_ddhhmmss $TIME_ANN))"
echo ""

echo "Labor Savings:"
echo "  ${CURRENCY}$(to_currency $COST_DAY) saved by Puppet daily "
echo "  ${CURRENCY}$(to_currency $COST_WEK) saved by Puppet weekly "
echo "  ${CURRENCY}$(to_currency $COST_QRT) saved by Puppet quarterly "
echo "  ${CURRENCY}$(to_currency $COST_ANN) saved by Puppet annually "
