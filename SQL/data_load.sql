TRUNCATE TABLE WB_Countries;
LOAD DATA LOCAL INFILE '/Users/ericmartinet/Documents/GitHub/Poverty_composite_indicator/Data/WB_Countries.csv'
INTO TABLE WB_Countries
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@col1, @col2, @col3, @col4, @col5) SET ISO3 = @col2, Name = @col3 , WB_REG_ID = @col4, WB_INCLEVEL_ID = @col5;

TRUNCATE TABLE WB_IncomeLevels;
LOAD DATA LOCAL INFILE '/Users/ericmartinet/Documents/GitHub/Poverty_composite_indicator/Data/WB_IncomeLevels.csv'
INTO TABLE WB_IncomeLevels
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@col1, @col2, @col3) SET WB_INCLEVEL_ID = @col2, Name = @col3;

TRUNCATE TABLE WB_Regions;
LOAD DATA LOCAL INFILE '/Users/ericmartinet/Documents/GitHub/Poverty_composite_indicator/Data/WB_Regions.csv'
INTO TABLE WB_Regions
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@col1, @col2, @col3) SET WB_REG_ID = @col2, Name = @col3;

TRUNCATE TABLE WB_Population;
LOAD DATA LOCAL INFILE '/Users/ericmartinet/Documents/GitHub/Poverty_composite_indicator/Data/WB_Population.csv'
INTO TABLE WB_Population
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@col1, @col2, @col3, @col4, @col5) SET C_ISO3 = @col2, Year = @col3 , Value = NULLIF(@col4,''), Description = @col5;
# Put NULL if Value is empty


TRUNCATE TABLE OECD_GDP;
LOAD DATA LOCAL INFILE '/Users/ericmartinet/Documents/GitHub/Poverty_composite_indicator/Data/OECD_GDP.csv'
INTO TABLE OECD_GDP
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@col1, @col2, @col3, @col4, @col5) SET C_ISO3 = @col2, Description = @col3, Year = @col4, Value = @col5;

TRUNCATE TABLE OECD_MDI;
LOAD DATA LOCAL INFILE '/Users/ericmartinet/Documents/GitHub/Poverty_composite_indicator/Data/OECD_MDI.csv'
INTO TABLE OECD_MDI
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@col1, @col2, @col3, @col4, @col5) SET C_ISO3 = @col2, Description = @col3, Year = @col4, Value = @col5;

TRUNCATE TABLE OECD_PPP;
LOAD DATA LOCAL INFILE '/Users/ericmartinet/Documents/GitHub/Poverty_composite_indicator/Data/OECD_PPP.csv'
INTO TABLE OECD_PPP
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@col1, @col2, @col3, @col4, @col5) SET C_ISO3 = @col2, Description = @col3, Year = @col4, Value = @col5;

TRUNCATE TABLE OECD_PovertyGap;
LOAD DATA LOCAL INFILE '/Users/ericmartinet/Documents/GitHub/Poverty_composite_indicator/Data/OECD_PovertyGap.csv'
INTO TABLE OECD_PovertyGap
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@col1, @col2, @col3, @col4, @col5) SET C_ISO3 = @col2, Description = @col3, Year = @col4, Value = @col5;


