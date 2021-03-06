#!/bin/bash
PROG=1
FILE="file_summary.txt"
TOTAL=$(cat ${FILE} | wc -l)
SCRIPT_NAME=$0

while read -r i; do
        PROG_PCT=$(echo "scale=2;($PROG/$TOTAL)*100" | bc | sed 's/\.[0-9][0-9]//')
        PROG_2=$(echo "scale=4;($PROG/$TOTAL*100)" | bc)
        PROG_f=$(echo "scale=2;($PROG_2/1)" | bc)
        FULL=100
        printf "${SCRIPT_NAME} |"
        for ((done=0; done<${FULL}; done++)); do
                if [[ "$done" -lt "$PROG_PCT" ]]; then
                        printf "▊"
                else
                        printf " "
                fi
        done
        printf "| ${PROG_f}%% (${PROG}/${TOTAL})\r"

        ## LOOP FUNCTION HERE

        #sleep 1
        let PROG++
done < ${FILE}
echo -e "\r"
