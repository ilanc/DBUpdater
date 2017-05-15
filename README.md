# EF Core code-first DB schema updates

## Intro
Problem is that EF Core can _only_ be used with dependency injection. Means you can't just write a console app. Rather you need to leverage off package manager or dotnet cli commands which come with the `Microsoft.EntityFrameworkCore.Tools` package. Hence the code in Program.cs is a little weird - there's nothing in Main(). You can still do the following:
1. create a sql script to implement the schema changes between 2 or more migration versions
2. run schema change against a remote DB

## Notes
* Install packages
```
Install-Package Microsoft.EntityFrameworkCore.SqlServer
Install-Package Microsoft.EntityFrameworkCore.Tools
```
* Optional = create DB and user
	* createdb.sql
	* NOTE: make sure user has permissions to CREATE TABLE - e.g. dbowner
* Migration
	* `dotnet ef migrations -v add 0.1 --context ApplicationDbContext`
	* or
	* `Add-Migration 0.1`
* Update db
	* `dotnet ef database update -v --context ApplicationDbContext`
	* or
	* `Update-Database -Verbose -Debug`
	
## Troubleshooting
* May help to use windows auth rather than sql auth in connection string:
```
# windows auth
"Server=(localdb)\\mssqllocaldb;Database=TrustID.Ops;Integrated Security=SSPI;MultipleActiveResultSets=true"
# sql auth
"Server=(localdb)\\mssqllocaldb;Database=TrustID.Ops;User Id=trustid-user;Password=blah123;MultipleActiveResultSets=true"
```
	
## Links
* https://docs.microsoft.com/en-us/ef/core/get-started/aspnetcore/new-db
* https://docs.microsoft.com/en-us/ef/core/miscellaneous/configuring-dbcontext

## Identity
See c:\trustid.co.za\trustid\companydashboard\trustid.companydashboard\readme.md