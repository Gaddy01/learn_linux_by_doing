#!/bin/bash

top_values=($(awk -F, '{print $3}' satelite_temperature_data.csv | sort -r | tail -5)) 

if [ -f "$non_clean_5_lowest_temp"]
then
	rm non_clean_5_lowest_temp
	rm ../analyzed/top-5-lowest-temparatures.csv
fi

touch non_clean_5_lowest_temp

for i in {0..4} 	
do
	awk -v value="${top_values[i]}" '$0 ~ value' satelite_temperature_data.csv >> non_clean_5_lowest_temp 
done

sort non_clean_5_lowest_temp | uniq -u > ../analyzed/top-5-lowest-temparatures.csv
sort non_clean_5_lowest_temp | uniq -d >> ../analyzed/top-5-lowest-temparatures.csv
