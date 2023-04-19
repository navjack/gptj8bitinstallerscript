$url = "https://developer.download.nvidia.com/compute/cuda/11.6.0/local_installers/cuda_11.6.0_511.23_windows.exe"
$outputPath = "C:\\temp\\cuda_11.6.0_511.23_windows.exe"
$expectedChecksum = "7a91a7a7696e869ff8d90c52faf48f40"

# Download the file
Invoke-WebRequest $url -OutFile $outputPath

# Calculate the checksum of the downloaded file
$actualChecksum = Get-FileHash $outputPath -Algorithm MD5 | Select-Object -ExpandProperty Hash

# Compare the actual checksum to the expected checksum
if ($actualChecksum -eq $expectedChecksum) {
    Write-Host "Checksum verification succeeded."
    # Run the downloaded executable
    Start-Process $outputPath -Wait
} else {
    Write-Host "Checksum verification failed. The downloaded file may be corrupt or tampered with."
}

# Install Ubuntu for WSL2

# Check if WSL 2 is enabled
if (!(Get-Command wsl.exe -ErrorAction SilentlyContinue)) {
    Write-Host "WSL 2 is not enabled. Please enable it first." -ForegroundColor Yellow
    exit
}

# Download Ubuntu
Invoke-WebRequest -Uri https://aka.ms/wslubuntu2004 -OutFile Ubuntu.appx -UseBasicParsing

# Install Ubuntu
Add-AppxPackage .\Ubuntu.appx

# Set Ubuntu as default
wsl --set-default Ubuntu

# Run the gptj-installer.sh script in WSL from the current directory
wsl bash -c "./2gptj-installer.sh"
wsl bash -c "./3gptj-installer.sh"
