
--Nama : Angelin Minarto
--NIM : 2301850550

--1.
CREATE DATABASE JProject
USE JProject
ON
(
	NAME = JProject,
	FILENAME = 'D:\Other\B_Semester 4\Exams\Database Administrator\Quiz\JProject.mdf',
	FILEGROWTH = 20%,
	MAXSIZE = 1000MB
)

LOG ON
(
	NAME = JProject_log,
	FILENAME = 'D:\Other\B_Semester 4\Exams\Database Administrator\Quiz\JProject.ldf',
	FILEGROWTH = 20%,
	MAXSIZE = 1000MB
)

--4.
CREATE LOGIN DBAdmin
WITH PASSWORD = 'Admin',
DEFAULT_DATABASE = JProject,
CHECK_POLICY = OFF

ALTER SERVER ROLE creator ADD MEMBER DBAdmin

CREATE USER DBAdmin FOR LOGIN DBAdmin

ALTER ROLE db_datareader ADD MEMBER DBAdmin
ALTER ROLE db_datawriter ADD MEMBER DBAdmin

ALTER DATABASE [JProject] SET EMERGENCY
GO

ALTER DATABASE [JProject] set single_user
GO

DBCC CHECKDB ([JProject], REPAIR_ALLOW_DATA_LOSS) WITH ALL_ERRORMSGS;
GO 

ALTER DATABASE [JProject] set multi_user
GO

USE JProject

EXEC sp_detach_db 'JProject'