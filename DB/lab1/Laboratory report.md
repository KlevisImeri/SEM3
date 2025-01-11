	
<br>
<br>
<br>
<br>
<br>
<br>
<br>

## *Lab 1: Oracle*


| Field                | Value              |
|----------------------|--------------------|
| Name                 | Imeri Klevis       |
| Neptun ID            | T4XGKO             |
| Exercise code        | 27-HALL-A          |
| Name of instructor   | Tatiana Barbova    |
| Time of laboratory   | 2023-09-21 16:15   |
| Location of laborator| R4P                |
| User name            | T4XGKO             |
| Password             | HelloDatabases1@?  |
| Solved exercises     | 1, 2, 3, 4, 5, 6        |

<div style="page-break-after: always;"></div>

## Solution of exercises
---

#### *exercise 1*
First you make a connection with the database given the default username and password. After you are connected to the database you will see in connection tab the new connection you made with the database. In my case I called it `Database_lab_1`. You can right click to open the window. 
![[Pasted image 20230921165929.png]]
There you can press the `Reset Password` button and you will be shown with the prompt. 
![[Pasted image 20230921170149.png]]
You enter the following required data. The new password I entered is `HelloDatabases1@?`. You press `ok` and you are finished.

<div style="page-break-after: always;"></div>

#### *exercise 2*
To examine database users you go to `DBA>Security>Users`.
![[Pasted image 20230921171126.png]]
Here you will need to find your user that in my case is `T4XGKO` and click on it.
![[Pasted image 20230921171221.png]]
After than the window with the information about the user will open. Here you can select the `Sys Privs` and `Object Privs`. Here the empty tables indicate see that directly as a user we have no privileges granted.
![[Pasted image 20230921172546.png]] ![[Pasted image 20230921172626.png]]
If we click the `General` button of the user window we will se that the user profile is set to `HALLGATO_PROFILE`. 
![[Pasted image 20230921173443.png]]
To see what system and object privileges this role grant the user we need to go to `DBA>Security>Roles`. There we need to find the `HALLGATO_PROFILE`.
![[Pasted image 20230921173740.png]] ![[Pasted image 20230921173936.png]]
Here you can select the `Sys Privs` and `Object Privs` to have a thorough look at the privileges you are granted. 
![[Pasted image 20230921174347.png]] ![[Pasted image 20230921174357.png]]

The ***system privileges*** granted to the user are:
- ALTER SESSION
- CREATE DATABASE LINK
- CREATE SYNONYM
- CREATE VIEW
- SELECT ANY DICTIONARY

The ***object privileges*** granted to the user are:
- Can SELECT data from the "SZEMELYEK2" table in the "OKTATAS" schema.
- Can SELECT data from the "MNB_DEVIZA" table in the "OKTATAS" schema.
- Can SELECT data from the "IGAZOLVANYOK" table in the "OKTATAS" schema.
- Can SELECT data from the "EMBER" table in the "OKTATAS" schema.
- Can SELECT data from the "SZEMELY" table in the "OKTATAS" schema.
- Can SELECT data from the "VISITS" table in the "OKTATAS" schema.
- Can SELECT data from the "SZEMELYEK" table in the "OKTATAS" schema.
- Can SELECT data from the "CIM" table in the "OKTATAS" schema.


Till now we have been using the menu and the buttons located on it. You can also do this buy looking at the SQL. You need to press the `SQL` button and the SQL code will show.

