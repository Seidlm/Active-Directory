#region Parameters
[string]$LogPath = "C:\Temp" #Path to store the Lofgile, only local or Hybrid
[string]$LogfileName = "FindUsername" #FileName of the Logfile, only local or Hybrid
[int]$DeleteAfterDays = 10 #Time Period in Days when older Files will be deleted, only local or Hybrid
# See My Logging Template for Details: https://github.com/Seidlm/PowerShell-Templates



#region AI-Settings
#See PSAI for more Detaisl to use the AI Module
# https://www.powershellgallery.com/packages/PSAI
$UseAI = $true #$true, $false

$secrets = @{
    apiURI         = "apiURL"
    apiVersion     = "apiVersion"
    apiKey         = "ApiKey"
    deploymentName = "deploymentName"
}

if ($UseAI) {
    Set-OAIProvider AzureOpenAI
    Set-AzOAISecrets @secrets
}

#endregion AI-Settings


#region Settings
$FirstName = "Finn"
$LastName = "Ucker"
$delimeter = ";"


#endregion Settings


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


#region Function
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
                    if ($UsedLetters[0] -eq "max") { $FirstEnd = $LastName.length } else { $FirstEnd = $UsedLetters[0] }
                    if ($UsedLetters[1] -eq "max") { $SecondEnd = $FirstName.length } else { $SecondEnd = $UsedLetters[1] }
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
                    if ($UsedLetters[0] -eq "max") { $FirstEnd = $FirstName.length } else { $FirstEnd = $UsedLetters[0] }
                    if ($UsedLetters[1] -eq "max") { $SecondEnd = $LastName.length } else { $SecondEnd = $UsedLetters[1] }
                    Write-TechguyLog -Type INFO -Text "FirstEnd: $($FirstEnd)"
                    Write-TechguyLog -Type INFO -Text "SecondEnd:  $($SecondEnd)"

                    $FirstNamesub = $FirstName.Substring(0, $FirstEnd)
                    Try {
                
                        $LastNamesub = $LastName.Substring(0, $SecondEnd)
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

                #Now Check AI if the Username is offensive or embarrassing
                if ($UseAI) {
                    Write-TechguyLog -Type INFO -Text "USE AI and check if the Username is offensive"
                    $prompt = "Determine if $UserName is offensive, funny, known brand or embarrassing , and if so, in what language?"
                    $instructions = "date: $(get-date) - check for offensive, known brand, funny or embarrassing  phrase - output JSON with keys for UserName, Language (English, Spanish, etc.), Is_Offensive (boolean), Is_Funny (boolean), Is_Brand (boolean), and Reason (Funny, Sexual, Racial, Gender, Nationality, etc.), include comments."
                    
                    $agent = New-Agent -Instructions $instructions
                    $CheckResponse = $agent | Get-AgentResponse -Prompt $prompt | ConvertFrom-Json

                    if ($CheckResponse.Is_Offensive -eq $true -or $CheckResponse.Is_Funny -eq $true -or $CheckResponse.Is_Brand -eq $true) {
                        Write-TechguyLog -Type INFO -Text "SAM is offensive, funny or a brand: $($CheckResponse.Reason)"
                        $username = ''
                    }
                    else {
                        Write-TechguyLog -Type INFO -Text "AI havent found anything"
                        break
                    }
                }
                else {
                    Write-TechguyLog -Type INFO -Text "AI is disabled, and Username is unique"
                    break
                }
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
                    if ($UsedLetters[0] -eq "max") { $FirstEnd = $LastName.length } else { $FirstEnd = $UsedLetters[0] }
                    if ($UsedLetters[1] -eq "max") { $SecondEnd = $FirstName.length } else { $SecondEnd = $UsedLetters[1] }
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
                    if ($UsedLetters[0] -eq "max") { $FirstEnd = $FirstName.length } else { $FirstEnd = $UsedLetters[0] }
                    if ($UsedLetters[1] -eq "max") { $SecondEnd = $LastName.length } else { $SecondEnd = $UsedLetters[1] }
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
                #Now Check AI if the UPN is offensive or embarrassing
                if ($UseAI) {
                    Write-TechguyLog -Type INFO -Text "USE AI and check if the UPN is offensive"
                    $prompt = "Determine if $UPN is offensive, funny, known brand or embarrassing , and if so, in what language?"
                    $instructions = "date: $(get-date) - check for offensive, known brand, funny or embarrassing  phrase - output JSON with keys for UPN, Language (English, Spanish, etc.), Is_Offensive (boolean), Is_Funny (boolean), Is_Brand (boolean), and Reason (Funny, Sexual, Racial, Gender, Nationality, etc.), include comments."
                    
                    $agent = New-Agent -Instructions $instructions
                    $CheckResponse = $agent | Get-AgentResponse -Prompt $prompt | ConvertFrom-Json

                    if ($CheckResponse.Is_Offensive -eq $true -or $CheckResponse.Is_Funny -eq $true -or $CheckResponse.Is_Brand -eq $true) {
                        Write-TechguyLog -Type INFO -Text "UPN is offensive, funny or a brand: $($CheckResponse.Reason)"
                        $UPN = ''
                    }
                    else {
                        Write-TechguyLog -Type INFO -Text "AI havent found anything"
                        break
                    }
                }
                else {
                    Write-TechguyLog -Type INFO -Text "AI is disabled, and UPN is unique"
                    break
                }
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

#endregion Function

Write-TechguyLog -Type INFO -Text "START Script"

Get-SamAccountName -FirstName $FirstName -LastName $LastName -NameOrder "FirstName-LastName"  -NameDelimiter "" -Cases "1-4;2-3;3-2;4-1" 

Get-UPN -FirstName $FirstName -LastName $LastName -NameOrder "FirstName-LastName" -NameDelimiter "." -Cases "1-max;max-max" -Domain "@au2mator.com"



Write-TechguyLog -Type INFO -Text "END Script"


