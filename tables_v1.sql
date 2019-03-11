-- Describe ACCOUNTLIST_V1
CREATE TABLE ACCOUNTLIST_V1(
ACCOUNTID integer primary key
, ACCOUNTNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, ACCOUNTTYPE TEXT NOT NULL 
, ACCOUNTNUM TEXT
, STATUS TEXT NOT NULL
, NOTES TEXT 
, HELDAT TEXT 
, WEBSITE TEXT 
, CONTACTINFO TEXT
, ACCESSINFO TEXT 
, INITIALBAL numeric 
, FAVORITEACCT TEXT NOT NULL
, CURRENCYID integer NOT NULL
);
CREATE INDEX IDX_ACCOUNTLIST_ACCOUNTTYPE ON ACCOUNTLIST_V1(ACCOUNTTYPE);

-- Describe ASSETS_V1
CREATE TABLE ASSETS_V1(
ASSETID integer primary key
, STARTDATE TEXT NOT NULL 
, ASSETNAME TEXT COLLATE NOCASE NOT NULL
, VALUE numeric
, VALUECHANGE TEXT
, NOTES TEXT
, VALUECHANGERATE numeric
, ASSETTYPE TEXT
);
CREATE INDEX IDX_ASSETS_ASSETTYPE ON ASSETS_V1(ASSETTYPE);

-- Describe BILLSDEPOSITS_V1
CREATE TABLE BILLSDEPOSITS_V1(
BDID integer primary key
, ACCOUNTID integer NOT NULL
, TOACCOUNTID integer
, PAYEEID integer NOT NULL
, TRANSCODE TEXT NOT NULL
, TRANSAMOUNT numeric NOT NULL
, STATUS TEXT
, TRANSACTIONNUMBER TEXT
, NOTES TEXT
, CATEGID integer
, SUBCATEGID integer
, TRANSDATE TEXT
, FOLLOWUPID integer
, TOTRANSAMOUNT numeric
, REPEATS integer
, NEXTOCCURRENCEDATE TEXT
, NUMOCCURRENCES integer 
);
CREATE INDEX IDX_BILLSDEPOSITS_ACCOUNT ON BILLSDEPOSITS_V1 (ACCOUNTID, TOACCOUNTID);

-- Describe BUDGETSPLITTRANSACTIONS_V1
CREATE TABLE BUDGETSPLITTRANSACTIONS_V1(
SPLITTRANSID integer primary key
, TRANSID integer NOT NULL
, CATEGID integer
, SUBCATEGID integer
, SPLITTRANSAMOUNT numeric
);
CREATE INDEX IDX_BUDGETSPLITTRANSACTIONS_TRANSID ON BUDGETSPLITTRANSACTIONS_V1(TRANSID);

-- Describe BUDGETTABLE_V1
CREATE TABLE BUDGETTABLE_V1(
BUDGETENTRYID integer primary key
, BUDGETYEARID integer
, CATEGID integer
, SUBCATEGID integer
, PERIOD TEXT NOT NULL
, AMOUNT numeric NOT NULL
);
CREATE INDEX IDX_BUDGETTABLE_BUDGETYEARID ON BUDGETTABLE_V1(BUDGETYEARID);

-- Describe BUDGETYEAR_V1
CREATE TABLE BUDGETYEAR_V1(
BUDGETYEARID integer primary key
, BUDGETYEARNAME TEXT NOT NULL UNIQUE
);
CREATE INDEX IDX_BUDGETYEAR_BUDGETYEARNAME ON BUDGETYEAR_V1(BUDGETYEARNAME);

-- Describe CATEGORY_V1
CREATE TABLE CATEGORY_V1(
CATEGID integer primary key
, CATEGNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
);
CREATE INDEX IDX_CATEGORY_CATEGNAME ON CATEGORY_V1(CATEGNAME);

-- Describe CHECKINGACCOUNT_V1
CREATE TABLE CHECKINGACCOUNT_V1(
TRANSID integer primary key
, ACCOUNTID integer NOT NULL
, TOACCOUNTID integer
, PAYEEID integer NOT NULL
, TRANSCODE TEXT NOT NULL
, TRANSAMOUNT numeric NOT NULL
, STATUS TEXT
, TRANSACTIONNUMBER TEXT
, NOTES TEXT
, CATEGID integer
, SUBCATEGID integer
, TRANSDATE TEXT
, FOLLOWUPID integer
, TOTRANSAMOUNT numeric
);
CREATE INDEX IDX_CHECKINGACCOUNT_ACCOUNT ON CHECKINGACCOUNT_V1 (ACCOUNTID, TOACCOUNTID);
CREATE INDEX IDX_CHECKINGACCOUNT_TRANSDATE ON CHECKINGACCOUNT_V1 (TRANSDATE);

