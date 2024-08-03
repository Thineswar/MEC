# Turning off Windows Defender
Write-Host "Disabling Windows Defender"
Set-MpPreference -DisableIntrusionPreventionSystem $true -DisableIOAVProtection $true -DisableRealtimeMonitoring $true -DisableScriptScanning $true -EnableControlledFolderAccess Disabled -EnableNetworkProtection AuditMode -Force -MAPSReporting Disabled -SubmitSamplesConsent NeverSend

# Copying files over
# robocopy.exe 'D:\Unzipped' '$(Get-Location)\Unzipped' /e /z /j /mt:16 /nodcopy /nooffload /ndl

# 1.3 ArcGIS 10.8
# 1.3.1 Installation
Write-Host "ArcGIS 10.8: Starting Installation"
Start-Process '$(Get-Location)\Unzipped\ESRI ArcGIS Desktop 10.8\ESRI ArcGIS Desktop 10.8\ArcGIS_Desktop_108_172737.exe' "/S" -Wait
Start-Process $env:USERPROFILE'\Documents\ArcGIS 10.8\Desktop\Setup.exe' "/passive /norestart" -Wait
# 1.3.1 Moving crack files for 10.8
Write-Host "ArcGIS 10.8: Copying crack files over"
Copy-Item -Path '$(Get-Location)\Unzipped\ESRI ArcGIS Desktop 10.8\ESRI ArcGIS Desktop 10.8\Crack\AfCore.dll' '$(Get-Location)\Program Files (x86)\ArcGIS\Desktop10.8\bin'

# 2. Agisoft
# 2.1 Installation
Write-Host "Agisoft: Starting Installation"
Start-Process '$(Get-Location)\Unzipped\Agisoft Metashape Professional 1.8.4 Build 14493 (x64) Multilingual\metashape-pro_1_8_4_x64.msi' "/passive /norestart" -Wait
# 2.2 Cracking
Write-Host "Agisoft: Cracking"
Start-Process '$(Get-Location)\Unzipped\Agisoft Metashape Professional 1.8.4 Build 14493 (x64) Multilingual\crack\Patch.exe' "/S" -Wait

# 3. Global Mapper
# 3.1 Installation
Write-Host "Global Mapper: Starting Installation"
Start-Process '$(Get-Location)\Unzipped\Global Mapper 22.1.0 Build 021721 incl patch [CrackingPatching]\global-mapper-22_1-x64.exe' "/S" -Wait
# 3.2 Copying crack files
Write-Host "Global Mapper: Copying crack files"
Copy-Item -Path '$(Get-Location)\Unzipped\Global Mapper 22.1.0 Build 021721 incl patch `[CrackingPatching`]\patch\x64\global_mapper.exe' -Destination '$(Get-Location)\Program Files\GlobalMapper22.1_64bit\' -Force
Copy-Item -Path '$(Get-Location)\Unzipped\Global Mapper 22.1.0 Build 021721 incl patch `[CrackingPatching`]\patch\x64\ProgramData\GlobalMapper\' -Destination '$(Get-Location)\ProgramData\' -Recurse

# 4. Adobe Acrobat Pro
# 4.1 Installation
# Write-Host "Adobe Acrobat Pro: Starting Installation"
# $mountResult = Mount-DiskImage '$(Get-Location)\Unzipped\Adobe.Acrobat.Pro.2023.u2.x64.Multilingual.iso'
# $driveLetter = ($mountResult | Get-Volume).DriveLetter
# Start-Process "$($driveLetter):Adobe Acrobat Pro\setup.exe" "/sPB /rps" -Wait
# 4.2 Cracking
# Write-Host "Adobe Acrobat Pro: Cracking"
# Start-Process "$($driveLetter):Adobe Acrobat Pro\crack.exe" "/S" -Wait
# 4.3 Disabling Adobe's Auto Update Service
# Stop-Service 'AdobeARMservice'
# 4.4 Dismounting ISO file
# Dismount-DiskImage '$(Get-Location)\Unzipped\Adobe.Acrobat.Pro.2023.u2.x64.Multilingual.iso'

# 5 Nitro v14.5.0.11
# 5.1 Installation
Start-Process '$(Get-Location)\Unzipped\Nitro Pro 14.5.0.11 (x64) Enterprise + Crack\Setup\nitro_pro14_x64.msi' "/passive /norestart" -Wait
# 5.2 Copying crack files
Copy-Item -Path '$(Get-Location)\Unzipped\Nitro Pro 14.5.0.11 (x64) Enterprise + Crack\Crack\NitroPDF.exe' -Destination '$(Get-Location)\Program Files\Nitro\PDF Pro\14' -Force

# 6 Envi 5.6
# 6.1 Installation
Start-Process '$(Get-Location)\Unzipped\Envi 5.6\envi56-win.exe' "/Silent" -Wait
# 6.2 Moving crack files
Copy-Item -Path '$(Get-Location)\Unzipped\Envi 5.6\Crack 5.6\x86bit\*' -Destination '$(Get-Location)\Program Files\Harris\ENVI56\IDL88\bin\bin.x86\' -Force
Copy-Item -Path '$(Get-Location)\Unzipped\Envi 5.6\Crack 5.6\x64bit\*' -Destination '$(Get-Location)\Program Files\Harris\ENVI56\IDL88\bin\bin.x86_64\' -Force

# 7 Installing Office365
# Start-Process '$(Get-Location)\Unzipped\OfficeSetup.exe' "/Silent" -Wait

# Installing other programs via winget
$listOfPrograms = "Bitdefender.Bitdefender", "Google.Chrome", "Mozilla.Firefox", "mcmilk.7zip-zstd", "RustDesk.RustDesk", "Google.EarthPro", "Zoom.Zoom", "Adobe.Acrobat.Reader.64-bit"
foreach ($program in $listOfPrograms) { winget install -h -e --id $program }

# Deleting instalation files
# Write-Host "Removing $(Get-Location)\Unzipped folder"
# Remove-Item '$(Get-Location)\Unzipped' -Recurse

# Delete self
# Remove-Item $PSCommandPath -Force 