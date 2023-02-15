:: Script: 08 - Windows Batch Scripting
:: Author: Robert Gregor
:: Date of latest revision: 151500FFEB23
:: Purpose:
    :: Create a batch file that recursively copies Jorge’s work files on his desktop (recursively meaning to include folder contents).
    :: Your script should use ROBOCOPY as the primary means of copying the data.
    :: Schedule a Windows task to execute this batch file every night at midnight.
    :: Have your batch file generate a log file of what took place.
:: Code Fellows Resources:
    :: [How to Use Windows Batch File Commands to Automate Repetitive Tasks] (https://www.makeuseof.com/tag/use-windows-batch-file-commands-automate-repetitive-tasks/)
    :: [Windows Batch Scripting] (https://en.wikibooks.org/wiki/Windows_Batch_Scripting)
:: My Sources
    :: [Perform Auto Backup with Batch File in Windows 10] (https://www.ubackup.com/backup-restore/backup-batch-file-windows-10-1021.html)

:: Lab 04 - Stretch Goal
:: @ECHO OFF
:: ECHO My_Project_Files BACKED UP!
:: xcopy /f /s /h /d C:\Users\j.thompson\Desktop\My_Project_Files E:\My_Project_Files_backup
:: PAUSE

:: Main

@ECHO OFF
ECHO My_Project_Files BACKED UP!
ROBOCOPY C:\Users\j.thompson\Desktop\My_Project_Files E:\My_Project_Files_backup /LOG:backuplog.txt
PAUSE

:: End