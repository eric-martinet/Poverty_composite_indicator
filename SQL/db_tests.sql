# SELECT *

select * from WB_Countries;
select * from WB_Regions;
select * from WB_IncomeLevels;
select * from WB_Population;

select * from OECD_GDP;
select * from OECD_MDI;
select * from OECD_PPP;
select * from OECD_PovertyGap;

select * from _PovertyLine;
select * from _CompositeIndicator;

# JOIN
SELECT C.Name, PG.Year, PG.Value
FROM WB_Countries C
LEFT JOIN OECD_PovertyGap PG
ON C.ISO3 = PG.C_ISO3;
