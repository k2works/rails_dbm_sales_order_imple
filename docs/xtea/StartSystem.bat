@echo off

set XTEA_HOME=C:\Program Files\XTEA\
set DRIVER=Driver\xteadrv.jar
set HOME=%~dp0
set FILE=Skeleton.xeaf

start javaw -Xms256m -Xmx256m -jar "%XTEA_HOME%%DRIVER%" "%HOME%%FILE%"
