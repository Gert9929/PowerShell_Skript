$file = "C:\Users\Administrator\Desktop\adusers.csv"
$users = Import-Csv $file -Encoding Default -Delimiter ";"
foreach ($user in $users){
    $username = $user.FirstName + "." + $user.LastName
    $username = $username.ToLower()
    $username = Translit($username)
    $upname = $username + "@sv-kool.local"
    $displayname = $user.Firstname + " " + $user.LastName
    New-ADUser -Name $username `
        -DisplayName $displayname `
        -GivenName $user.Firstname `
        -Surname $user.LastName `
        -Department $user.Department `
        -Title $user.Role `
        -UserPrincipalname $upname `
        -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -Force) -Enable $true
    #echo $displayname
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
