# gptj8bitinstallerscript

start the installing with 0gptj-installer.bat

that will (should) automate everything up to the point where you can run start.bat which will generate text based off of the delandzombie.txt file

i'll fancy up this readme... later...

the code is commented well enough for now but is untested


so what i did was make a batch file that:

installs Windows Terminal from winget

launches it in a new tab / window with powershell

runs a powershell script that downloads "cuda_11.6.0_511.23_windows.exe" and checks its file hash and then runs it to install cuda support

checks if WSL is enabled

installs ubuntu in WSL

launches WSL Ubuntu

runs a bash script in WSL to install "Anaconda3-2022.10-Linux-x86_64.sh" and then exits back to the powershell prompt

runs another bash script in WSL that does all the conda crap and grabs all the needed python stuff and exits back again to the powershell prompt

then we have one final bash script that is just for running the prompt and that is invoked by a batch file that you can run whenever you want to generate a thing.
