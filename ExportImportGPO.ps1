########################################################
# Name: ExportImportGPO.ps1
# Creator: Michael Seidl aka Techguy
# CreationDate: 31.03.2020
# LastModified:31.03.2020
# Version: 1.0
# Doc: http://www.techguy.at/tag/exportimportgpo/
#
# PowerShell Self Service Web Portal at www.au2mator.com/PowerShell
#
#
# Version 1.0 - RTM
########################################################
#
# www.techguy.at                                        
# www.facebook.com/TechguyAT                            
# www.twitter.com/TechguyAT  
# www.google.com/+TechguyAt                          
# michael@techguy.at 
########################################################


 Param(
   [Parameter(Mandatory=$True)]
   [ValidateSet("Export", "Import")] 
   [string]$Mode #Possible Modes: Export, Import
)
 

import-module grouppolicy
$ExportFolder="c:\_GPO\"
$Importfolder="c:\_GPO\"
$PreName=""
$PostName=""
 

 function Export-GPOs {
 $GPO=Get-GPO -All
 
 foreach ($Entry in $GPO) {
 $Path=$ExportFolder+$entry.Displayname
 New-Item -ItemType directory -Path $Path
 Backup-GPO -Guid $Entry.id -Path $Path
 }
 }
 

function Import-GPOs {
$Folder=Get-childItem -Path $Importfolder -Exclude *.ps1

foreach ($Entry in $Folder) {
$Name=$PreName+$Entry.Name+$postname
$Path=$Importfolder+$entry.Name
$ID=Get-ChildItem -Path $Path
New-GPO -Name $Name
Import-GPO -TargetName $Name -Path $Path -BackupId $ID.Name
}
}


switch ($Mode){
{$_ -eq "Export"} 
{Export-GPOs
break}

{$_ -eq "Import"} 
{Import-GPOs
break}
}