#!/bin/bash

sqlite3 ./speed_test.db <<!
.headers on
.mode csv
.output out.csv
select * from Speed_Tests;
!
