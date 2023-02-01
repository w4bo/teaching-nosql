# Quick Install
- Click Start and type `powershell`
- Right-click Windows Powershell and choose ``Run as Administrator''
- Paste the following command into Powershell and press enter.
    > Set-ExecutionPolicy Bypass -Scope Process -Force; `
        iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
- Answer "Yes" when prompted
- Wait for the process to finish and close the PowerShell
- Reopen the power shell as adminstrator and run the following command:
    > choco install -y docker docker-desktop git nodejs robo3t
    - N.B.: If you have __already installed__ one of the softwares just delete it name from the instruction
- Wait for the process to finish and restart the pc (if the process is locked sometimes press enter)
- Accept docker term of use and wait it starts