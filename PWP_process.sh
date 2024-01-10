unzip PWP2022.zip
echo "unzip PWP2022.zip done"

# rename PWP2022 to PWP2024 to avoid "unnecessary operation"
mv PWP2022 PWP2024

# avoid same file name
declare -A prefix2suffix
prefix2suffix["IMG_"]="E"
prefix2suffix["MMA"]="Er"
prefix2suffix["SM__"]="Eri"
prefix2suffix["WJ2_"]="Eric"

echo "old name, new name" > rename_log.csv

# find all end with .JPG
for file in $(find ./PWP2024 -name "*.JPG"); do
    # get the number of the file name 
    filename=$(basename $file)
    prefix=$(echo $filename | sed -E 's/^([A-Z2].+?[A_])[0-9]+\.JPG$/\1/')
    number=$(echo $filename | sed -E 's/^.*[A-Z2].+?[A_]([0-9]+)\.JPG$/\1/')
    # rename the file
    mv "$file" "./PWP2024/PWP2024_000${number}${prefix2suffix[$prefix]}_ERIC.JPG"
    echo "$filename, PWP2024_000${number}${prefix2suffix[$prefix]}_ERIC.JPG" >> rename_log.csv
done
