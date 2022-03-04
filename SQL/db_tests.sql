SELECT C.Name, PG.Year, PG.Value
FROM Countries C
LEFT JOIN Poverty_Gap PG
ON C.ISO3 = PG.ISO3;

select * from WB_Countries;
select * from GDP;
select * from WB_Population;
select * from Poverty_Gap;
select * from Poverty_Line;
select * from WB_Regions;
select * from WB_IncomeLevels;
