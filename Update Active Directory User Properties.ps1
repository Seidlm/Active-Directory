

##accountExpires
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-accountexpires
#Set Values
Set-ADUser -Identity TecMi -AccountExpirationDate (Get-Date).AddDays(5)

#CLEAR Value
Set-ADUser -Identity TecMi -AccountExpirationDate $null

#READ Value
Get-ADUser -Identity TecMi -Properties AccountExpirationDate | Select-Object -Property AccountExpirationDate


##assistant
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-assistant
#Set Values
Set-ADUser -Identity TecMi -add @{assistant=@("CN=Michael Seid,DC=au2mator,DC=local")}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear assistant

#READ Value
Get-ADUser -Identity TecMi -Properties assistant | Select-Object -Property assistant


##c
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-c
#Set Values
Set-ADUser -Identity TecMi -Country AT
Set-ADUser -Identity TecMi -Replace @{c="AT";co="Austria";countrycode=40}
#https://www.iso.org/obp/ui/#search/code/

#CLEAR Value
Set-ADUser -Identity TecMi -Clear c

#READ Value
Get-ADUser -Identity TecMi -Properties c | Select-Object -Property c


##carLicense
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-carlicense
#Set Values
Set-ADUser -Identity TecMi -add @{carLicense=@("LL123AB")}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear carLicense

#READ Value
Get-ADUser -Identity TecMi -Properties carLicense | Select-Object -Property carLicense


##co
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-co
#Set Values
Set-ADUser -Identity TecMi -Replace @{c="AT";co="Austria";countrycode=40}
#https://www.iso.org/obp/ui/#search/code/

#CLEAR Value
Set-ADUser -Identity TecMi -Clear co

#READ Value
Get-ADUser -Identity TecMi -Properties co | Select-Object -Property co



##countrycode
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-countrycode
#Set Values
Set-ADUser -Identity TecMi -Replace @{c="AT";co="Austria";countrycode=40}
#https://www.iso.org/obp/ui/#search/code/

#CLEAR Value
Set-ADUser -Identity TecMi -Clear countrycode

#READ Value
Get-ADUser -Identity TecMi -Properties co | Select-Object -Property countrycode


##company
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-company
#SET Values
Set-ADUser -Identity TecMi -Company "au2mator"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear company

#READ Value
Get-ADUser -Identity TecMi -Properties company | Select-Object -Property company



##department
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-department
#SET Values
Set-ADUser -Identity TecMi -Department "CEO"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear Department

#READ Value
Get-ADUser -Identity TecMi -Properties Department | Select-Object -Property Department



##Description
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-description
#SET Values
Set-ADUser -Identity TecMi -Description "This is a Descripion"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear Description

#READ Value
Get-ADUser -Identity TecMi -Properties Description | Select-Object -Property Description




##displayname
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-displayname
#SET Values
Set-ADUser -Identity TecMi -DisplayName "Techguy Michael"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear DisplayName

#READ Value
Get-ADUser -Identity TecMi -Properties DisplayName | Select-Object -Property DisplayName



##division
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-division
#SET Values
Set-ADUser -Identity TecMi -Division "My Division"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear division

#READ Value
Get-ADUser -Identity TecMi -Properties division | Select-Object -Property division



##employeeID
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-employeeid
#SET Values
Set-ADUser -Identity TecMi -EmployeeID "123455"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear employeeID

#READ Value
Get-ADUser -Identity TecMi -Properties employeeID | Select-Object -Property employeeID


##employeeNumber
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-employeenumber
#SET Values
Set-ADUser -Identity TecMi -EmployeeNumber "123455"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear employeeNumber

#READ Value
Get-ADUser -Identity TecMi -Properties employeeNumber | Select-Object -Property employeeNumber


##employeeType
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-employeetype
#SET Values
Set-ADUser -Identity TecMi -Replace @{employeeType="student"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear employeeType

#READ Value
Get-ADUser -Identity TecMi -Properties employeeType | Select-Object -Property employeeType




##facsimileTelephoneNumber
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-1/#h-facsimiletelephonenumber
#SET Values
Set-ADUser -Identity TecMi -Replace @{facsimileTelephoneNumber="0165772345"}
Set-ADUser -Identity TecMi -Fax "012345"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear facsimileTelephoneNumber

#READ Value
Get-ADUser -Identity TecMi -Properties facsimileTelephoneNumber | Select-Object -Property facsimileTelephoneNumber


##givenName
##
#SET Values
Set-ADUser -Identity TecMi -GivenName "Michael"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear Givenname

#READ Value
Get-ADUser -Identity TecMi -Properties GivenName | Select-Object -Property GivenName



##homeDirectory
##
#SET Values
Set-ADUser -Identity TecMi -HomeDirectory "\\server\share"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear homeDirectory

#READ Value
Get-ADUser -Identity TecMi -Properties homeDirectory | Select-Object -Property homeDirectory


##homeDrive
##
#SET Values
Set-ADUser -Identity TecMi -HomeDrive "z:"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear HomeDrive

#READ Value
Get-ADUser -Identity TecMi -Properties HomeDrive | Select-Object -Property HomeDrive


##homePhone
##
#SET Values
Set-ADUser -Identity TecMi -HomePhone "+43 665 3728193"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear HomePhone

#READ Value
Get-ADUser -Identity TecMi -Properties HomePhone | Select-Object -Property HomePhone





















Set-ADUser -Identity TecMi -Replace @{otherFacsimileTelephoneNumber=@("+123", "456", "+789")}