$Fail = "C:\Users\gert\Desktop\kasutajad.csv"

$Kasutajad = Import-Csv $Fail -Encoding Default -Delimiter ";"

foreach ($kasutaja in $Kasutajad)
{
    $Kasutajanimi = $Kasutaja.Kasutajanimi
    $Taisnimi = $Kasutaja.Taisnimi
    $KontoKirjeldus = $kasutaja.KontoKirjeldus
    $Parool = $kasutaja.Parool | ConvertTo-SecureString -AsPlainText -Force
    New-LocalUser -Name "$Kasutajanimi" -Password $Parool -FullName "$Taisnimi" -Description "KontoKirjeldus"



}
