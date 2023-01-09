#region Parameters
[string]$LogPath = "C:\Users\seimi\OneDrive - Seidl Michael\2-au2mator\1 - TECHGUY\GitHub\Active-Directory" #Path to store the Lofgile, only local or Hybrid
[string]$LogfileName = "FindUsername" #FileName of the Logfile, only local or Hybrid
[int]$DeleteAfterDays = 10 #Time Period in Days when older Files will be deleted, only local or Hybrid
# See My Logging Template for Details: https://github.com/Seidlm/PowerShell-Templates



#Settings
$FirstName="Michael"
$LastName="Seidl"

$delimeter=";"


#prepare String Replacements
$prestring = @'
ß;ö;ü;ä;à;á;é;è;ó;ò;ú;ù;í;ì
'@;
$poststring = @'
ss;oe;ue;ae;a;a;e;e;o;o;u;u;i;i
'@;


[array]$prestrings = $prestring -split $delimeter;
[array]$poststrings = $poststring -split $delimeter;
#endregion Parameters

function Write-TechguyLog {
    [CmdletBinding()]
    param
    (
        [ValidateSet('DEBUG', 'INFO', 'WARNING', 'ERROR')]
        [string]$Type,
        [string]$Text
    )

    #Decide Platform
    $environment = "local"
    if ($env:AZUREPS_HOST_ENVIRONMENT) { $environment = "AAnoHybrid" }
    if ($env:AUTOMATION_WORKER_CERTIFICATE) { $environment = "AAHybrid" }
    
    if ($environment -eq "AAHybrid" -or $environment -eq "local") {
        # Set logging path
        if (!(Test-Path -Path $logPath)) {
            try {
                $null = New-Item -Path $logPath -ItemType Directory
                Write-Verbose ("Path: ""{0}"" was created." -f $logPath)
            }
            catch {
                Write-Verbose ("Path: ""{0}"" couldn't be created." -f $logPath)
            }
        }
        else {
            Write-Verbose ("Path: ""{0}"" already exists." -f $logPath)
        }
        # Use the -f operator to build the log file path with variables
        [string]$logFile = '{0}\{1}_{2}.log' -f $logPath, $(Get-Date -Format 'yyyyMMdd'), $LogfileName
        $logEntry = '{0}: <{1}> {2}' -f $(Get-Date -Format yyyyMMdd_HHmmss), $Type, $Text
        Add-Content -Path $logFile -Value $logEntry
    }
    elseif ($environment -eq "AAHybrid" -or $environment -eq "AAnoHybrid") {
        $logEntry = '{0}: <{1}> {2}' -f $(Get-Date -Format yyyyMMdd_HHmmss), $Type, $Text

        switch ($Type) {
            INFO { Write-Output $logEntry }
            WARNING { Write-Warning $logEntry }
            ERROR { Write-Error $logEntry }
            DEBUG { Write-Output $logEntry }
            Default { Write-Output $logEntry }
        }
    }
}
#endregion Function

