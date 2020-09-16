#!/bin/bash

# Reset and clean local working copy
#git reset --hard
#git clean -d -f

# define string pairs for replacement
declare -a arr=("HyBid,IQV"
                "PNLite,IQVY"
                "PubnativeLite,IQVZ"
                "Hybid,iqvx"
                "hyBid,iqvw"
                "Pubnativenet,Iqzone"
                )

for i in "${arr[@]}"
do
        OLD=$(echo $i | cut -f1 -d,)
        NEW=$(echo $i | cut -f2 -d,)
        echo "Replace all occurences of $OLD within files to $NEW"
        find . -type f \( -iname "*.storyboard" -or -iname "*.xib" -or -iname "*.swift" -or -iname "*.sh" -or -iname "*.xcworkspacedata" -or -iname "*.xcscheme" -or -iname "*.pbxproj" -or -iname "*.m" -or -iname "*.h" -or -iname "*.xib" -or -iname "*.plist" \) -print0 | xargs -0 sed -i '' -e 's/'"$OLD/$NEW"'/g'

        for x in 1 2 3
        do
                echo "pass $x: Rename files from $OLD to $NEW"
                find . -name "*$OLD*" -exec sh -c 'mv "$1" "$(echo "$1" | sed s/'"$OLD/$NEW"'/)"' _ {} \;
        done
done
