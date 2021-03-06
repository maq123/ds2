
-- mysqlds2_cleanup_med.sql: cleans up new users and orders; restart mysql after running to reset Identity columns

use DS2;

SET UNIQUE_CHECKS=0;
SET FOREIGN_KEY_CHECKS=0;

alter table CUSTOMERS DISABLE KEYS;
alter table ORDERS DISABLE KEYS;
alter table ORDERLINES DISABLE KEYS;
alter table CUST_HIST DISABLE KEYS;

delete from CUSTOMERS where CUSTOMERID > 2000000;
delete from ORDERS where ORDERID > 1200000;
delete from ORDERLINES where ORDERID > 1200000;
delete from CUST_HIST where ORDERID > 1200000;

alter table CUST_HIST ENABLE KEYS;
alter table ORDERLINES ENABLE KEYS;
alter table ORDERS ENABLE KEYS;
alter table CUSTOMERS ENABLE KEYS;

SET FOREIGN_KEY_CHECKS=1;
SET UNIQUE_CHECKS=1;

drop table INVENTORY;

CREATE TABLE INVENTORY
  (
  PROD_ID INT NOT NULL PRIMARY KEY,
  QUAN_IN_STOCK INT NOT NULL,
  SALES INT NOT NULL
  )
  TYPE=InnoDB;

alter table INVENTORY DISABLE KEYS;

LOAD DATA LOCAL INFILE "../../data_files/prod/inv.csv"
  INTO TABLE INVENTORY 
  FIELDS TERMINATED BY
  ',' OPTIONALLY ENCLOSED BY '"';

alter table INVENTORY ENABLE KEYS;