function Get-SamAccountName {
    [CmdletBinding()]
    param (
        $FirstName,
        $LastName,
        [ValidateSet('LastName-FirstName', 'FirstName-LastName')]
        $NameOrder,
        $NameDelimiter,
        $Cases
    )
    Write-TechguyLog -Type INFO -Text "FUNCTION Get-SamAccountName"
    
    #Replace prestring with poststring
    Write-TechguyLog -Type INFO -Text "Replace Strings"
    for ($i = 0; $i -le $prestrings.count; $i++) {
        $FirstName = $FirstName -replace ($prestrings[$i], $poststrings[$i]);
        $LastName = $LastName -replace ($prestrings[$i], $poststrings[$i]);
    }

    #Lower First and LastName
    Write-TechguyLog -Type INFO -Text "Lower FirstName and LastName"
    $FirstName = $FirstName.ToLower();
    $LastName = $LastName.ToLower();

    Write-TechguyLog -Type INFO -Text "Go through each Case"
    foreach ($case in $Cases.split(";")) {
        Write-TechguyLog -Type INFO -Text "Case: $($case)"

        $UsedLetters = $case -split '-'
        Try {
            Write-TechguyLog -Type INFO -Text "Switch the NameOrders"
            switch ($NameOrder) {
                

                "LastName-FirstName" {
                    Write-TechguyLog -Type INFO -Text "Nameorder: LastName-FirstName"
                    Write-TechguyLog -Type INFO -Text "Define FirstEnd and SecondEnd"
                    if ($UsedLetters[0] -eq "max"){$FirstEnd=$LastName.length} else {$FirstEnd=$UsedLetters[0] }
                    if ($UsedLetters[1] -eq "max"){$SecondEnd=$FirstName.length} else {$SecondEnd=$UsedLetters[1] }
                    Write-TechguyLog -Type INFO -Text "FirstEnd: $($FirstEnd)"
                    Write-TechguyLog -Type INFO -Text "SecondEnd:  $($SecondEnd)"

                    $LastNamesub = $LastName.Substring(0, $FirstEnd)
                    Try {
                        $FirstNamesub = $FirstName.Substring(0, $SecondEnd)
                    }
                    Catch {
                        $FirstNamesub = $FirstName
                    }
                    $username = $LastNamesub + $NameDelimiter + $FirstNamesub
                }
                "FirstName-LastName" {
                    Write-TechguyLog -Type INFO -Text "Nameorder: FirstName-LastName"
                    Write-TechguyLog -Type INFO -Text "Define FirstEnd and SecondEnd"
                    if ($UsedLetters[0] -eq "max"){$FirstEnd=$FirstName.length} else {$FirstEnd=$UsedLetters[0] }
                    if ($UsedLetters[1] -eq "max"){$SecondEnd=$LastName.length} else {$SecondEnd=$UsedLetters[1] }
                    Write-TechguyLog -Type INFO -Text "FirstEnd: $($FirstEnd)"
                    Write-TechguyLog -Type INFO -Text "SecondEnd:  $($SecondEnd)"

                    $FirstNamesub = $LastName.Substring(0, $FirstEnd)
                    Try {
                
                        $LastNamesub = $FirstName.Substring(0, $SecondEnd)
                    }
                    Catch {
                        $FirstNamesub = $FirstName
                    }
                    $username = $FirstNamesub + $NameDelimiter + $LastNamesub
                }               
            }
            Write-TechguyLog -Type INFO -Text "Try that SAM: $($username)"

        }
        Catch {
            $username = '';
            Write-TechguyLog -Type INFO -Text "No unique SAM found"
        }
        if ($username -ne '') {
            if (!(get-aduser -filter { SamAccountName -eq $Username })) {
                Write-TechguyLog -Type INFO -Text "SAM is unique"
                break
            }
            else {
                $username = ''
                Write-TechguyLog -Type INFO -Text "No unique SAM found"
            }
        }
        else {
            $username = ''
            Write-TechguyLog -Type INFO -Text "No unique SAM found"
        }
        
    }

    return $username


}


