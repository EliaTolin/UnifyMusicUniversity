@echo off
::UTENTE
set par_1=%1
::DATABASE
set par_2=%2
::HELP
if %par_1%=="-h" (
    echo "Unify Utente Database"
    exit
) 

::ESISTENZA DI ENTRAMBI I PARAMETRI
if %par_1%=="" (exit)
    else
    ( if %par_2%=="" (exit))

echo "CREAZIONE E POPOLAMENTO TABELLE..."

psql -U %par_1% -d %par_2% < ./query/unify.sql

echo "QUERY DI INTERROGAZIONE:""

psql -U %par_1% -d %par_2% < ./query/query.sql