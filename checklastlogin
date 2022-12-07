$file = "C:\Users\Administrator\Desktop\adusers.csv"
$users = Import-Csv $file -Encoding Default -Delimiter ";"
foreach ($user in $users){
    $username = $user.FirstName + "." + $user.LastName
    $username = $username.ToLower()
    $username = Translit($username)
    Get-ADUser -Identity $username -Properties LastLogon | Select Name, @{Name='LastLogon';Expression={[DateTime]::FromFileTime($_.LastLogon)}}
}

function Translit {
    param(
        [string] $inputString
    )
        $Translit = @{
        [char]'ä' = "a"
        [char]'ö' = "o"
        [char]'ü' = "u"
        [char]'õ' = "o"
        }
    $outputString=""
    foreach ($character in $inputCharacter = $inputString.ToCharArray())
    {
        if ($Translit[$character] -cne $Null ){
            $outputString += $Translit[$character]
        } else {
            $outputString += $character
        }
    }
    Write-Output $outputString
    
}