-- Describe CURRENCYFORMATS_V1
CREATE TABLE CURRENCYFORMATS_V1(
CURRENCYID integer primary key
, CURRENCYNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, PFX_SYMBOL TEXT
, SFX_SYMBOL TEXT
, DECIMAL_POINT TEXT
, GROUP_SEPARATOR TEXT
, UNIT_NAME TEXT COLLATE NOCASE
, CENT_NAME TEXT COLLATE NOCASE
, SCALE integer
, BASECONVRATE numeric
, CURRENCY_SYMBOL TEXT COLLATE NOCASE NOT NULL UNIQUE
);
CREATE INDEX IDX_CURRENCYFORMATS_SYMBOL ON CURRENCYFORMATS_V1(CURRENCY_SYMBOL);

-- Describe INFOTABLE_V1
CREATE TABLE INFOTABLE_V1(
INFOID integer not null primary key
, INFONAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, INFOVALUE TEXT NOT NULL
);
CREATE INDEX IDX_INFOTABLE_INFONAME ON INFOTABLE_V1(INFONAME);

-- Describe PAYEE_V1
CREATE TABLE PAYEE_V1(
PAYEEID integer primary key
, PAYEENAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, CATEGID integer
, SUBCATEGID integer
);
CREATE INDEX IDX_PAYEE_INFONAME ON PAYEE_V1(PAYEENAME);


-- Describe SPLITTRANSACTIONS_V1
CREATE TABLE SPLITTRANSACTIONS_V1(
SPLITTRANSID integer primary key
, TRANSID integer NOT NULL
, CATEGID integer
, SUBCATEGID integer
, SPLITTRANSAMOUNT numeric
);
CREATE INDEX IDX_SPLITTRANSACTIONS_TRANSID ON SPLITTRANSACTIONS_V1(TRANSID);


-- Describe STOCK_V1
CREATE TABLE STOCK_V1(
STOCKID integer primary key
, HELDAT integer 
, PURCHASEDATE TEXT NOT NULL
, STOCKNAME TEXT COLLATE NOCASE NOT NULL
, SYMBOL TEXT
, NUMSHARES numeric
, PURCHASEPRICE numeric NOT NULL
, NOTES TEXT
, CURRENTPRICE numeric NOT NULL
, VALUE numeric
, COMMISSION numeric
);
CREATE INDEX IDX_STOCK_HELDAT ON STOCK_V1(HELDAT);


-- Describe SUBCATEGORY_V1
CREATE TABLE SUBCATEGORY_V1(
SUBCATEGID integer primary key
, SUBCATEGNAME TEXT COLLATE NOCASE NOT NULL
, CATEGID integer NOT NULL
, UNIQUE(CATEGID, SUBCATEGNAME)
);
CREATE INDEX IDX_SUBCATEGORY_CATEGID ON SUBCATEGORY_V1(CATEGID);

-- Describe SETTING_V1
create table SETTING_V1(
SETTINGID integer not null primary key
, SETTINGNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, SETTINGVALUE TEXT
);
CREATE INDEX IDX_SETTING_SETTINGNAME ON SETTING_V1(SETTINGNAME);

-- Describe REPORT_V1 
create table REPORT_V1(
REPORTID integer not null primary key
, REPORTNAME TEXT COLLATE NOCASE NOT NULL UNIQUE
, GROUPNAME TEXT COLLATE NOCASE
, SQLCONTENT TEXT
, LUACONTENT TEXT
, TEMPLATECONTENT TEXT
, DESCRIPTION TEXT
);
CREATE INDEX INDEX_REPORT_NAME ON REPORT_V1(REPORTNAME);

-- Describe ATTACHMENT_V1
CREATE TABLE ATTACHMENT_V1 (
ATTACHMENTID INTEGER NOT NULL PRIMARY KEY
, REFTYPE TEXT NOT NULL
, REFID INTEGER NOT NULL
, DESCRIPTION TEXT COLLATE NOCASE
, FILENAME TEXT NOT NULL COLLATE NOCASE
);
CREATE INDEX IDX_ATTACHMENT_REF ON ATTACHMENT_V1 (REFTYPE, REFID);
 
-- Describe USAGE_V1
CREATE TABLE USAGE_V1 (
USAGEID INTEGER NOT NULL PRIMARY KEY
, USAGEDATE TEXT NOT NULL 
, JSONCONTENT TEXT NOT NULL
);
CREATE INDEX IDX_USAGE_DATE ON USAGE_V1 (USAGEDATE);
