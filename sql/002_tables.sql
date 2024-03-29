--liquibase formatted sql
--changeset liquibase:create -multiple-tables:1 splitStatements:true endDelimiter:; context:dev

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        `ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION`;

CREATE TABLE IF NOT EXISTS NGT_SITE
  (
     ID                INT(11) NOT NULL,
     SITE_ID           INT(11) NOT NULL,
     C_NAME            VARCHAR(60) NOT NULL,
     SITE_EMAIL        VARCHAR(60)  NOT NULL,
     SITE_TELEPHONE    VARCHAR(14)  NOT NULL,
     C_ID              VARCHAR(9)  NOT NULL,
     NSI_BUILDING      VARCHAR(30)  DEFAULT NULL,
     NSI_ADDRESS1      VARCHAR(40)  NOT NULL,
     NSI_COUNTY        VARCHAR(30)  NOT NULL,
     TOWN              VARCHAR(255)  NOT NULL,
     POSTCODE          VARCHAR(80)  NOT NULL,
     LAT               FLOAT NOT NULL,
     LNG               FLOAT NOT NULL,
     TYPE              VARCHAR(30)  NOT NULL,
     NSI_BUSINESS_UNIT VARCHAR(30)  DEFAULT NULL,
     SUB_TYPE          VARCHAR(255)  NOT NULL,
     RESTRICTIONS      VARCHAR(1000)  NOT NULL,
     ACTIVE_FLAG       SMALLINT(6) NOT NULL,
     RAG_RATING        VARCHAR(1)  DEFAULT NULL,
     PARENT_ORG        VARCHAR(60)  DEFAULT NULL,
     CMS_ORG_ID        VARCHAR(12)  DEFAULT NULL,
     NSI_VIEW_FLAG     VARCHAR(3)  NOT NULL,
     DELETED           SMALLINT(6) NOT NULL,
     PRIMARY KEY (ID),
     KEY NST_SITE_IND1 (SITE_ID),
     KEY NST_C_IND2 (C_ID)
  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS NGT_STAFF
  (
     ID                     INT(11) NOT NULL,
     STAFF_ID               DECIMAL(10, 0) NOT NULL,
     F_NAME                 VARCHAR(60) CHARACTER SET UTF16 NOT NULL,
     S_NAME                 VARCHAR(60) CHARACTER SET UTF16 NOT NULL,
     USERNAME               VARCHAR(12) CHARACTER SET UTF16 DEFAULT NULL,
     STAFFNUMBER            VARCHAR(9) CHARACTER SET UTF16 NOT NULL,
     HEN_EMAIL_ADDRESS      VARCHAR(60) CHARACTER SET UTF16 NOT NULL,
     NSF_OPTION             VARCHAR(4) CHARACTER SET UTF16 NOT NULL,
     NSF_STAFF_TELEPHONE    VARCHAR(14) CHARACTER SET UTF16 DEFAULT NULL,
     HEN_LOCATION           VARCHAR(60) CHARACTER SET UTF16 NOT NULL,
     MANAGER_ID             DECIMAL(10, 0) NOT NULL,
     STAFF_ROLE_DESCRIPTION VARCHAR(12) CHARACTER SET UTF16 NOT NULL,
     WSR_ACCESS_LEVEL       DECIMAL(10, 0) DEFAULT NULL,
     WSR_GROUP              VARCHAR(30) CHARACTER SET UTF16 DEFAULT NULL,
     NS_WEEK_HRS            DECIMAL(10, 0) NOT NULL,
     NS_YEAR_HRS            DECIMAL(10, 0) NOT NULL,
     POSTCODE               VARCHAR(80) CHARACTER SET UTF16 NOT NULL,
     LAT                    FLOAT NOT NULL,
     LNG                    FLOAT NOT NULL,
     HOME_POSTCODE          VARCHAR(80) CHARACTER SET UTF16 NOT NULL,
     HOME_LAT               FLOAT NOT NULL,
     HOME_LNG               FLOAT NOT NULL,
     DEPLOY_POSTCODE        VARCHAR(80) CHARACTER SET UTF16 NOT NULL,
     DEPLOY_LAT             FLOAT NOT NULL,
     DEPLOY_LNG             FLOAT NOT NULL,
     DEPLOY_FLAG            SMALLINT(6) NOT NULL,
     NS_BUSINESS_UNIT       VARCHAR(60) CHARACTER SET UTF16 DEFAULT NULL,
     NS_NGT_START           DATETIME NOT NULL,
     ACTIVE_FLAG            SMALLINT(6) NOT NULL,
     NSF_VIEW_FLAG          VARCHAR(3) CHARACTER SET UTF16 NOT NULL,
     DELETED                SMALLINT(6) NOT NULL,
     PRIMARY KEY (ID),
     KEY NSF_STAFF_IND1 (STAFF_ID)
  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS NGT_SITE_EVENTS
  (
     ID                DECIMAL(10, 0) NOT NULL,
     SITE_EVENT_ID     DECIMAL(10, 0) NOT NULL,
     SITE_ID           DECIMAL(10, 0) NOT NULL,
     CMS_ORG_ID        VARCHAR(9) CHARACTER SET UTF16 NOT NULL,
     SITE_TYPE         VARCHAR(6) CHARACTER SET UTF16 NOT NULL,
     SKILLS_GROUP      VARCHAR(12) CHARACTER SET UTF16 DEFAULT NULL,
     EVENT_DATE        DATETIME NOT NULL,
     EVENT_START       VARCHAR(10) NOT NULL,
     EVENT_END         VARCHAR(10) NOT NULL,
     EVENT_DURATION    VARCHAR(12) CHARACTER SET UTF16 NOT NULL,
     DURATIONM         DECIMAL(10, 0) NOT NULL,
     STATUS            VARCHAR(30) CHARACTER SET UTF16 NOT NULL,
     WORKFLOW_STAGE    DECIMAL(2, 1) NOT NULL,
     P_BOOKED          SMALLINT(6) NOT NULL,
     CONFIRMED_FLAG    SMALLINT(6) NOT NULL,
     TYPE_BOOKING      VARCHAR(9) CHARACTER SET UTF16 NOT NULL,
     SCHEDULED         SMALLINT(6) NOT NULL,
     STAFF_ID          DECIMAL(10, 0) NOT NULL,
     CNX_EMAIL         SMALLINT(6) NOT NULL,
     NSE_ORDER_NUM     VARCHAR(15) CHARACTER SET UTF16 DEFAULT NULL,
     NSE_SPLIT_EVENT   SMALLINT(6) NOT NULL,
     NSE_MULTI         SMALLINT(6) NOT NULL,
     ON_CALL_COMPLETED SMALLINT(6) NOT NULL,
     DELETED           SMALLINT(6) NOT NULL,
     CREATED           DATETIME DEFAULT NULL,
     CREATED_BY        DECIMAL(10, 0) NOT NULL,
     PRIMARY KEY (ID),
     KEY nse_site_event_ind1 (SITE_EVENT_ID),
     KEY nse_site_ind2 (SITE_ID),
     KEY nse_staff_ind3 (STAFF_ID),
     KEY nse_event_date_ind4 (EVENT_DATE)
  )
  ENGINE = InnoDB;
  