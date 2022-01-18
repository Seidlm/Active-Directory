Import-Module ActiveDirectory
Get-ADGroup -Filter * -Properties Members  | where { -not $_.Members} | select Name 