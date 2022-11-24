$Ees = Read-Host -Prompt "Sisestage kasutaja nimi"
$Pere = Read-Host -Prompt "Sisestage kasutaja perekonna nimi"
$Password = ConvertTo-SecureString "Parool1!" -AsPlainText -Force
$Kogunimi = $Ees.ToLower()+"."+$Pere.ToLower()
echo $Kogunimi

New-LocalUser -Name "$Ees" -Password $Password -FullName "Kogunimi" -Description "Uus user"  
