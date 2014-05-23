#!/bin/bash
cont=0
exe=0

while [ 0 ] 
do
let exe++
echo Execução Número: $exe
perl Crawler.pl
if [ $? -eq 1 ]
then 
let cont++
echo Tentativa número: $cont 
echo Aguardando
date
sleep 1m
else
echo -------------------
fdupes -Ndr PaginasS*
echo Execução Número: $exe
echo Dormindo
date
sleep 10m
fi
done
