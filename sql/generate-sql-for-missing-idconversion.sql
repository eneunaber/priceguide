


--SELECT pl.MLBCODE as mlbamID, ypms.scrubbedName as Name, '' as BDB, ypms.playerid as statsID, '' as cbsID, '' as espnFantasyID

SELECT 'Insert into dbo.IdConversion (mlbamID, Name, BDB, statsID, cbsID, espnFantasyID) values  ('''+ pl.MLBCODE + ''', ''' + ypms.scrubbedName + ''', '''', ''' + ypms.playerid + ''', '''', '''' )'
FROM [fantasy.baseball].[dbo].YahooPlayerMappingsScrubbed ypms
join [fantasy.baseball].[dbo].playerid_list pl
	on ypms.scrubbedname = (pl.FIRSTNAME + ' ' + pl.LASTNAME)
WHERE ypms.scrubbedname NOT IN (
		SELECT idc.Name FROM [fantasy.baseball].[dbo].[IdConversion] idc
) and  pl.MLBCODE is not null and  pl.MLBCODE <> ''



SELECT 'Insert into dbo.IdConversion (mlbamID, Name, BDB, statsID, cbsID, espnFantasyID) values  ('''+ pl.MLBCODE + ''', ''' + ypms.scrubbedName + ''', '''', ''' + ypms.playerid + ''', '''', '''' )'
FROM [fantasy.baseball].[dbo].YahooPlayerMappingsScrubbed ypms
join [fantasy.baseball].[dbo].playerid_list pl
	on ypms.scrubbedname = (pl.FIRSTNAME + ' ' + pl.LASTNAME)
WHERE ypms.scrubbedname NOT IN (
		SELECT idc.Name FROM [fantasy.baseball].[dbo].[IdConversion] idc
) and  pl.MLBCODE is not null and  pl.MLBCODE <> ''
and ypms.playerid in
(
9002,
9157,
9850,
7283,
6314,
9094,
9096,
8207,
6708,
9298,
7572,
8333,
7837,
9220,
9270,
9443,
9350,
9837,
8061,
7571,
9266,
9410,
9787,
9163,
9638,
9543,
9555,
9824,
7333,
9498,
9462,
9678,
9641,
6109,
9673,
9583,
9210,
9139,
9338,
9009,
8373,
9754,
9307,
9509,
9718,
9784,
7814,
9766,
9778,
9884,
9842,
9539
)




 update st
 set mlbamid = idc.mlbamID
 from dbo.[2015BattingSteamer] as st
 join dbo.IdConversion idc
	on idc.name = st.playername
	
	
 update st
 set mlbamid = idc.mlbamID
 from dbo.[2015PitchingSteamer] as st
 join dbo.IdConversion idc
	on idc.name = st.playername	

 update st
 set mlbamid = idc.mlbamID
 from dbo.[2015BattingZeile] as st
 join dbo.IdConversion idc
	on idc.name = st.playername		
	
 update st
 set mlbamid = idc.mlbamID
 from dbo.[2015PitchingZeile] as st
 join dbo.IdConversion idc
	on idc.name = st.playername	