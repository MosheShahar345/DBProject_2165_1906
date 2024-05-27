
[General]
Version=1

[Preferences]
Username=
Password=2929
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##MOSHE
Name=SUBMITS
Count=500

[Record]
Name=P_ID
Type=NUMBER
Size=
Data=List(select P_id from Personnel)
Master=

[Record]
Name=I_ID
Type=NUMBER
Size=
Data=List(select I_id from Intelligence_reports)
Master=

