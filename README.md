# Build Scripts Helpers

Collection of scripts to help in the CI build process


## `bump_version.sh`
Returns the bumped version based on last existing tag
Tags get sorted using `sort -V`
If no tags are present, the initial version will be 0.1.0
Expects arguments:
 - the relative/absolute repository location
 - the part of the version to increase: major/minor/patch (default is patch)
