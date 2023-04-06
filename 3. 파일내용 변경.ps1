cd abc-prj

git checkout stg
git pull

$build_gradle = Get-Content .\build.gradle -Raw

$cur_version = if($build_gradle -match "ims:(?<version>[0-9]+\.[0-9]+\.[0-9]+)")
{
    $Matches.version
}

$ver_nums = $cur_version -split "\."

$ver1 = [int]$ver_nums[0]
$ver2 = [int]$ver_nums[1]
$ver3 = [int]$ver_nums[2] + 1
if ($ver3 -gt 15)
{
	$ver2 = [int]$ver_nums[1] + 1
	$ver3 = 0
}

$new_version = "{0}.{1}.{2}" -f $ver1, $ver2, $ver3

echo "current version: $cur_version, new version: $new_version"
$answer = Read-Host -Prompt "continue? (y)"
if ($answer -ne "y") {exit}

$new_build_gradle = $build_gradle -replace "abc:[0-9]+\.[0-9]+\.[0-9]+", "abc:$new_version"
$new_build_gradle > .\build.gradle

git add build.gradle
git commit -m "$new_version-RELEASE"

$answer = Read-Host -Prompt "push now? (y)"
if ($answer -ne "y") {exit}

git push origin stg:stg
