
[General]
Version=1

[Preferences]
Username=
Password=2333
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##MOSHE
Name=ASSIGNMENTS
Count=500

[Record]
Name=A_ID
Type=NUMBER
Size=
Data=Sequence(Start, 2, [WithinParent])
Master=

[Record]
Name=P_ID
Type=NUMBER
Size=
Data=List(select P_id from Personnel)
Master=

[Record]
Name=O_ID
Type=NUMBER
Size=
Data=List(select O_id from Operations_)
Master=

[Record]
Name=E_ID
Type=NUMBER
Size=
Data=List(select E_id from Equipment)
Master=

[Record]
Name=START_DATE
Type=DATE
Size=
Data=Random(26/05/1948, 26/05/1980)
Master=

[Record]
Name=END_DATE
Type=DATE
Size=
Data=Random(26/05/1980, 26/05/2024)
Master=

