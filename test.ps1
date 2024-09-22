Add-Type -AssemblyName System.Windows.Forms

# Funkcia na zobrazenie pop-up správy
function Show-PopUp {
    [System.Windows.Forms.MessageBox]::Show("I told you nothing bad will happen", "Attention", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
}

# Sledovanie procesov Windows Defendera
$processesToMonitor = @("MsMpEng", "MpCmdRun")

# Sledovanie bude prebiehať, kým sa nezistí prvý sken
$defenderScanDetected = $false

while (-not $defenderScanDetected) {
    foreach ($process in $processesToMonitor) {
        $processExists = Get-Process -Name $process -ErrorAction SilentlyContinue
        if ($processExists) {
            Show-PopUp
            $defenderScanDetected = $true
            break
        }
    }
    Start-Sleep -Seconds 5  # Kontrola každých 5 sekúnd
}

# Ukončí sledovací skript po prvom skene
exit
