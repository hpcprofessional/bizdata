#!/bin/bash
LOCAL='http://localhost:8080'

ALL_NODES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=num-nodes'
ALL_RES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=num-resources'
AVG_RES_PER_NODE='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=avg-resources-per-node'
PCT_DUP_RES='/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=pct-resource-dupes'

TARGET=$LOCAL

echo -n "Nodes managed:"
curl ${TARGET}{$ALL_NODES}
echo ""
echo -n "Total resources managed:"
curl ${TARGET}{$ALL_RES}
echo ""
echo -n "Average resources/node:"
curl ${TARGET}{$AVG_RES_PER_NODE}
echo ""

