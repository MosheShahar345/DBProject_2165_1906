
[General]
Version=1

[Preferences]
Username=
Password=2002
Database=
DateFormat=
CommitCount=100
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=PERSONNEL
Count=500

[Record]
Name=P_ID
Type=NUMBER
Size=
Data=Random(100000000, 999999999)
Master=

[Record]
Name=R_ID
Type=NUMBER
Size=
Data=List(select R_ID from ROLE_)
Master=

[Record]
Name=P_NAME
Type=VARCHAR2
Size=20
Data=FirstName '-' LastName
Master=

[Record]
Name=RANK_
Type=VARCHAR2
Size=20
Data=List('Turai', 'Rabat', 'Samal', 'Samal Rishon', 'Rasan', 'Segen', 'Segen Mishne', 'Seren', 'Rav Seren', 'Sgan Aluf', 'Aluf Mishne', 'Tat Aluf', 'Aluf')
Master=

