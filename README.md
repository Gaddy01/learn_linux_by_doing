# learn_linux_by_doing

sort satelite_temperature_data.csv | uniq -u
sort satelite_temperature_data.csv | uniq -d

awk -F, '{print $3}' satelite_temperature_data.csv | sort -r | head -5
awk -v value="${top_values[i]}" '$0 ~ value' satelite_temperature_data.csv >> non_clean_5_highest_temp 
sort non_clean_5_highest_temp | uniq -u > ../analyzed/top-5-highest-temperatures.csv
sort non_clean_5_highest_temp | uniq -d >> ../analyzed/top-5-highest-temperatures.csv

awk -F, '{print $3}' satelite_temperature_data.csv | sort -r | tail -5
awk -v value="${top_values[i]}" '$0 ~ value' satelite_temperature_data.csv >> non_clean_5_lowest_temp 
sort non_clean_5_lowest_temp | uniq -u > ../analyzed/top-5-lowest-temperatures.csv
sort non_clean_5_lowest_temp | uniq -d >> ../analyzed/top-5-lowest-temperatures.csv

awk '/Burundi/' satelite_temperature_data.csv
