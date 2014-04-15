echo off

SET DB_NAME=%1
echo.
echo I'm going to drop and recreate (with no schema) the database with the name "%1"
echo.
echo Now I'll run the following SQL: "drop database %DB_NAME%"
echo You may be prompted for your the password
echo.
IF EXIST "C:\Program Files\Protecode\PostgreSQL\bin\psql.exe" SET PSQL_DIR="C:\Program Files\Protecode\PostgreSQL\bin\"
IF EXIST "C:\Program Files (x86)\Protecode\PostgreSQL\bin\psql.exe" SET PSQL_DIR="C:\Program Files (x86)\Protecode\PostgreSQL\bin\"
echo Using PSQL.exe located in directory %PSQL_DIR%
echo.
cd %PSQL_DIR%
psql.exe -h localhost -p 55432 -U postgres -c "drop database if exists %DB_NAME%"
echo.
echo Now I'll create the database by running the following SQL: "create database %DB_NAME%"
echo.
psql.exe -h localhost -p 55432 -U postgres -c "create database %DB_NAME%"
echo.
echo Done!