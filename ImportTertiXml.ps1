$folderPath = "E:\ImportXML\"
$processedPath = "E:\ImportXML\Processed\"

$sqlInstance = "srv-sql"
$database = "GWBM"
$username = "sa"

$password = Get-Content "E:\ImportXml\parola.txt" | ConvertTo-SecureString
$plainPassword = [System.Net.NetworkCredential]::new("", $password).Password

Write-Host "Parola este incarcata: $($password.Length) caractere"

# Creeaza folderul 'Processed' daca nu exista
If (!(Test-Path -Path $processedPath)) {
    New-Item -ItemType Directory -Path $processedPath
}

# Citeste fisierele XML din folder
$files = Get-ChildItem -Path $folderPath -Filter *.xml

if ($files.Count -eq 0) {
    Write-Host "Nu sunt fisiere de importat."
    exit
}

foreach ($file in $files) {
    $fullPath = $file.FullName
    Write-Host "Importing file: $fullPath"

    try {
        # Apeleaza procedura stocata pentru import
        Invoke-Sqlcmd -ServerInstance $sqlInstance -Database $database -Username $username -Password $plainPassword -Query "EXEC [dbo].[ImportXMLTerti] @FilePath = `'$fullPath`'"

        # Muta fisierul în folderul 'Processed' dupa import
        Move-Item -Path $fullPath -Destination $processedPath
        Write-Host "Fisier importat cu succes: $file"
    }
    catch {
        Write-Host "Eroare la importul fisierului: $file"
        Write-Host $_.Exception.Message
    }
}
