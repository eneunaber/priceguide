


--SELECT pl.MLBCODE as mlbamID, ypms.scrubbedName as Name, '' as BDB, ypms.playerid as statsID, '' as cbsID, '' as espnFantasyID

SELECT 'Insert into dbo.IdConversion (mlbamID, Name, BDB, statsID, cbsID, espnFantasyID) values  ('''+ pl.MLBCODE + ''', ''' + ypms.scrubbedName + ''', '''', ''' + ypms.playerid + ''', '''', '''' )'
FROM [fantasy.baseball].[dbo].YahooPlayerMappingsScrubbed ypms
join [fantasy.baseball].[dbo].playerid_list pl
	on ypms.scrubbedname = (pl.FIRSTNAME + ' ' + pl.LASTNAME)
WHERE ypms.scrubbedname NOT IN (
		SELECT idc.Name FROM [fantasy.baseball].[dbo].[IdConversion] idc
) and  pl.MLBCODE is not null and  pl.MLBCODE <> ''


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