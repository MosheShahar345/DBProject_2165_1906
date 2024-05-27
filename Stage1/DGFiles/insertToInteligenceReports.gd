
[General]
Version=1

[Preferences]
Username=
Password=2246
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##MOSHE
Name=INTELLIGENCE_REPORTS
Count=500

[Record]
Name=I_ID
Type=NUMBER
Size=
Data=Sequence(Start, [Inc], [WithinParent])
Master=

[Record]
Name=O_ID
Type=NUMBER
Size=
Data=List(select O_id from Operations_)
Master=

[Record]
Name=SUBMITTED_BY
Type=NUMBER
Size=50
Data=List(select P_id from Personnel)
Master=

[Record]
Name=DATE_SUBMITTED
Type=DATE
Size=
Data=Random(26/05/1948, 26/05/2024)
Master=

[Record]
Name=CONTENT_
Type=VARCHAR2
Size=1000
Data=[@@@@@@@@@@@@@@@@@@]
Master=

