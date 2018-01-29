!/bin/bash

# Returns the bumped version based on last existing tag
# Tags get sorted using 'sort -V'
# If no tags are present, the initial version will be 0.1.0
# Expects arguments:
#  - the relative/absolute repository location
#  - the part of the version to increase: major/minor/patch (default is patch)


repository=${1}
increase=${2:patch}

cd ${repository}

git fetch --tags 2>/dev/null
last_tag=$(git tag | sort -Vr | head -1)

# Catch no tags case

if [ -z "${last_tag}" ]; then
    echo "0.1.0"
else

    a=( ${last_tag//./ } )   # replace points, split into array

    case ${increase} in
      patch)
        ((a[2]++))
        ;;
      minor)
        ((a[1]++))
        a[2]=0
        ;;
      major)
        ((a[0]++))
        a[1]=0
        a[2]=0
        ;;
    esac

    echo "${a[0]}.${a[1]}.${a[2]}" 
fi