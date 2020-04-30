@echo off
set animaljar="C:\Users\Developper\Documents\Sopra inter\PFE\PrintOutDowngrading\animal-sniffer-1.16.jar"
set testjar="C:\Users\Developper\git\MyPrintOut\PrintOut\PrintOutParent\PrintOutCore\target\PrintOutCore-3.0.1.jar"
set rpath="C:\ProgramData\MySQL\MySQL Server 8.0\Data\loganimalssniffer\result.txt"
java  -jar %animaljar%   %testjar% > %rpath%
PAUSE