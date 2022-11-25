$Ees = Read-Host -Prompt "Sisestage kasutaja nimi"
$Pere = Read-Host -Prompt "Sisestage kasutaja perekonna nimi"
$Password = ConvertTo-SecureString "Parool1!" -AsPlainText -Force)
$Kogunimi = $Ees.ToLower()+"."+$Pere.ToLower()
echo $Kogunimi

$GetUser = Get-LocalUser | where-Object Name -eq "$Ees" | Measure
if ($GetUser.Count -eq 0) {
     New-LocalUser  -Name "$Ees" -Password $Password -FullName "$Kogunimi"
     echo "Kasutaja $Kogunimi on lisatud!"
} else {
     Write-Output "Kasutaja $Kogunimi juba eksisteerib"
}
