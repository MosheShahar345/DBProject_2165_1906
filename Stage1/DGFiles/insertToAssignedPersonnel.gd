
[General]
Version=1

[Preferences]
Username=
Password=2573
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##MOSHE
Name=ASSIGNED_PERSONNEL
Count=500

[Record]
Name=A_ID
Type=NUMBER
Size=
Data=List(select A_id from Assignments)
Master=

[Record]
Name=P_ID
Type=NUMBER
Size=
Data=List(select P_id from Personnel)
Master=

