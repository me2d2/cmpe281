

CREATE TABLE IF NOT EXISTS `cmpe281`.`LP_TASK` (
  `ID` INT NOT NULL,
  `DESC` VARCHAR(45) NULL,
  `OWNER` VARCHAR(45) NULL,
  `PLAN_START` DATETIME NULL,
  `PLAN_FINISH` DATETIME NULL,
  `DONE` VARCHAR(45) NULL)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `cmpe281`.`KB_CARD` (
  `ID` INT NOT NULL,
  `DESC` VARCHAR(45) NULL,
  `OWNER` VARCHAR(45) NULL,
  `PLAN_START` DATETIME NULL,
  `PLAN_FINISH` DATETIME NULL,
  `DONE` VARCHAR(45) NULL)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `cmpe281`.`SC_STORY` (
  `ID` INT NOT NULL,
  `DESC` VARCHAR(45) NULL,
  `OWNER` VARCHAR(45) NULL,
  `PLAN_START` DATETIME NULL,
  `PLAN_FINISH` DATETIME NULL,
  `DONE` VARCHAR(45) NULL)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `cmpe281`.`TENANT_TABLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmpe281`.`TENANT_TABLE` (
  `TENANT_ID` VARCHAR(10) NOT NULL,
  `TABLE_NAME` VARCHAR(45) NOT NULL,
  `TABLE_DESC` VARCHAR(80) NULL,
  PRIMARY KEY (`TENANT_ID`, `TABLE_NAME`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cmpe281`.`TENANT_FIELDS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmpe281`.`TENANT_FIELDS` (
  `TENANT_ID` VARCHAR(10) NOT NULL,
  `TABLE_NAME` VARCHAR(45) NOT NULL,
  `FIELD_NAME` VARCHAR(45) NOT NULL,
  `FIELD_TYPE` VARCHAR(80) NULL,
  `FIELD_COLUMN` INT NOT NULL,
  PRIMARY KEY (`TENANT_ID`, `TABLE_NAME`, `FIELD_NAME`),
  CONSTRAINT `fk_TENANT_FIELDS_TENANT_TABLE`
    FOREIGN KEY (`TENANT_ID` , `TABLE_NAME`)
    REFERENCES `cmpe281`.`TENANT_TABLE` (`TENANT_ID` , `TABLE_NAME`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cmpe281`.`TENANT_DATA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cmpe281`.`TENANT_DATA` (
  `RECORD_ID` VARCHAR(45) NOT NULL,
  `TENANT_ID` VARCHAR(10) NOT NULL,
  `TENANT_TABLE` VARCHAR(45) NULL,
  `COLUMN_1` VARCHAR(80) NULL,
  `COLUMN_2` VARCHAR(80) NULL,
  `COLUMN_3` VARCHAR(80) NULL,
  `COLUMN_4` VARCHAR(80) NULL,
  `COLUMN_5` VARCHAR(80) NULL,
  `COLUMN_6` VARCHAR(80) NULL,
  `COLUMN_7` VARCHAR(80) NULL,
  `COLUMN_8` VARCHAR(80) NULL,
  `COLUMN_9` VARCHAR(80) NULL,
  `COLUMN_10` VARCHAR(80) NULL,
  PRIMARY KEY (`TENANT_ID`, `RECORD_ID`))
ENGINE = InnoDB;


-- LP_TASK Record Example
insert into LP_TASK values ( 1001, 'Design Data Models', 'Paul', '2014-09-01', '2014-10-01', 'FALSE' ) ;

-- TENANT TABLE
insert into TENANT_TABLE( TENANT_ID, TABLE_NAME, TABLE_DESC )
values ( 'TA', 'LP_TASK', 'Task Table for LiquidPlanner' ) ;
-- additional tenant ids for tb and tc
values ( 'TB', 'KB_CARD', 'Task Table for LiquidPlanner B' ) ;
values ( 'TC', 'SC_STORY', 'Task Table for LiquidPlanner C' ) ;

-- TENANT FIELDS
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TA', 'LP_TASK', 'ID', 'INT', 1 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TA', 'LP_TASK', 'DESC', 'VARCHAR(45)', 2 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TA', 'LP_TASK', 'OWNER', 'VARCHAR(45)', 3 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TA', 'LP_TASK', 'PLAN_START', 'DATETIME', 4 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TA', 'LP_TASK', 'PLAN_FINISH', 'DATETIME', 5 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TA', 'LP_TASK', 'DONE', 'VARCHAR(45)', 6 ) ;
-- TB fields
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TB', 'KB_CARD', 'ID', 'INT', 1 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TB', 'KB_CARD', 'DESC', 'VARCHAR(45)', 2 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TB', 'KB_CARD', 'OWNER', 'VARCHAR(45)', 3 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TB', 'KB_CARD', 'PLAN_START', 'DATETIME', 4 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TB', 'KB_CARD', 'PLAN_FINISH', 'DATETIME', 5 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TB', 'KB_CARD', 'DONE', 'VARCHAR(45)', 6 ) ;
-- TB fields
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TC', 'SC_STORY', 'ID', 'INT', 1 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TC', 'SC_STORY', 'DESC', 'VARCHAR(45)', 2 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TC', 'SC_STORY', 'OWNER', 'VARCHAR(45)', 3 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TC', 'SC_STORY', 'PLAN_START', 'DATETIME', 4 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TC', 'SC_STORY', 'PLAN_FINISH', 'DATETIME', 5 ) ;
insert into TENANT_FIELDS( TENANT_ID, TABLE_NAME, FIELD_NAME, FIELD_TYPE, FIELD_COLUMN ) values ( 'TC', 'SC_STORY', 'DONE', 'VARCHAR(45)', 6 ) ;
-- QUERY
select T.TABLE_NAME, F.FIELD_NAME, F.FIELD_TYPE, F.FIELD_COLUMN
from TENANT_TABLE T, TENANT_FIELDS F
where T.TENANT_ID = F.TENANT_ID
and T.TENANT_ID = 'TA'
order by F.FIELD_COLUMN
-- query tb
select T.TABLE_NAME, F.FIELD_NAME, F.FIELD_TYPE, F.FIELD_COLUMN
from TENANT_TABLE T, TENANT_FIELDS F
where T.TENANT_ID = F.TENANT_ID
and T.TENANT_ID = 'TB'
order by F.FIELD_COLUMN
-- query tc
select T.TABLE_NAME, F.FIELD_NAME, F.FIELD_TYPE, F.FIELD_COLUMN
from TENANT_TABLE T, TENANT_FIELDS F
where T.TENANT_ID = F.TENANT_ID
and T.TENANT_ID = 'TC'
order by F.FIELD_COLUMN

-- TENANT_DATA Record Example
insert into TENANT_DATA (RECORD_ID, TENANT_ID, TENANT_TABLE, COLUMN_1, COLUMN_2, COLUMN_3, COLUMN_4, COLUMN_5, COLUMN_6  ) 
values ( '1001', 'TA', 'LP_TASK', '1001', 'Design Data Models', 'Paul', '2014-09-01', '2014-10-01', 'FALSE' ) ;
values ( '1002', 'TB', 'KB_CARD', '1002', 'Design Data Models', 'Paul', '2014-09-01', '2014-10-01', 'FALSE' ) ;
values ( '1003', 'TC', 'SC_STORY', '1003', 'Design Data Models', 'Paul', '2014-09-01', '2014-10-01', 'FALSE' ) ;

-- Test Queries
select * from LP_TASK ;
select * from TENANT_DATA where TENANT_ID = 'TA' ;
-- additional query calls for tb and tc
select * from TENANT_DATA where TENANT_ID = 'TB' ;
select * from TENANT_DATA where TENANT_ID = 'TC' ;


