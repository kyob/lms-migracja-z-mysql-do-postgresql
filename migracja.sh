#!/bin/bash

echo "1. Kopiuję kopię bazy z produkcyjnego LMS"
scp USER@1.2.3.4:/path/to/mysql/dump/lms.sql .

echo "2. Importuje skopiowaną bazę do testowej wersji LMS"
mysql -u USER -pPASSWORD lms < lms.sql

echo "3. Uruchamiam pgloader i rozpoczynam konwersję"
/opt/pgloader/build/bin/pgloader --client-min-messages error lms.load
