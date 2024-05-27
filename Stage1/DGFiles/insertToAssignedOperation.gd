
[General]
Version=1

[Preferences]
Username=
Password=2016
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##MOSHE
Name=ASSIGNED_OPERATION
Count=500

[Record]
Name=A_ID
Type=NUMBER
Size=
Data=List(select A_id from Assignments)
Master=

[Record]
Name=O_ID
Type=NUMBER
Size=
Data=List(select O_id from Operations_)
Master=

