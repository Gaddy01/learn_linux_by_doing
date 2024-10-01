#!/bin/bash

top_values=($(awk -F, '{print $3}' satelite_temperature_data.csv | sort -r | head -5)) 

if [ -f "$non_clean_5_highest_temp"]
then
	rm non_clean_5_highest_temp
	rm ../analyzed/top-5-highest-temperatures.csv
fi

touch non_clean_5_highest_temp

for i in {0..4} 	
do
	awk -v value="${top_values[i]}" '$0 ~ value' satelite_temperature_data.csv >> non_clean_5_highest_temp 
done

sort non_clean_5_highest_temp | uniq -u > ../analyzed/top-5-highest-temperatures.csv
sort non_clean_5_highest_temp | uniq -d >> ../analyzed/top-5-highest-temperatures.csv
