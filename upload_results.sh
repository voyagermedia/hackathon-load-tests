#!/bin/bash
jq -c '.intermediate[] | {timestamp, scenariosCreated, scenariosCompleted, scenarioDuration, requestsCompleted, latency, rps, errors, codes} | {index: {_index: "loadtest", _type: "intermediate_result"}}, .' | curl -XPOST --data-binary @- -k "$ES_URL/_bulk"
