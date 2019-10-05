#!/bin/bash

curl -G http://localhost:8080/pdb/query/v4/events --data-urlencode 'query=["=", "corrective_change", true]' | python -m json.tool
