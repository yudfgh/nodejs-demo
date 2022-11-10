#!/bin/bash
while IFS="," read method api result extra;
do
if [[ "$extra" -eq 0 ]]
then
        echo Method:- $method, API:- $api, Result:- $result;
        status=$(curl -so /dev/null -w '%{response_code}' $api) || true

        echo Status :- $status

        if [[ "$result" == "$status" ]]
        then
                echo "API Pass"


        else

                echo "API Fail"
                exit 1;
        fi
else
        echo Method:- $method, API:- $api, Result:- $result;
        status=$(curl -so /dev/null -w '%{response_code}' $api) || true

        status="unkown"

        if [[ "$result" -eq "blackmask" ]]
        then
                        echo "API Pass"

        else

                        echo "API Fail"

        fi

fi
done < data_csv.csv