function Get-UPN {
    [CmdletBinding()]
    param (
        $FirstName,
        $LastName,
        [ValidateSet('LastName-FirstName', 'FirstName-LastName')]
       
        $NameOrder,
        $NameDelimiter,
        $Cases,
        $Domain
    )
    Write-TechguyLog -Type INFO -Text "FUNCTION Get UPN"
    
    Write-TechguyLog -Type INFO -Text "Replace Strings"
    #Replace prestring with poststring
    for ($i = 0; $i -le $prestrings.count; $i++) {
        $FirstName = $FirstName -replace ($prestrings[$i], $poststrings[$i]);
        $LastName = $LastName -replace ($prestrings[$i], $poststrings[$i]);
    }

    #Lower First and LastName
    Write-TechguyLog -Type INFO -Text "Lower FirstName and LastName"
    $FirstName = $FirstName.ToLower();
    $LastName = $LastName.ToLower();

    Write-TechguyLog -Type INFO -Text "Go through each Case"
    foreach ($case in $Cases.split(";")) {
        Write-TechguyLog -Type INFO -Text "Case: $($case)"
        $UsedLetters = $case -split '-'

        Try {
            Write-TechguyLog -Type INFO -Text "Switch the NameOrders"
            switch ($NameOrder) {
                "LastName-FirstName" {
                    Write-TechguyLog -Type INFO -Text "Nameorder: LastName-FirstName"
                    Write-TechguyLog -Type INFO -Text "Define FirstEnd and SecondEnd"
                    if ($UsedLetters[0] -eq "max"){$FirstEnd=$LastName.length} else {$FirstEnd=$UsedLetters[0] }
                    if ($UsedLetters[1] -eq "max"){$SecondEnd=$FirstName.length} else {$SecondEnd=$UsedLetters[1] }
                    Write-TechguyLog -Type INFO -Text "FirstEnd: $($FirstEnd)"
                    Write-TechguyLog -Type INFO -Text "SecondEnd:  $($SecondEnd)"

                    $LastNamesub = $LastName.Substring(0, $FirstEnd[0])
                    Try {
                        $FirstNamesub = $FirstName.Substring(0, $SecondEnd)
                    }
                    Catch {
                        $FirstNamesub = $FirstName
                    }
                    $UPN = $LastNamesub + $NameDelimiter + $FirstNamesub + $Domain
                }
                "FirstName-LastName" {
                    Write-TechguyLog -Type INFO -Text "Nameorder: FirstName-LastName"
                    Write-TechguyLog -Type INFO -Text "Define FirstEnd and SecondEnd"
                    if ($UsedLetters[0] -eq "max"){$FirstEnd=$FirstName.length} else {$FirstEnd=$UsedLetters[0] }
                    if ($UsedLetters[1] -eq "max"){$SecondEnd=$LastName.length} else {$SecondEnd=$UsedLetters[1] }
                    Write-TechguyLog -Type INFO -Text "FirstEnd: $($FirstEnd)"
                    Write-TechguyLog -Type INFO -Text "SecondEnd:  $($SecondEnd)"

                    $FirstNamesub = $FirstName.Substring(0, $FirstEnd)
                    Try {
                
                        $LastNamesub = $LastName.Substring(0, $SecondEnd)
                    }
                    Catch {
                        $FirstNamesub = $FirstName
                    }
                    $UPN = $FirstNamesub + $NameDelimiter + $LastNamesub + $Domain
                }   
                
            }
            Write-TechguyLog -Type INFO -Text "Try that UPN: $($UPN)"
        }
        Catch {
            $UPN = ''
            Write-TechguyLog -Type INFO -Text "no unique UPN found"
        }
        if ($UPN -ne '') {
            if (!(get-aduser -filter { UserPrinciaplName -eq $UPN })) {
                Write-TechguyLog -Type INFO -Text "UPN is unique"
                break
            }
            else {
                $UPN = ''
                Write-TechguyLog -Type INFO -Text "no unique UPN found"
            }
        }
        else {
            $UPN = ''
            Write-TechguyLog -Type INFO -Text "no unique UPN found"
        }
        $UPN
    }
    return $UPN
   
}


Write-TechguyLog -Type INFO -Text "START Script"

Get-SamAccountName -FirstName $FirstName -LastName $LastName -NameOrder "LastName-FirstName" -NameDelimiter "" -Cases "4-2;3-3;2-4;1-5" 

Get-UPN -FirstName $FirstName -LastName $LastName -NameOrder "FirstName-LastName" -NameDelimiter "." -Cases "1-max;max-max" -Domain "au2mator.com"


#Clean Logs
if ($environment -eq "AAHybrid" -or $environment -eq "local") {
    Write-TechguyLog -Type INFO -Text "Clean Log Files"
    $limit = (Get-Date).AddDays(-$DeleteAfterDays)
    Get-ChildItem -Path $LogPath -Filter "*$LogfileName.log" | Where-Object { !$_.PSIsContainer -and $_.CreationTime -lt $limit } | Remove-Item -Force
}

Write-TechguyLog -Type INFO -Text "END Script"