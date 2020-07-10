:ANY
@echo off
CHCP 65001 >NUL
setlocal enabledelayedexpansion
cd "%homepath%\Documents\"
if not exist "Raffle" md "Raffle"
cd "Raffle"
IF EXIST "Names" rd "Names" /s /q
md "Names"
set "numeros="
set "cho=0"
clear
sleep 2
:HOME
clear
echo With names (1) or without names (2)?
set /p "cho=>"
if %cho%==2 goto 2
if %cho%==1 goto 1
clear
echo Invalid choose...
sleep 2
goto home
:1
set "MODO=1"
set "cho=S2AnythingS2"
clear
echo How many numbers?
set /p "cho=>"
if %cho%==S2AnythingS2 (
clear
echo Type some number...
sleep 2
goto 1
)
if %cho% LEQ a ( clear ) ELSE ( goto letter )
if %cho%==a (
goto letter
)
clear
set "test1=%cho%"
set /a test1=%test1%/2
clear
if %test1%==%cho% goto letter
if %cho% LEQ 0 (
clear
echo Very low number...
sleep 2
goto 1
)
set "test=%cho%"
clear
cd "%homepath%\Raffle\Names"
:1LOOP
set "cho1=Anything"
if %test%==0 goto sorteador
set /p "CHO1=%test%.=>"
if "%cho1%"==Anything (
echo Please enter a name...
goto 1LOOP
)
echo>>NUM%TEST%. %cho1%
set /a test=%test%-1
goto 1LOOP
:2
set "MODO=2"
set "cho=S2AnythingS2"
clear
echo How many numbers?
set /p "cho=>"
if %cho%==S2AnythingS2 (
clear
echo Type some number...
sleep 2
goto 2
)
if %cho% LEQ a ( clear ) ELSE ( goto letter )
if %cho%==a (
goto letter
)
clear
set "test1=%cho%"
set /a test1=%test1%/2
clear
if %test1%==%cho% goto letter
if %cho% LEQ 0 (
clear
echo Very low number...
sleep 2
goto 1
)
:SORTEADOR
set "test2=%cho%"
set "numbers=%test2%"
:SORTEADOR2
set /a test2=%test2%-1
set "numbers=%numbers% %test2%"
if %test2%==1 goto FINISH%MODO%
goto SORTEADOR2
:FINISH1
set "cho=S2AnythingS2"
set "alfabeto=%numbers%"
set "tamanho=0"
set "resultado="
for %%a in (%alfabeto%) do (
    set "!tamanho!=%%a"
    set /a "tamanho+=1"
)
for /L %%G in (1 1 1) do (
    set /a "indice=!random! %% tamanho"
    for %%b in (!indice!) do set "resultado=!resultado!!%%b!"
)
clear
set /p name=<NUM%RESULTADO%.
title Winner: %name% (%resultado%)
echo The Winner is: %Name% (%resultado%). Do not enter anything to draw again...
set /p "cho=>"
if not %cho%==S2AnythingS2 (
cd../
rd "Names" /s /q
exit
)
goto FINISH1
:FINISH2
set "cho=S2AnythingS2"
set "alfabeto=%numeros%"
set "tamanho=0"
set "resultado="
for %%a in (%alfabeto%) do (
    set "!tamanho!=%%a"
    set /a "tamanho+=1"
)
for /L %%G in (1 1 1) do (
    set /a "indice=!random! %% tamanho"
    for %%b in (!indice!) do set "resultado=!resultado!!%%b!"
)
clear
title Result: %resultado%
echo The result is: %resultado%. Do not enter anything to draw again...
set /p "cho=>"
if not %cho%==S2AnythingS2 (
cd../
rd "Names" /s /q
exit
)
goto FINISH2
:Letter
clear
echo Your variable contains letters...
sleep 2
goto %modo%