```SQL
   CREATE ROLE "HALLGATO_ROLE";

   GRANT "CONNECT" TO "HALLGATO_ROLE";
   GRANT "RESOURCE" TO "HALLGATO_ROLE";
   GRANT "SELECT_CATALOG_ROLE" TO "HALLGATO_ROLE";

  GRANT SELECT ANY DICTIONARY TO "HALLGATO_ROLE";
  GRANT CREATE DATABASE LINK TO "HALLGATO_ROLE";
  GRANT CREATE VIEW TO "HALLGATO_ROLE";
  GRANT CREATE SYNONYM TO "HALLGATO_ROLE";
  GRANT ALTER SESSION TO "HALLGATO_ROLE";

  GRANT SELECT ON "OKTATAS"."SZEMELYEK2" TO "HALLGATO_ROLE";
  GRANT SELECT ON "OKTATAS"."MNB_DEVIZA" TO "HALLGATO_ROLE";
  GRANT SELECT ON "OKTATAS"."IGAZOLVANYOK" TO "HALLGATO_ROLE";
  GRANT SELECT ON "OKTATAS"."EMBER" TO "HALLGATO_ROLE";
  GRANT SELECT ON "OKTATAS"."SZEMELY" TO "HALLGATO_ROLE";
  GRANT SELECT ON "OKTATAS"."VISITS" TO "HALLGATO_ROLE";
  GRANT SELECT ON "OKTATAS"."SZEMELYEK" TO "HALLGATO_ROLE";
  GRANT SELECT ON "OKTATAS"."CIM" TO "HALLGATO_ROLE";
```

Here you can see that the `HALLGATO_ROLE` is composed from the privileges of the three other roles (`CONNECT`, `RESOURCE`, `SELECT_CATALOG_ROLE`) and the direct privileges mentioned above.

For convenience from know on we will analyze the SQL.

To find out how many concurrent session you can have as a user you need to follow the path `DBA>Security>Profiles>HALLGATO_PROFILE`. Also we know this profile corresponds to the student ('hallgato') users because if we look at the SQL of my user `T4XGKO`  or any other student user we have:

```SQL
CREATE USER "T4XGKO"
	DEFAULT TABLESPACE "OKT"
	TEMPORARY TABLESPACE "TEMP"
	PROFILE "HALLGATO_PROFILE";
```

Observing the SQL in `HALLGATO_PROFILE` we clearly find that the number of
sessions a user can have is 10. The `SESSIONS_PER_USER` parameter contains this information.

```SQL
ALTER PROFILE "HALLGATO_PROFILE"
LIMIT
    COMPOSITE_LIMIT UNLIMITED
    SESSIONS_PER_USER 10
    CPU_PER_SESSION UNLIMITED
    CPU_PER_CALL UNLIMITED
    LOGICAL_READS_PER_SESSION UNLIMITED
    LOGICAL_READS_PER_CALL UNLIMITED
    IDLE_TIME 30
    CONNECT_TIME 120
    PRIVATE_SGA UNLIMITED
    FAILED_LOGIN_ATTEMPTS UNLIMITED
    PASSWORD_LIFE_TIME UNLIMITED
    PASSWORD_REUSE_TIME UNLIMITED
    PASSWORD_REUSE_MAX UNLIMITED
    PASSWORD_VERIFY_FUNCTION NULL
    PASSWORD_LOCK_TIME UNLIMITED
    PASSWORD_GRACE_TIME UNLIMITED
```

<div style="page-break-after: always;"></div>


#### *exercise 3*

To examine the physical structure of our database we need to follow the path `DBA>Storage`. Here we can find all the information we need. We can find the physical files of the database:
- Data Files
- Control Files
- Redo Log Files

![[Pasted image 20230923115904.png]]
We open the Datafiles folder where we can find the the datafiles. After opening it we get this window:
![[Pasted image 20230923115959.png]]
Here the `okt01.dbf` and `okt02.dbf` data files belong to the OKT tablespace. 

Find blow information about them put on the table:

|Full File Name| Size(MB) | Status | Utilization |
|---------|:------:|:---------:|:-----------:|
|/oracle/oradata/SZGLAB/okt01.dbf|500|ONLINE|88.60%|
|/oracle/oradata/SZGLAB/okt02.dbf|1439|ONLINE|57.80%|


<div style="page-break-after: always;"></div>

#### *exercise 4*

