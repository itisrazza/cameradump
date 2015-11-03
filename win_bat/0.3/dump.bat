@echo off

cls

rem Makes it look pretty. And it's also a Nintendo reference
color f0
title Camera Photo Dumper - GNU

echo Camera Photo Dumper. One click photo dumper.
echo Copyright (C) 2015 Raresh Nistor
echo.
echo This program is free software: you can redistribute it and/or modify
echo it under the terms of the GNU General Public License as published by
echo the Free Software Foundation, either version 3 of the License, or
echo (at your option) any later version.
echo.
echo This program is distributed in the hope that it will be useful,
echo but WITHOUT ANY WARRANTY; without even the implied warranty of
echo MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
echo GNU General Public License for more details.
echo.
echo You should have received a copy of the GNU General Public License
echo along with this program. If not, see <http://www.gnu.org/licenses/>.
echo.
echo Version 0.3-github. (c) 2015 Raresh Nistor
echo.
echo.

title Camera Photo Dumper - Load configuation file
rem The main function
:main

rem Check if config file exists
if exist %~dp0config.bat (
    title Camera Photo Dumper - Found configuation file
    echo Loading configuration file
    call %~dp0config.bat
) else (
    title Camera Photo Dumper - Missing configuation file
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
title Camera Photo Dumper - Randomise folder
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
title Camera Photo Dumper - Create folder
mkdir %destin%\%subdir%

rem Copy the files from %source% to %destin%\%subdir%
title Camera Photo Dumper - Dumping photos
xcopy %source% %destin%\%subdir% /e /s

title cmd.exe
color

cls

:eof