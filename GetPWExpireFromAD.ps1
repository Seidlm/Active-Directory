########################################################
#Name: GetPWExpireFromAD.ps1                           #
#Creator: Michael Seidl aka Techguy                    #
#CreationDate: 31.03.2020                              #
#LastModified:31.03.2020                               #
#Version: 1.0                                          #
#Short Description:                                    #
#Doc: http://www.techguy.at/tag/getpwexpirefromad/     #
#
# PowerShell Self Service Web Portal at www.au2mator.com/PowerShell
#
########################################################
#www.techguy.at                                        #
#www.facebook.com/TechguyAT                            #
#www.twitter.com/TechguyAT                             #
#michael@techguy.at                                    #
########################################################

# PowerShell Self Service Web Portal at www.au2mator.com/PowerShell

#Import Active Directory Module
Import-Module ActiveDirectory

#Day of Span
$Days="33"

#Settings
$Date=Get-Date -Format yy-MM-dd((Get-Date).adddays($Days))
$Users=Get-ADUser -filter {(Enabled -eq $True) -and (PasswordNeverExpires -eq $False)} -Properties DisplayName, msDS-UserPasswordExpiryTimeComputed, Mail | Where-Object {$_.DisplayName -ne $null} | Select Mail, DisplayName,@{Name="ExpiryDate";Expression={([datetime]::fromfiletime($_."msDS-UserPasswordExpiryTimeComputed")).DateTime}} 

#Magic
foreach ($Entry in $Users) {
    $EntryDate = Get-date($Entry.ExpiryDate) -Format yy-MM-dd
    if ($EntryDate -lt $Date) {
        Write-Host "Alarm: The User" $entry.DisplayName "with Mailaddress:" $Entry.Mail "will expire at" $EntryDate -ForegroundColor Red
    }
    else 
    {
        Write-host "OK: The User" $entry.DisplayName "with Mailaddress:" $Entry.Mail "will expire at" $EntryDate -ForegroundColor green
    }
}
