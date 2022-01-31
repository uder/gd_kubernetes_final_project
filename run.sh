#!/usr/bin/env bash

verb="$1"; shift
ARGS="apply -f"
FORCE=""
if [[ "$verb" == "down" ]]; then
    ARGS="delete -f"
    FORCE="--timeout=5s"
fi

BINARY=$(which kubectl)
CMD="$BINARY $ARGS"

$CMD manifests/pv-local.yaml $FORCE
$CMD manifests/cm-elasticsearch.yaml $FORCE 
$CMD manifests/deploy-elasticserach.yaml $FORCE
$CMD manifests/deploy-kibana.yaml $FORCE
$CMD manifests/deploy-redis.yaml $FORCE
$CMD manifests/deploy-websrv.yaml $FORCE
$CMD manifests/ingress-websrv.yaml $FORCE