The ER diagram describing the relationship between continents and countries is presented below:
![[Pasted image 20230923123123.png]]
To implement this ER in the database we first need to create tables representing relations. 
We can do this by opening the `Connections>Tables` and right clicking on the table folder to create a new table. You need to press the `New Table` button.
![[Pasted image 20230923135628.png]]
A window will show up where you can enter the specification of columns for you table. Below is shown how the `COUNTRIES` table is created. In each row you should specify the type of `Data Type` for the row. More, precisely what kind of values can the attribute take.
![[Pasted image 20230923135834.png]]
This is how the `CONTINENTS` table is filled:
![[Pasted image 20230923145942.png]]
The `PK` is the the primary key of the relation (Table). In each table it is set to `NAME`. Notice that the `NUMBER` is set to size of 4 digits to represent the year.

To implement our `BELONGS` relationship we need to need to create a `Foreign Key` attribute. In these case in the table `COUNTRIES` we have added the `CONTINENT` column. To set the constrains of the `Foreign Key` to this column we need to right click on the `COUNTRIES` table. The image describes this steps:
![[Pasted image 20230923140752.png]]
We need to press `Add Foreign Key`. Than In my case you need to fill the table as shown in the picture:
![[Pasted image 20230923140914.png]]
Press okay and you have your `Foreign Key` set and ready to go.
We can see how our key is added by looking at the model on the `CONTINENTS` table:
![[Pasted image 20230923141056.png]]


Observe the foreign key and the relationship created: ![[Pasted image 20230923141244.png]]


<div style="page-break-after: always;"></div>

#### *exercise 5*

To grand the privileges of your partner you need open the table that will be given as privilege to `UPDATE` and `SELECT`. So you need to follow:`<Table>>Grant>Action>Privileges>Grant`
![[Pasted image 20230923142551.png]]
Here a popup will be shown where you can select the user you want to grant the privileges to with there `Neptun` code. You only need to select  `UPDATE` and `SELECT` from the list. Press `Apply` and you are done.
![[Pasted image 20230923142149.png|300]]
You need to do this for each object you want to grant access to.

You can see the `Statements-Log` in the bottom of your screen:
![[Pasted image 20230923154029.png]]
Here you can see what happened in the SQL code.

To view the privileges you got from your partner you follow the path `Connections>Other User><neptun_partner>` :
![[Pasted image 20230923143757.png]]
Here at each object (Table) you open the `Grants` option and you will see what you have been granted. For example for the table `COUNTRIES` of my partner i can see the `SELECT` and `UPDATE` was granted to me:
![[Pasted image 20230923144105.png]]
To run the given script you right click on the database and and `Open SQL Worksheet`
![[Pasted image 20230923150520.png|300]]

You paste in the code and then run it (`F5`)![[Pasted image 20230923150720.png]]:
![[Pasted image 20230923150622.png|420]]
You can see that the results are listed in the `Query Result`.


Note
> Here we can see that we have also by default granted the `PUBLIC` user our own user table with the `INHERIT PRIVILEGES`. 
> This `PUBLIC ` user represents all the users in the database. So if you grant privileges to this user you are granting privileges to all the users in the database.
> The `INHERIT PRIVILEGES` is a set of grands that give restrictions to the user such that it doesn't misuse the database.


<div style="page-break-after: always;"></div>




#### *exercise 6*
We can add data by opening the table and going to the `Data` section:
![[Pasted image 20230923150109.png]]
By pressing the ![[Pasted image 20230923141529.png]] you can add a row of data.
Here is the added data for the  `COUNTRIES` table:
![[Pasted image 20230923150140.png]]

Note
> You can not add a valid continent that doesn't match the name of any of the continents in the `CONTINENTS` table data. (`Foreign Key`)
> The writing of the names of the `Foreign Key` is case sensitive.
> You can not save the file and the changes will not be added if the values are not in the correct domain and form.


