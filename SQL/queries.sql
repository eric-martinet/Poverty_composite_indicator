#top 5 countries for GDP in 2019 :
SELECT  CountryName, Year, GDP FROM poverty._CompositeIndicator
WHERE Year = "2019"
ORDER BY GDP DESC
LIMIT 5;


#worst 5 countries for GDP in 2019 :
 SELECT  CountryName, Year, GDP FROM poverty._CompositeIndicator
WHERE Year = "2019"
ORDER BY GDP ASC
LIMIT 5;


########

#top 5 countries for PovertyGap in 2019 :
SELECT  CountryName, Year, PovertyGap FROM poverty._CompositeIndicator
WHERE Year = "2019"
ORDER BY PovertyGap ASC
LIMIT 5;


#worst 5 countries for PovertyGap in 2019 :
SELECT  CountryName, Year, PovertyGap FROM poverty._CompositeIndicator
WHERE Year = "2019"
ORDER BY PovertyGap DESC
LIMIT 5;


##########

#top 5 countries for PovertyLine in 2019 :
SELECT  CountryName, Year, PovertyLine FROM poverty._CompositeIndicator
WHERE Year = "2019"
ORDER BY PovertyLine ASC
LIMIT 5;


#worst 5 countries for PovertyLine in 2019 :
SELECT  CountryName, Year, PovertyLine FROM poverty._CompositeIndicator
WHERE Year = "2019"
ORDER BY PovertyLine DESC
LIMIT 5;

########
#top 5 countries for CostClosingRPoverty in 2019 :
SELECT  CountryName, Year, CostClosingRPoverty FROM poverty._CompositeIndicator
WHERE Year = "2019"
ORDER BY CostClosingRPoverty DESC
LIMIT 5;


#worst 5 countries for CostClosingRPoverty in 2019 :
SELECT  CountryName, Year, CostClosingRPoverty FROM poverty._CompositeIndicator
WHERE Year = "2019"
ORDER BY CostClosingRPoverty ASC
LIMIT 5;

########
#top 5 countries for CostClosingRPovertyPercGDP in 2019 :
SELECT  CountryName, Year, CostClosingRPovertyPercGDP FROM poverty._CompositeIndicator
WHERE Year = "2019"
ORDER BY CostClosingRPovertyPercGDP DESC
LIMIT 5;


#worst 5 countries for CostClosingRPovertyPercGDP in 2019 :
SELECT  CountryName, Year, CostClosingRPovertyPercGDP FROM poverty._CompositeIndicator
WHERE Year = "2019"
ORDER BY CostClosingRPovertyPercGDP ASC
LIMIT 5;

######


#poverty line in 2019 of the top 5 countries for GDP:
SELECT  CountryISO3, Value, CountryName, _CompositeIndicator.Year, GDP FROM poverty._CompositeIndicator
INNER JOIN poverty._PovertyLine ON _CompositeIndicator.CountryISO3 = _PovertyLine.C_ISO3
AND  _CompositeIndicator.Year = _PovertyLine.Year
WHERE _CompositeIndicator.Year ="2019"
ORDER BY GDP DESC
LIMIT 5;

#Median Income of top 5 countries GDP:
SELECT  CountryISO3, Value as Median_Income, CountryName, _CompositeIndicator.Year, GDP FROM poverty._CompositeIndicator
INNER JOIN poverty.OECD_MDI ON _CompositeIndicator.CountryISO3 = OECD_MDI.C_ISO3
AND  _CompositeIndicator.Year = OECD_MDI.Year
WHERE _CompositeIndicator.Year ="2019"
ORDER BY GDP DESC
LIMIT 5;


#top 5 high income category countries according to the level of the median income:
SELECT  CountryISO3, Value as Median_Income, CountryName, _CompositeIndicator.Year, WB_IncomeLevels.Name FROM poverty._CompositeIndicator
INNER JOIN poverty.OECD_MDI ON _CompositeIndicator.CountryISO3 = OECD_MDI.C_ISO3
AND  _CompositeIndicator.Year = OECD_MDI.Year
INNER JOIN poverty.WB_Countries ON WB_Countries.ISO3 = _CompositeIndicator.CountryISO3
INNER JOIN poverty.WB_IncomeLevels ON WB_Countries.WB_INCLEVEL_ID = WB_IncomeLevels.WB_INCLEVEL_ID
WHERE _CompositeIndicator.Year ="2019"
AND WB_IncomeLevels.Name = 'High income'
ORDER BY Median_Income DESC
LIMIT 5;


#countries of Upper middle income category countries according to the level of the median income:
SELECT  CountryISO3, Value as Median_Income, CountryName, _CompositeIndicator.Year, WB_IncomeLevels.Name FROM poverty._CompositeIndicator
INNER JOIN poverty.OECD_MDI ON _CompositeIndicator.CountryISO3 = OECD_MDI.C_ISO3
AND  _CompositeIndicator.Year = OECD_MDI.Year
INNER JOIN poverty.WB_Countries ON WB_Countries.ISO3 = _CompositeIndicator.CountryISO3
INNER JOIN poverty.WB_IncomeLevels ON WB_Countries.WB_INCLEVEL_ID = WB_IncomeLevels.WB_INCLEVEL_ID
WHERE _CompositeIndicator.Year ="2019"
AND WB_IncomeLevels.Name = 'Upper middle income'
ORDER BY Median_Income DESC;




