@echo off

rem This is the configuration file for the camera dumping software

rem Here is where you can put in where your photos
rem are located on the card and where you want them
rem to end up.

rem The source MUST be on the same drive as the program.
rem The default camera folder is typically called 'DCIM'
set source=DCIM
echo Source: %source%

rem You need to set a valid location for the destination.
rem If the destination has spaces, make sure you keep the brackets
rem and you don't put another slash at the end (the script handels it).
set destin=%userprofile%\Pictures\Dumped
