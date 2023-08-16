# Mod-9-SQL
## Module 9 Working with SQL

In this repository we house the files to create a sql database from csv's.
We focus on using pgadmin and quickDBD to complete this projects. 
In total 6 tables are created housing the csv data from a employeers HR files

We start this project by using https://app.quickdatabasediagrams.com/#/ to map a quick relationship diagram of the tables (Data Modeling.png)
From here we go into pgadmin to begin the table Schema
In PG admin I used standard SQL language to create each of the 6 tables and identify the primary key by header in each table
Once these are established we can use the copy function and select the established tables and relative csv paths to import the data
Next is simply selcting all from each table to check the data

Secondly we move into part 3, data analysis
In this space we use merges "joins" to merge select tables to compare the data between the two or more tables
This practice is very useful in showing all related data in one space for employees or departments

## How to use Repository
1: To begin please make a clome of this repository to your local drive
2: You may use the (Data Modeling.png) file to get a quick overview of the data tables and relationships
3: Open PGAdmin and create a new Database
4: Open the query tool and load in the file (Employee_DB)
5: Run the code to create the tables first
6: Next run the code to import the csv data from the data folder now in your local repository clone
7: From here you are able to run the analysis points and see the combined tables 
