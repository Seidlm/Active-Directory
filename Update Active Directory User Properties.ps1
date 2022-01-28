

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
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-givenname
#SET Values
Set-ADUser -Identity TecMi -GivenName "Michael"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear Givenname

#READ Value
Get-ADUser -Identity TecMi -Properties GivenName | Select-Object -Property GivenName



##homeDirectory
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-homedirectory
#SET Values
Set-ADUser -Identity TecMi -HomeDirectory "\\server\share"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear homeDirectory

#READ Value
Get-ADUser -Identity TecMi -Properties homeDirectory | Select-Object -Property homeDirectory


##homeDrive
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-homedrive
#SET Values
Set-ADUser -Identity TecMi -HomeDrive "z:"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear HomeDrive

#READ Value
Get-ADUser -Identity TecMi -Properties HomeDrive | Select-Object -Property HomeDrive


##homePhone
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-homephone
#SET Values
Set-ADUser -Identity TecMi -HomePhone "+43 665 3728193"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear HomePhone

#READ Value
Get-ADUser -Identity TecMi -Properties HomePhone | Select-Object -Property HomePhone


##homePostalAddress
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-homepostaladdress
#SET Values
Set-ADUser -Identity TecMi -Replace @{homePostalAddress="Street, Place"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear homePostalAddress

#READ Value
Get-ADUser -Identity TecMi -Properties homePostalAddress | Select-Object -Property homePostalAddress


##houseIdentifier
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-houseidentifier
#SET Values
Set-ADUser -Identity TecMi -Replace @{houseIdentifier="17"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear houseIdentifier

#READ Value
Get-ADUser -Identity TecMi -Properties houseIdentifier | Select-Object -Property houseIdentifier


##info
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-info
#SET Values
Set-ADUser -Identity TecMi -Replace @{info="INFO"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear info

#READ Value
Get-ADUser -Identity TecMi -Properties info | Select-Object -Property info



##initials
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-initials
#SET Values
Set-ADUser -Identity TecMi -Initials "SeiMi"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear initials

#READ Value
Get-ADUser -Identity TecMi -Properties initials | Select-Object -Property initials



##internationalISDNNumber
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-internationalisdnnumber
#SET Values
Set-ADUser -Identity TecMi -Replace @{internationalISDNNumber="0123456"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear internationalISDNNumber

#READ Value
Get-ADUser -Identity TecMi -Properties internationalISDNNumber | Select-Object -Property internationalISDNNumber


##ipPhone
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-ipphone
#SET Values
Set-ADUser -Identity TecMi -Replace @{ipPhone="0123456"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear ipPhone

#READ Value
Get-ADUser -Identity TecMi -Properties ipPhone | Select-Object -Property ipPhone


##jpegPhoto
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-jpegphoto
#SET Values
$photo = [byte[]](Get-Content -Path D:\HEad.png -AsByteStream)
Set-ADUser -Identity TecMi -Replace @{jpegPhoto=$photo} 

#CLEAR Value
Set-ADUser -Identity TecMi -Clear jpegPhoto

#READ Value
Get-ADUser -Identity TecMi -Properties jpegPhoto | Select-Object -Property jpegPhoto


##l
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-l
#SET Values
Set-ADUser -Identity TecMi -City "Pfarrkirchen"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear l

#READ Value
Get-ADUser -Identity TecMi -Properties City | Select-Object -Property City



##manager
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-manager
#SET Values
Set-ADUser -Identity TecMi -Manager (Get-ADUser -Identity m.seidl)

#CLEAR Value
Set-ADUser -Identity TecMi -Clear Manager

#READ Value
Get-ADUser -Identity TecMi -Properties Manager | Select-Object -Property Manager



##middleName
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-middlename
#SET Values
Set-ADUser -Identity TecMi -Replace @{middleName="0123456"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear middleName

#READ Value
Get-ADUser -Identity TecMi -Properties middleName | Select-Object -Property middleName


##mobile
##https://www.techguy.at/how-to-update-every-single-active-directory-user-attributes-with-powershell-part-2/#h-mobile
#SET Values
Set-ADUser -Identity TecMi -MobilePhone "+4 364 6 6 465"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear mobile

#READ Value
Get-ADUser -Identity TecMi -Properties mobile | Select-Object -Property mobile



##name
##
#SET Values
Get-ADUser -Identity TecMi | Rename-ADObject -NewName "Michael Techguy" 

#CLEAR Value

#READ Value
Get-ADUser -Identity TecMi -Properties name | Select-Object -Property name



##o
##
#SET Values
Set-ADUser -Identity TecMi  -Replace @{o="au2mator"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear o

#READ Value
Get-ADUser -Identity TecMi -Properties o | Select-Object -Property o



##otherFacsimileTelephoneNumber
##
#SET Values
Set-ADUser -Identity TecMi -Replace @{otherFacsimileTelephoneNumber=@("+123", "456", "+789")}
Set-ADUser -Identity TecMi -Add @{otherFacsimileTelephoneNumber=@("656566")}
Set-ADUser -Identity TecMi -Remove @{otherFacsimileTelephoneNumber=@("656566")}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear otherFacsimileTelephoneNumber

#READ Value
Get-ADUser -Identity TecMi -Properties otherFacsimileTelephoneNumber | Select-Object -Property otherFacsimileTelephoneNumber



##otherHomePhone
##
#SET Values
Set-ADUser -Identity TecMi -Replace @{otherHomePhone=@("+123", "456", "+789")}
Set-ADUser -Identity TecMi -Add @{otherHomePhone=@("656566")}
Set-ADUser -Identity TecMi -Remove @{otherHomePhone=@("656566")}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear otherHomePhone

#READ Value
Get-ADUser -Identity TecMi -Properties otherHomePhone | Select-Object -Property otherHomePhone



##otherIpPhone
##
#SET Values
Set-ADUser -Identity TecMi -Replace @{otherIpPhone=@("+123", "456", "+789")}
Set-ADUser -Identity TecMi -Add @{otherIpPhone=@("656566")}
Set-ADUser -Identity TecMi -Remove @{otherIpPhone=@("656566")}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear otherIpPhone

#READ Value
Get-ADUser -Identity TecMi -Properties otherIpPhone | Select-Object -Property otherIpPhone



##otherMobile
##
#SET Values
Set-ADUser -Identity TecMi -Replace @{otherMobile=@("+123", "456", "+789")}
Set-ADUser -Identity TecMi -Add @{otherMobile=@("656566")}
Set-ADUser -Identity TecMi -Remove @{otherMobile=@("656566")}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear otherMobile

#READ Value
Get-ADUser -Identity TecMi -Properties otherMobile | Select-Object -Property otherMobile



##otherPager
##
#SET Values
Set-ADUser -Identity TecMi -Replace @{otherPager=@("+123", "456", "+789")}
Set-ADUser -Identity TecMi -Add @{otherPager=@("656566")}
Set-ADUser -Identity TecMi -Remove @{otherPager=@("656566")}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear otherPager

#READ Value
Get-ADUser -Identity TecMi -Properties otherPager | Select-Object -Property otherPager


##otherTelephone
##
#SET Values
Set-ADUser -Identity TecMi -Replace @{otherTelephone=@("+123", "456", "+789")}
Set-ADUser -Identity TecMi -Add @{otherTelephone=@("656566")}
Set-ADUser -Identity TecMi -Remove @{otherTelephone=@("656566")}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear otherTelephone

#READ Value
Get-ADUser -Identity TecMi -Properties otherTelephone | Select-Object -Property otherTelephone



##pager
##
#SET Values
Set-ADUser -Identity TecMi  -Replace @{pager="12334534"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear pager

#READ Value
Get-ADUser -Identity TecMi -Properties pager | Select-Object -Property pager



##personalTitle
##
#SET Values
Set-ADUser -Identity TecMi  -Replace @{personalTitle="Dr"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear personalTitle

#READ Value
Get-ADUser -Identity TecMi -Properties personalTitle | Select-Object -Property personalTitle



##photo
##
#SET Values
$photo = [byte[]](Get-Content -Path D:\HEad.png -AsByteStream)
Set-ADUser -Identity TecMi -Replace @{photo=$photo} 

#CLEAR Value
Set-ADUser -Identity TecMi -Clear photo

#READ Value
Get-ADUser -Identity TecMi -Properties photo | Select-Object -Property photo




##physicalDeliveryOfficeName
##
#SET Values
Set-ADUser -Identity TecMi  -Replace @{physicalDeliveryOfficeName="Floor 2"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear physicalDeliveryOfficeName

#READ Value
Get-ADUser -Identity TecMi -Properties physicalDeliveryOfficeName | Select-Object -Property physicalDeliveryOfficeName


##postalAddress
##
#SET Values
Set-ADUser -Identity TecMi -Replace @{postalAddress=@("Street 2, 4044 Place")}
Set-ADUser -Identity TecMi -Add @{postalAddress=@("Street 1, 4044 Place")}
Set-ADUser -Identity TecMi -Remove @{postalAddress=@("Street 1, 4044 Place")}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear postalAddress

#READ Value
Get-ADUser -Identity TecMi -Properties postalAddress | Select-Object -Property postalAddress



##postalCode
##
#SET Values
Set-ADUser -Identity TecMi  -PostalCode "4540"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear postalCode

#READ Value
Get-ADUser -Identity TecMi -Properties postalCode | Select-Object -Property postalCode


##postOfficeBox
##
#SET Values
Set-ADUser -Identity TecMi -Replace @{postOfficeBox=@("Street 2, 4044 Place")}
Set-ADUser -Identity TecMi -Add @{postOfficeBox=@("Street 1, 4044 Place")}
Set-ADUser -Identity TecMi -Remove @{postOfficeBox=@("Street 1, 4044 Place")}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear postOfficeBox

#READ Value
Get-ADUser -Identity TecMi -Properties postOfficeBox | Select-Object -Property postOfficeBox




##preferredLanguage
##
#SET Values
Set-ADUser -Identity TecMi  -Replace @{preferredLanguage="DE-AT"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear preferredLanguage

#READ Value
Get-ADUser -Identity TecMi -Properties preferredLanguage | Select-Object -Property preferredLanguage




##primaryGroupID
##
#SET Values
$ADGroup=Get-ADGroup -Identity "Test Primary"
Add-ADGroupMember -Identity $ADGroup.DistinguishedName -Members "TecMi"
$primaryGroupID = $ADGroup.SID -replace @('.+\-','')
Set-ADUser -Identity TecMi -Replace @{'primaryGroupID' = $primaryGroupID} -ErrorAction SilentlyContinue -PassThru 

#CLEAR Value

#READ Value
Get-ADUser -Identity TecMi -Properties primaryGroupID | Select-Object -Property primaryGroupID





##primaryInternationalISDNNumber
##
#SET Values
Set-ADUser -Identity TecMi -Replace @{primaryInternationalISDNNumber="0123456"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear primaryInternationalISDNNumber

#READ Value
Get-ADUser -Identity TecMi -Properties primaryInternationalISDNNumber | Select-Object -Property primaryInternationalISDNNumber



##primaryTelexNumber
##
#SET Values
Set-ADUser -Identity TecMi -Replace @{primaryTelexNumber="0123456"}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear primaryTelexNumber

#READ Value
Get-ADUser -Identity TecMi -Properties primaryTelexNumber | Select-Object -Property primaryTelexNumber



##profilePath
##
#SET Values
Set-ADUser -Identity TecMi -ProfilePath "\\server1\share\User"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear ProfilePath

#READ Value
Get-ADUser -Identity TecMi -Properties ProfilePath | Select-Object -Property ProfilePath



##sAMAccountName
##
#SET Values
Set-ADUser -Identity TecMi -SamAccountName "TecMi"

#CLEAR Value

#READ Value
Get-ADUser -Identity TecMi -Properties SamAccountName | Select-Object -Property SamAccountName



##scriptPath
##
#SET Values
Set-ADUser -Identity TecMi -ScriptPath "\\server1\share\User\logon.bat"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear ScriptPath

#READ Value
Get-ADUser -Identity TecMi -Properties ScriptPath | Select-Object -Property ScriptPath



##secretary
##
#SET Values
Set-ADUser -Identity TecMi -Replace @{secretary=@((Get-ADuser -Identity "m.seidl").DistinguishedName)}
Set-ADUser -Identity TecMi -Add  @{secretary=@((Get-ADuser -Identity "HofmeisterJ").DistinguishedName)}
Set-ADUser -Identity TecMi -Remove  @{secretary=@((Get-ADuser -Identity "m.seidl").DistinguishedName)}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear secretary

#READ Value
Get-ADUser -Identity TecMi -Properties secretary | Select-Object -Property secretary


##seeAlso
##
#SET Values
Set-ADUser -Identity TecMi -Replace @{seeAlso=@((Get-ADuser -Identity "m.seidl").DistinguishedName)}
Set-ADUser -Identity TecMi -Add  @{seeAlso=@((Get-ADuser -Identity "HofmeisterJ").DistinguishedName)}
Set-ADUser -Identity TecMi -Remove  @{seeAlso=@((Get-ADuser -Identity "m.seidl").DistinguishedName)}

#CLEAR Value
Set-ADUser -Identity TecMi -Clear seeAlso

#READ Value
Get-ADUser -Identity TecMi -Properties seeAlso | Select-Object -Property seeAlso



##sn
##
#SET Values
Set-ADUser -Identity TecMi -Surname "Seidl"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear sn

#READ Value
Get-ADUser -Identity TecMi -Properties sn | Select-Object -Property sn


##street
##
#SET Values
Set-ADUser -Identity TecMi -StreetAddress "Wilhelm-Fein-Straﬂe 37"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear StreetAddress

#READ Value
Get-ADUser -Identity TecMi -Properties StreetAddress | Select-Object -Property StreetAddress


##telephoneNumber
##
#SET Values
Set-ADUser -Identity TecMi -OfficePhone "+4 364 6 6 465"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear telephoneNumber

#READ Value
Get-ADUser -Identity TecMi -Properties OfficePhone | Select-Object -Property OfficePhone




##title
##
#SET Values
Set-ADUser -Identity TecMi -Title "CEO"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear title

#READ Value
Get-ADUser -Identity TecMi -Properties title | Select-Object -Property title



##userPrincipalName
##
#SET Values
Set-ADUser -Identity TecMi -UserPrincipalName "TecMi@au2mator.local"

#CLEAR Value


#READ Value
Get-ADUser -Identity TecMi -Properties UserPrincipalName | Select-Object -Property UserPrincipalName



##wWWHomePage
##
#SET Values
Set-ADUser -Identity TecMi -HomePage "www.au2mator.com"

#CLEAR Value
Set-ADUser -Identity TecMi -Clear wWWHomePage

#READ Value
Get-ADUser -Identity TecMi -Properties HomePage | Select-Object -Property HomePage
