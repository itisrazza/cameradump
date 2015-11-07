@echo off
rem Makes it look pretty. And it's also a Nintendo reference
color f0
title Camera Photo Dumper

echo Camera Photo Dumper by Raresh Nistor
echo.
echo This project was to create a script to download the
echo images without me having to go through the file manager
echo and hunt the files. You select a folder and the program
echo makes an folder within it where your photos are going
echo to be stored.
echo.
echo.



rem The main function
:main

rem Check if config file exists
if exist %~dp0config.bat (
    echo Loading configuration file
    call %~dp0config.bat
) else (
    echo Configuration missing. Using defaults.
    rem This is the configuration file for the camera dumping software

    rem Here is where you can put in where your photos
    rem are located on the card and where you want them
    rem to end up.

    rem The source MUST be on the same drive as the program.
    rem The default camera folder is typically called 'DCIM'
    set source=%~dp0DCIM
    echo Source: %source%

    rem You need to set a valid location for the destination.
    rem If the destination has spaces, make sure you keep the brackets
    rem and you don't put another slash at the end (the script handels it).
    set destin=%userprofile%\Pictures\CPDumped

)

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

color