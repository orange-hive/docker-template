:<<"::CMDLITERAL"
@ECHO OFF
GOTO :CMDSCRIPT
::CMDLITERAL

docker-compose  -p "${PWD##*/}" -f docker-data/config/docker-compose.yml down
exit

:CMDSCRIPT
for %%* in (.) do set CurrDirName=%%~nx*
call:toLower CurrDirName
set CurrDirName=%CurrDirName: =%
set CurrDirName=%CurrDirName:-=%

docker-compose  -p "%CurrDirName%" -f docker-data/config/docker-compose.yml down
EXIT /B

:toLower str -- converts uppercase character to lowercase
::           -- str [in,out] - valref of string variable to be converted
:$created 20060101 :$changed 20080219 :$categories StringManipulation
:$source http://www.dostips.com
if not defined %~1 EXIT /B
for %%a in ("A=a" "B=b" "C=c" "D=d" "E=e" "F=f" "G=g" "H=h" "I=i"
            "J=j" "K=k" "L=l" "M=m" "N=n" "O=o" "P=p" "Q=q" "R=r"
            "S=s" "T=t" "U=u" "V=v" "W=w" "X=x" "Y=y" "Z=z" "Ä=ä"
            "Ö=ö" "Ü=ü") do (
    call set %~1=%%%~1:%%~a%%
)
EXIT /B
