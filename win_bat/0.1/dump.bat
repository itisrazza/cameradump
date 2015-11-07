
rem Makes it look pretty. And it's also a Nintendo reference
color f0

echo Camera Photo Dumper by Raresh Nistor
echo.
echo This project was to create a script to download the
echo images without me having to go through the file manager
echo and hunt the files. You select a folder and the program
echo makes an folder within it where your photos are going
echo to be stored.
echo.

rem Make sure you have the configuation file
if exist config.bat (

rem The main function
:main

rem Read and provide configuration variables to program
call config.bat

rem Go to folder naming.
goto setfolder


rem Set up and create the folder
:setfolder

rem Generate a random number for the folder name
set subdir=%random%

if exist %destin%\%subdir% (
    rem Make a new number and try again
    goto setfolder
) else (
    rem Start dumping the data
    echo Destination: %destin%\%subdir%
    goto dumpdat
)


rem Make the folder and dump the images
:dumpdat

rem Create the folder
mkdir %destin%\%subdir%

rem Copy the files from %source% to %destin%\%subdir%
xcopy %source% %destin%\%subdir% /e /s

) else (
    echo Please make sure you have a file called 'config.bat'
    echo and it contains these lines.
    Echo.
    echo.
    echo @echo off
    echo.
    echo rem This is the configuration file for the camera dumping software
    echo.
    echo rem Here is where you can put in where your photos
    echo rem are located on the card and where you want them
    echo rem to end up.
    echo.
    echo rem The source MUST be on the same drive as the program.
    echo rem The default camera folder is typically called 'DCIM'
    echo set source=DCIM
    echo echo Source: %source%
    echo.
    echo rem You need to set a valid location for the destination.
    echo rem Don't put another slash at the end (the script handels it)
    echo rem or is in quotation marks, even if it has spaces.
    echo set destin=%userprofile%\Pictures\RCDump
    echo.
    echo.
    echo Feel free to replace 'destin=%userprofile%\Pictures\RCDump'
    echo with where you want to save your photos and videos.
    pause
)  

color