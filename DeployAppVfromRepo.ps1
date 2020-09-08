$PATfile = 'C:\Git\PAT'
$LocalRepositoryPath = 'c:\App-V'
$StudentAppVPath = $LocalRepositoryPath+'\REPO\PATH\APPVNAME.appv'

$PAT = Get-Content -Path $PATfile

set-location $LocalRepositoryPath
if (Test-Path -Path ($LocalRepositoryPath+'\REPO'))
    {
     set-location .\PATH
     git fetch
     git merge -X theirs
    }
else 
   {
     git clone https://$PAT@dev.azure.com/interceptvsts/RELEASE --branch BRANCHNAME --single-branch BRANCHNAME
    }

Get-AppvClientPackage | Remove-AppvClientPackage 
$Package = Add-AppvClientPackage -Path $StudentAppVPath | Publish-AppvClientPackage -Global
Mount-AppvClientPackage -PackageId $Package.PackageId -VersionId $Package.VersionId

remove-item 'C:\Users\Public\Desktop\*ISVNAME*'
copy-item 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\APPNAME\*ISVNAME*' 'C:\Users\Public\Desktop\'
