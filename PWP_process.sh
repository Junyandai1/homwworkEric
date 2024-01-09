unzip PWP2022.zip
echo "unzip PWP2022.zip done"
# find all files start with IMG
for file in $(find ./PWP2022 -type f -name "IMG*.JPG"); do
    # get the number of the file name 
    number=$(echo $file | sed -E 's/^.*IMG_([0-9]{4})\.JPG$/\1/')
    # rename the file
    mv "$file" "./PWP2022/PWP2024_${number}${number}E_ERIC.JPG"
    echo -e "rename $file to PWP2024_${number}${number}E_ERIC.JPG\r"
done
