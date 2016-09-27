#!/bin/bash

readonly ARGS="$@"
readonly ARTILLERY_CONFIG="/tmp/vmLoadTestScript.json"
readonly TMP_DIR="/tmp"
readonly OUTPUT_DIRECTORY="/artillery"

runArtillery() {
    echo "Starting artillery..."
    cd "$TMP_DIR"
    artillery run $@ "$ARTILLERY_CONFIG"
}

generateReport() {
    echo "Generating report..."
    artillery report $TMP_DIR/artillery_report_*.json
    echo "Archiving report in $OUTPUT_DIRECTORY..."
    cp $TMP_DIR/artillery_report_*.{html,json} "$OUTPUT_DIRECTORY"
}

main() {
    runArtillery $@
    generateReport
}

main $ARGS
