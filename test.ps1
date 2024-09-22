Add-Type -AssemblyName System.Windows.Forms

# Zobrazenie pop-up správy s upozornením
[System.Windows.Forms.MessageBox]::Show("Toto je upozornenie!", "Upozornenie", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Warning)
