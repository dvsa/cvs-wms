--liquibase formatted sql
--changeset liquibase:create -multiple-tables:1 splitStatements:true endDelimiter:; context:dev

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        `ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION`;

CREATE TABLE IF NOT EXISTS `ngt_site`
  (
     `id`                INT(11) NOT NULL,
     `site_id`           INT(11) NOT NULL,
     `c_name`            VARCHAR(60) NOT NULL,
     `site_email`        VARCHAR(60)  NOT NULL,
     `site_telephone`    VARCHAR(14)  NOT NULL,
     `c_id`              VARCHAR(9)  NOT NULL,
     `nsi_building`      VARCHAR(30)  DEFAULT NULL,
     `nsi_address1`      VARCHAR(40)  NOT NULL,
     `nsi_county`        VARCHAR(30)  NOT NULL,
     `town`              VARCHAR(255)  NOT NULL,
     `postcode`          VARCHAR(80)  NOT NULL,
     `lat`               FLOAT NOT NULL,
     `lng`               FLOAT NOT NULL,
     `type`              VARCHAR(30)  NOT NULL,
     `nsi_business_unit` VARCHAR(30)  DEFAULT NULL,
     `sub_type`          VARCHAR(255)  NOT NULL,
     `restrictions`      VARCHAR(1000)  NOT NULL,
     `active_flag`       SMALLINT(6) NOT NULL,
     `rag_rating`        VARCHAR(1)  DEFAULT NULL,
     `parent_org`        VARCHAR(60)  DEFAULT NULL,
     `cms_org_id`        VARCHAR(12)  DEFAULT NULL,
     `nsi_view_flag`     VARCHAR(3)  NOT NULL,
     `deleted`           SMALLINT(6) NOT NULL,
     PRIMARY KEY (`id`),
     KEY `nst_site_ind1` (`site_id`),
     KEY `nst_c_ind2` (`c_id`)
  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ngt_staff`
  (
     `id`                     INT(11) NOT NULL,
     `staff_id`               DECIMAL(10, 0) NOT NULL,
     `f_name`                 VARCHAR(60) CHARACTER SET utf16 NOT NULL,
     `s_name`                 VARCHAR(60) CHARACTER SET utf16 NOT NULL,
     `username`               VARCHAR(12) CHARACTER SET utf16 DEFAULT NULL,
     `staffnumber`            VARCHAR(9) CHARACTER SET utf16 NOT NULL,
     `hen_email_address`      VARCHAR(60) CHARACTER SET utf16 NOT NULL,
     `nsf_option`             VARCHAR(4) CHARACTER SET utf16 NOT NULL,
     `nsf_staff_telephone`    VARCHAR(14) CHARACTER SET utf16 DEFAULT NULL,
     `hen_location`           VARCHAR(60) CHARACTER SET utf16 NOT NULL,
     `manager_id`             DECIMAL(10, 0) NOT NULL,
     `staff_role_description` VARCHAR(12) CHARACTER SET utf16 NOT NULL,
     `wsr_access_level`       DECIMAL(10, 0) DEFAULT NULL,
     `wsr_group`              VARCHAR(30) CHARACTER SET utf16 DEFAULT NULL,
     `ns_week_hrs`            DECIMAL(10, 0) NOT NULL,
     `ns_year_hrs`            DECIMAL(10, 0) NOT NULL,
     `postcode`               VARCHAR(80) CHARACTER SET utf16 NOT NULL,
     `lat`                    FLOAT NOT NULL,
     `lng`                    FLOAT NOT NULL,
     `home_postcode`          VARCHAR(80) CHARACTER SET utf16 NOT NULL,
     `home_lat`               FLOAT NOT NULL,
     `home_lng`               FLOAT NOT NULL,
     `deploy_postcode`        VARCHAR(80) CHARACTER SET utf16 NOT NULL,
     `deploy_lat`             FLOAT NOT NULL,
     `deploy_lng`             FLOAT NOT NULL,
     `deploy_flag`            SMALLINT(6) NOT NULL,
     `ns_business_unit`       VARCHAR(60) CHARACTER SET utf16 DEFAULT NULL,
     `ns_ngt_start`           DATETIME NOT NULL,
     `active_flag`            SMALLINT(6) NOT NULL,
     `nsf_view_flag`          VARCHAR(3) CHARACTER SET utf16 NOT NULL,
     `deleted`                SMALLINT(6) NOT NULL,
     PRIMARY KEY (`id`),
     KEY nsf_staff_ind1 (`staff_id`)
  )
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ngt_site_events`
  (
     `id`                DECIMAL(10, 0) NOT NULL,
     `site_event_id`     DECIMAL(10, 0) NOT NULL,
     `site_id`           DECIMAL(10, 0) NOT NULL,
     `cms_org_id`        VARCHAR(9) CHARACTER SET utf16 NOT NULL,
     `site_type`         VARCHAR(6) CHARACTER SET utf16 NOT NULL,
     `skills_group`      VARCHAR(12) CHARACTER SET utf16 DEFAULT NULL,
     `event_date`        DATETIME NOT NULL,
     `event_start`       VARCHAR(10) NOT NULL,
     `event_end`         VARCHAR(10) NOT NULL,
     `event_duration`    VARCHAR(12) CHARACTER SET utf16 NOT NULL,
     `durationm`         DECIMAL(10, 0) NOT NULL,
     `status`            VARCHAR(30) CHARACTER SET utf16 NOT NULL,
     `workflow_stage`    DECIMAL(2, 1) NOT NULL,
     `p_booked`          SMALLINT(6) NOT NULL,
     `confirmed_flag`    SMALLINT(6) NOT NULL,
     `type_booking`      VARCHAR(9) CHARACTER SET utf16 NOT NULL,
     `scheduled`         SMALLINT(6) NOT NULL,
     `staff_id`          DECIMAL(10, 0) NOT NULL,
     `cnx_email`         SMALLINT(6) NOT NULL,
     `nse_order_num`     VARCHAR(15) CHARACTER SET utf16 DEFAULT NULL,
     `nse_split_event`   SMALLINT(6) NOT NULL,
     `nse_multi`         SMALLINT(6) NOT NULL,
     `on_call_completed` SMALLINT(6) NOT NULL,
     `deleted`           SMALLINT(6) NOT NULL,
     `created`           DATETIME DEFAULT NULL,
     `created_by`        DECIMAL(10, 0) NOT NULL,
     PRIMARY KEY (`id`),
     KEY nse_site_event_ind1 (`site_event_id`),
     KEY nse_site_ind2 (`site_id`),
     KEY nse_staff_ind3 (`staff_id`),
     KEY nse_event_date_ind4 (`event_date`)
  )
  ENGINE = InnoDB;
  