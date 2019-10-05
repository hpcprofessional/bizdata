#!/bin/bash
LOCAL='http://localhost:8080'
REMOTE='not yet implemented'

ALL_MBEANS='/metrics/v1/mbeans'
ALL_NODES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=num-nodes'
ALL_RES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=num-resources'
AVG_RES_PER_NODE='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=avg-resources-per-node'
PCT_DUP_RES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=pct-resource-dupes'


#curl ${TARGET}{$QUERY}


ALL_RESOURCE_EVENTS='/pdb/query/v4/events'
ALL_CORRECTIVE_CHANGES="$ALL_RESOURCE_EVENTS --data-urlencode 'query=[\"=\", \"corrective_change\", true]'"


TARGET=$LOCAL
QUERY=$ALL_CORRECTIVE_CHANGES

echo ${TARGET}${QUERY}
curl -G ${TARGET}${QUERY}
