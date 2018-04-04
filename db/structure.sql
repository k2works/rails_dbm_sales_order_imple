
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
DROP TABLE IF EXISTS `ALTERNATE_PRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ALTERNATE_PRODUCTS` (
  `PROD_CODE` varchar(16) NOT NULL COMMENT '商品コード',
  `ALT_PROD_CODE` varchar(16) NOT NULL COMMENT '代替商品コード',
  `PRIORITY` int(2) DEFAULT '1' COMMENT '優先順位',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`PROD_CODE`,`ALT_PROD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='代替商品';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `APPROVAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APPROVAL` (
  `APPROVAL_CODE` varchar(2) NOT NULL COMMENT '承認権限コード',
  `APPROVAL_NAME` varchar(40) DEFAULT NULL COMMENT '承認権限名',
  PRIMARY KEY (`APPROVAL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='電子承認マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `AUTO_NUMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTO_NUMBER` (
  `SLIP_TYPE` varchar(2) NOT NULL COMMENT '伝票種別コード',
  `YEARMONTH` datetime NOT NULL COMMENT '年月',
  `LAST_SILP_NO` int(4) NOT NULL DEFAULT '0' COMMENT '最終伝票番号',
  PRIMARY KEY (`SLIP_TYPE`,`YEARMONTH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='自動採番マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `BANK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BANK` (
  `BANK_ACUT_CODE` varchar(8) NOT NULL COMMENT '入金口座コード',
  `RECIVE_ACT_NAME` varchar(30) DEFAULT NULL COMMENT '入金口座名',
  `APPL_START_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '適用開始日',
  `APPL_END_DATE` datetime DEFAULT '2100-12-31 00:00:00' COMMENT '適用終了日',
  `START_ACT_NAME` varchar(30) DEFAULT NULL COMMENT '適用開始後入金口座名',
  `RECIVE_BANK_ACT_TYPE` varchar(1) DEFAULT NULL COMMENT '入金口座区分',
  `RECIVE_ACT_NO` varchar(12) DEFAULT NULL COMMENT '入金口座番号',
  `BANK_ACT_TYPE` varchar(1) DEFAULT NULL COMMENT '銀行口座種別',
  `ACT_NAME` varchar(20) DEFAULT NULL COMMENT '口座名義人',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '部門コード',
  `START_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '開始日',
  `A_BANK_CODE` varchar(4) DEFAULT NULL COMMENT '全銀協銀行コード',
  `A_BANK_BLNC_CODE` varchar(3) DEFAULT NULL COMMENT '全銀協支店コード',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  `UPDATE_PLG_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'プログラム更新日時',
  `UPDATE_PGM` varchar(50) DEFAULT NULL COMMENT '更新プログラム名',
  PRIMARY KEY (`BANK_ACUT_CODE`),
  KEY `DEPT_CODE` (`DEPT_CODE`,`START_DATE`),
  CONSTRAINT `BANK_ibfk_1` FOREIGN KEY (`DEPT_CODE`, `START_DATE`) REFERENCES `DEPT_MST` (`DEPT_CODE`, `START_DATE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入金口座マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `BOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOM` (
  `PROD_CODE` varchar(16) NOT NULL COMMENT '商品コード',
  `BOM_CODE` varchar(16) NOT NULL COMMENT '部品コード',
  `QUANTITY` int(4) NOT NULL DEFAULT '1' COMMENT '部品数量',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`PROD_CODE`,`BOM_CODE`),
  CONSTRAINT `BOM_ibfk_1` FOREIGN KEY (`PROD_CODE`) REFERENCES `PRODUCTS` (`PROD_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部品表';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CATEGORY_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORY_TYPE` (
  `CATEGORY_TYPE_CODE` varchar(2) NOT NULL COMMENT '取引先分類種別コード',
  `CATE_TYPE_NAME` varchar(20) DEFAULT NULL COMMENT '取引先分類種別名',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`CATEGORY_TYPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='取引先分類種別マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `COMPANYS_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPANYS_MST` (
  `COMP_CODE` varchar(8) NOT NULL COMMENT '取引先コード',
  `COMP_NAME` varchar(40) NOT NULL COMMENT '取引先名',
  `COMP_KANA` varchar(40) DEFAULT NULL COMMENT '取引先名カナ',
  `SUP_TYPE` int(1) DEFAULT '0' COMMENT '仕入先区分',
  `ZIP_CODE` char(8) DEFAULT NULL COMMENT '郵便番号',
  `STATE` varchar(4) DEFAULT NULL COMMENT '都道府県',
  `ADDRESS1` varchar(40) DEFAULT NULL COMMENT '住所１',
  `ADDRESS2` varchar(40) DEFAULT NULL COMMENT '住所２',
  `NO_SALES_FLG` int(1) DEFAULT '0' COMMENT '取引禁止フラグ',
  `WIDE_USE_TYPE` int(1) DEFAULT NULL COMMENT '雑区分',
  `COMP_GROUP_CODE` varchar(4) NOT NULL COMMENT '取引先グループコード',
  `MAX_CREDIT` int(10) DEFAULT NULL COMMENT '与信限度額',
  `TEMP_CREDIT_UP` int(10) DEFAULT '0' COMMENT '与信一時増加枠',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`COMP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='取引先マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `COMPANY_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPANY_CATEGORY` (
  `CATEGORY_TYPE` varchar(2) NOT NULL COMMENT '取引先分類種別コード',
  `COMP_CATE_CODE` varchar(8) NOT NULL COMMENT '取引先分類コード',
  `COMP_CATE_NAME` varchar(30) DEFAULT NULL COMMENT '取引先分類名',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`COMP_CATE_CODE`,`CATEGORY_TYPE`),
  KEY `CATEGORY_TYPE` (`CATEGORY_TYPE`),
  CONSTRAINT `COMPANY_CATEGORY_ibfk_1` FOREIGN KEY (`CATEGORY_TYPE`) REFERENCES `CATEGORY_TYPE` (`CATEGORY_TYPE_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='取引先分類マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `COMPANY_CATEGORY_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPANY_CATEGORY_GROUP` (
  `CATEGORY_TYPE` varchar(2) NOT NULL COMMENT '取引先分類種別コード',
  `COMP_CATE_CODE` varchar(8) NOT NULL COMMENT '取引先分類コード',
  `COMP_CODE` varchar(8) NOT NULL COMMENT '取引先コード',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`CATEGORY_TYPE`,`COMP_CODE`,`COMP_CATE_CODE`),
  KEY `COMP_CATE_CODE` (`COMP_CATE_CODE`,`CATEGORY_TYPE`),
  CONSTRAINT `COMPANY_CATEGORY_GROUP_ibfk_1` FOREIGN KEY (`COMP_CATE_CODE`, `CATEGORY_TYPE`) REFERENCES `COMPANY_CATEGORY` (`COMP_CATE_CODE`, `CATEGORY_TYPE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='取引先分類所属マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `COMPANY_GROUP_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPANY_GROUP_MST` (
  `COMP_GROUP_CODE` varchar(4) NOT NULL COMMENT '取引先グループコード',
  `GROUP_NAME` varchar(40) DEFAULT NULL COMMENT '取引先グループ名',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`COMP_GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='取引先グループマスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CREDIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDIT` (
  `CREDIT_NO` varchar(10) NOT NULL COMMENT '入金番号',
  `CREDIT_DATE` datetime DEFAULT NULL COMMENT '入金日',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '部門コード',
  `START_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '開始日',
  `COMP_CODE` varchar(8) NOT NULL COMMENT '顧客コード',
  `COMP_SUB_NO` int(2) DEFAULT NULL COMMENT '顧客枝番',
  `PAY_METHOD_TYPE` int(1) DEFAULT '1' COMMENT '支払方法区分',
  `BANK_ACUT_CODE` varchar(8) DEFAULT NULL COMMENT '入金口座コード',
  `RECEIVED_AMNT` int(13) DEFAULT '0' COMMENT '入金金額',
  `RECEIVED` int(13) DEFAULT '0' COMMENT '消込金額',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  `UPDATE_PLG_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'プログラム更新日時',
  `UPDATE_PGM` varchar(50) DEFAULT NULL COMMENT '更新プログラム名',
  PRIMARY KEY (`CREDIT_NO`),
  KEY `DEPT_CODE` (`DEPT_CODE`,`START_DATE`),
  CONSTRAINT `CREDIT_ibfk_1` FOREIGN KEY (`DEPT_CODE`, `START_DATE`) REFERENCES `DEPT_MST` (`DEPT_CODE`, `START_DATE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='入金データ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CREDIT_BALANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDIT_BALANCE` (
  `COMP_CODE` varchar(8) NOT NULL COMMENT '取引先コード',
  `ORDER_BALANCE` int(13) DEFAULT '0' COMMENT '受注残高',
  `REC_BALANCE` int(13) DEFAULT '0' COMMENT '債権残高',
  `PAY_BALANCE` int(13) DEFAULT '0' COMMENT '債務残高',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`COMP_CODE`),
  CONSTRAINT `CREDIT_BALANCE_ibfk_1` FOREIGN KEY (`COMP_CODE`) REFERENCES `COMPANYS_MST` (`COMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='与信残高データ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CUSTOMERS_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMERS_MST` (
  `CUST_CODE` varchar(8) NOT NULL COMMENT '顧客コード',
  `CUST_SUB_NO` int(2) NOT NULL COMMENT '顧客枝番',
  `CUST_TYPE` int(1) DEFAULT '0' COMMENT '顧客区分',
  `AR_CODE` varchar(8) NOT NULL COMMENT '請求先コード',
  `AR_SUB_NO` int(2) DEFAULT NULL COMMENT '請求先枝番',
  `PAYER_CODE` varchar(8) NOT NULL COMMENT '回収先コード',
  `PAYER_SUB_NO` int(2) DEFAULT NULL COMMENT '回収先枝番',
  `CUST_NAME` varchar(40) NOT NULL COMMENT '顧客名',
  `CUST_KANA` varchar(40) DEFAULT NULL COMMENT '顧客名カナ',
  `EMP_CODE` varchar(10) NOT NULL COMMENT '自社担当者コード',
  `CUST_USER_NAME` varchar(20) DEFAULT NULL COMMENT '顧客担当者名',
  `CUST_USER_DEP_NAME` varchar(40) DEFAULT NULL COMMENT '顧客部門名',
  `CUST_ZIP_CODE` char(8) DEFAULT NULL COMMENT '顧客郵便番号',
  `CUST_STATE` varchar(4) DEFAULT NULL COMMENT '顧客都道府県',
  `CUST_ADDRESS1` varchar(40) DEFAULT NULL COMMENT '顧客住所１',
  `CUST_ADDRESS2` varchar(40) DEFAULT NULL COMMENT '顧客住所２',
  `CUST_TEL` varchar(13) DEFAULT NULL COMMENT '顧客電話番号',
  `CUST_FAX` varchar(13) DEFAULT NULL COMMENT '顧客FAX番号',
  `CUST_EMAIL` varchar(100) DEFAULT NULL COMMENT '顧客メールアドレス',
  `CUST_AR_FLAG` int(1) DEFAULT NULL COMMENT '顧客請求区分',
  `CUST_CLOSE_DATE1` int(2) NOT NULL COMMENT '顧客締日１',
  `CUST_PAY_MONTHS1` int(1) DEFAULT '1' COMMENT '顧客支払月１',
  `CUST_PAY_DATES1` int(1) DEFAULT NULL COMMENT '顧客支払日１',
  `CUST_PAY_METHOD1` int(1) DEFAULT '1' COMMENT '顧客支払方法１',
  `CUST_CLOSE_DATE2` int(2) NOT NULL COMMENT '顧客締日２',
  `CUST_PAY_MONTHS2` int(1) DEFAULT '1' COMMENT '顧客支払月２',
  `CUST_PAY_DATES2` int(1) DEFAULT NULL COMMENT '顧客支払日２',
  `CUST_PAY_METHOD2` int(1) DEFAULT '1' COMMENT '顧客支払方法２',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`CUST_CODE`,`CUST_SUB_NO`),
  CONSTRAINT `CUSTOMERS_MST_ibfk_1` FOREIGN KEY (`CUST_CODE`) REFERENCES `COMPANYS_MST` (`COMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='顧客マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `DEPT_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPT_MST` (
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '部門コード',
  `START_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '開始日',
  `END_DATE` datetime DEFAULT '2100-12-31 00:00:00' COMMENT '終了日',
  `DEP_NAME` varchar(40) DEFAULT NULL COMMENT '部門名',
  `LAYER` int(2) NOT NULL DEFAULT '0' COMMENT '組織階層',
  `UP_DIVISION_CODE` varchar(5) NOT NULL COMMENT '上位部門コード',
  `SLIT_YN` int(1) DEFAULT '1' COMMENT '伝票入力可否',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`DEPT_CODE`,`START_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部門マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `DESTINATIONS_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DESTINATIONS_MST` (
  `COMP_CODE` varchar(8) NOT NULL COMMENT '取引先コード',
  `COMP_SUB_NO` int(2) NOT NULL COMMENT '顧客枝番',
  `DIST_NO` int(2) NOT NULL COMMENT '出荷先番号',
  `DIST_NAME` varchar(40) NOT NULL COMMENT '出荷先名',
  `ZIP_CODE` char(8) DEFAULT NULL COMMENT '出荷先郵便番号',
  `ADDRESS1` varchar(40) DEFAULT NULL COMMENT '出荷先住所１',
  `ADDRESS2` varchar(40) DEFAULT NULL COMMENT '出荷先住所２',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`COMP_CODE`,`DIST_NO`,`COMP_SUB_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出荷先マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEE` (
  `EMP_CODE` varchar(10) NOT NULL COMMENT '社員コード',
  `EMP_NAME` varchar(20) DEFAULT NULL COMMENT '社員名',
  `EMP_KANA` varchar(40) DEFAULT NULL COMMENT '社員名カナ',
  `PASSWORD` varchar(8) DEFAULT NULL COMMENT 'パスワード',
  `TEL` varchar(13) DEFAULT NULL COMMENT '電話番号',
  `FAX` varchar(13) DEFAULT NULL COMMENT 'FAX番号',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '部門コード',
  `START_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '開始日',
  `OCCU_CODE` varchar(2) NOT NULL COMMENT '職種コード',
  `APPROVAL_CODE` varchar(2) NOT NULL COMMENT '承認権限コード',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`EMP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='社員マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `INVOICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVOICE` (
  `INVOICE_NO` varchar(10) NOT NULL COMMENT '請求番号',
  `INVOICED_DATE` datetime DEFAULT NULL COMMENT '請求日',
  `COMP_CODE` varchar(8) NOT NULL COMMENT '取引先コード',
  `CUST_SUB_NO` int(2) DEFAULT NULL COMMENT '顧客枝番',
  `LAST_RECEIVED` int(13) DEFAULT NULL COMMENT '前回入金額',
  `MONTH_SALES` int(13) DEFAULT NULL COMMENT '当月売上額',
  `MONTH_RECEIVED` int(13) DEFAULT NULL COMMENT '当月入金額',
  `MONTH_INVOICE` int(13) DEFAULT NULL COMMENT '当月請求額',
  `CMP_TAX` int(10) NOT NULL DEFAULT '0' COMMENT '消費税金額',
  `INVOICE_RECEIVED` int(13) DEFAULT '0' COMMENT '請求消込金額',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`INVOICE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='請求データ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `INVOICE_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVOICE_DETAILS` (
  `INVOICE_NO` varchar(10) NOT NULL COMMENT '請求番号',
  `SALES_NO` varchar(10) NOT NULL COMMENT '売上番号',
  `ROW_NO` int(3) NOT NULL COMMENT '売上行番号',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`INVOICE_NO`,`SALES_NO`,`ROW_NO`),
  CONSTRAINT `INVOICE_DETAILS_ibfk_1` FOREIGN KEY (`INVOICE_NO`) REFERENCES `INVOICE` (`INVOICE_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='請求データ明細';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOCATION` (
  `WH_CODE` varchar(3) NOT NULL COMMENT '倉庫コード',
  `LOCATION_CODE` varchar(4) NOT NULL COMMENT '棚番コード',
  `PROD_CODE` varchar(16) NOT NULL COMMENT '商品コード',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`WH_CODE`,`LOCATION_CODE`,`PROD_CODE`),
  KEY `PROD_CODE` (`PROD_CODE`),
  CONSTRAINT `LOCATION_ibfk_1` FOREIGN KEY (`WH_CODE`) REFERENCES `WH_MST` (`WH_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LOCATION_ibfk_2` FOREIGN KEY (`PROD_CODE`) REFERENCES `PRODUCTS` (`PROD_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='棚番マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `OCCUPATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OCCUPATION` (
  `OCCU_CODE` varchar(2) NOT NULL COMMENT '職種コード',
  `OCCU_NAME` varchar(20) NOT NULL COMMENT '職種名',
  PRIMARY KEY (`OCCU_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='職種区分';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDERS` (
  `ORDER_NO` varchar(10) NOT NULL COMMENT '受注番号',
  `ORDER_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '受注日',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '部門コード',
  `CUST_CODE` varchar(8) NOT NULL COMMENT '顧客コード',
  `CUST_SUB_NO` int(2) DEFAULT NULL COMMENT '顧客枝番',
  `EMP_CODE` varchar(10) NOT NULL COMMENT '社員コード',
  `REQUIRED_DATE` datetime DEFAULT NULL COMMENT '希望納期',
  `CUSTORDER_NO` varchar(20) DEFAULT NULL COMMENT '客先注文番号',
  `WH_CODE` varchar(3) NOT NULL COMMENT '倉庫コード',
  `ORDER_AMNT` int(10) NOT NULL DEFAULT '0' COMMENT '受注金額合計',
  `CMP_TAX` int(10) NOT NULL DEFAULT '0' COMMENT '消費税金額',
  `SLIP_COMMENT` varchar(1000) DEFAULT NULL COMMENT '備考',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`ORDER_NO`),
  KEY `EMP_CODE` (`EMP_CODE`),
  KEY `CUST_CODE` (`CUST_CODE`,`CUST_SUB_NO`),
  KEY `WH_CODE` (`WH_CODE`),
  CONSTRAINT `ORDERS_ibfk_1` FOREIGN KEY (`EMP_CODE`) REFERENCES `EMPLOYEE` (`EMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ORDERS_ibfk_2` FOREIGN KEY (`CUST_CODE`, `CUST_SUB_NO`) REFERENCES `CUSTOMERS_MST` (`CUST_CODE`, `CUST_SUB_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ORDERS_ibfk_3` FOREIGN KEY (`WH_CODE`) REFERENCES `WH_MST` (`WH_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='受注データ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ORDER_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_DETAILS` (
  `ORDER_NO` varchar(10) NOT NULL COMMENT '受注番号',
  `SO_ROW_NO` int(3) NOT NULL COMMENT '受注行番号',
  `PROD_CODE` varchar(16) NOT NULL COMMENT '商品コード',
  `PROD_NAME` varchar(10) NOT NULL COMMENT '商品名',
  `UNITPRICE` int(8) NOT NULL DEFAULT '0' COMMENT '販売単価',
  `QUANTITY` int(4) NOT NULL DEFAULT '1' COMMENT '受注数量',
  `CMP_TAX_RATE` int(3) DEFAULT NULL COMMENT '消費税率',
  `RESERVE_QTY` int(4) DEFAULT '0' COMMENT '引当数量',
  `DELIVERY_ORDER_QTY` int(4) DEFAULT '0' COMMENT '出荷指示数量',
  `DELIVERED_QTY` int(4) DEFAULT '0' COMMENT '出荷済数量',
  `COMPLETE_FLG` int(1) NOT NULL DEFAULT '0' COMMENT '完了フラグ',
  `DISCOUNT` int(4) NOT NULL DEFAULT '0' COMMENT '値引金額',
  `DELIVERY_DATE` datetime DEFAULT NULL COMMENT '納期',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`ORDER_NO`,`SO_ROW_NO`),
  CONSTRAINT `ORDER_DETAILS_ibfk_1` FOREIGN KEY (`ORDER_NO`) REFERENCES `ORDERS` (`ORDER_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='受注データ明細';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAY` (
  `PAY_NO` varchar(10) NOT NULL COMMENT '支払番号',
  `PAY_DATE` int(1) DEFAULT NULL COMMENT '支払日',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '部門コード',
  `SUP_CODE` varchar(8) NOT NULL COMMENT '仕入先コード',
  `SUP_SUB_NO` int(2) DEFAULT NULL COMMENT '仕入先枝番',
  `PAY_METHOD_TYPE` int(1) DEFAULT '1' COMMENT '支払方法区分',
  `PAY_AMNT` int(13) DEFAULT NULL COMMENT '支払金額',
  `CMP_TAX` int(10) NOT NULL DEFAULT '0' COMMENT '消費税金額',
  `COMPLETE_FLG` int(1) NOT NULL DEFAULT '0' COMMENT '支払完了フラグ',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  `START_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '開始日',
  PRIMARY KEY (`PAY_NO`),
  KEY `SUP_CODE` (`SUP_CODE`,`SUP_SUB_NO`),
  KEY `DEPT_CODE` (`DEPT_CODE`,`START_DATE`),
  CONSTRAINT `PAY_ibfk_1` FOREIGN KEY (`SUP_CODE`, `SUP_SUB_NO`) REFERENCES `SUPPLIER_MST` (`SUP_CODE`, `SUP_SUB_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PAY_ibfk_2` FOREIGN KEY (`DEPT_CODE`, `START_DATE`) REFERENCES `DEPT_MST` (`DEPT_CODE`, `START_DATE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支払データ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PO_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PO_DETAILS` (
  `PO_NO` varchar(10) NOT NULL COMMENT '発注番号',
  `PO_ROW_NO` int(3) NOT NULL COMMENT '発注行番号',
  `PO_ROW_DSP_NO` int(3) NOT NULL COMMENT '発注行表示番号',
  `ORDER_NO` varchar(10) NOT NULL COMMENT '受注番号',
  `SO_ROW_NO` int(3) NOT NULL COMMENT '受注行番号',
  `PROD_CODE` varchar(16) NOT NULL COMMENT '商品コード',
  `PROD_NAME` varchar(10) NOT NULL COMMENT '商品名',
  `PO_PRICE` int(8) DEFAULT '0' COMMENT '仕入単価',
  `PO_QT` int(4) NOT NULL DEFAULT '1' COMMENT '発注数量',
  `RECIVED_QT` int(4) NOT NULL DEFAULT '1' COMMENT '入荷済数量',
  `COMPLETE_FLG` int(1) NOT NULL DEFAULT '0' COMMENT '完了フラグ',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`PO_NO`,`PO_ROW_NO`),
  CONSTRAINT `PO_DETAILS_ibfk_1` FOREIGN KEY (`PO_NO`) REFERENCES `PURCHASE_ORDERS` (`PO_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='発注データ明細';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PRICEBYCUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRICEBYCUSTOMER` (
  `PROD_CODE` varchar(16) NOT NULL COMMENT '商品コード',
  `COMP_CODE` varchar(8) NOT NULL COMMENT '取引先コード',
  `UNITPRICE` int(8) NOT NULL DEFAULT '0' COMMENT '販売単価',
  PRIMARY KEY (`PROD_CODE`,`COMP_CODE`),
  KEY `COMP_CODE` (`COMP_CODE`),
  CONSTRAINT `PRICEBYCUSTOMER_ibfk_1` FOREIGN KEY (`COMP_CODE`) REFERENCES `COMPANYS_MST` (`COMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='顧客別販売単価';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTS` (
  `PROD_CODE` varchar(16) NOT NULL COMMENT '商品コード',
  `PROD_FULLNAME` varchar(40) NOT NULL COMMENT '商品正式名',
  `PROD_NAME` varchar(10) NOT NULL COMMENT '商品名',
  `PROD_KANA` varchar(20) NOT NULL COMMENT '商品名カナ',
  `PROD_TYPE` varchar(1) DEFAULT NULL COMMENT '商品区分',
  `SERIAL_NO` varchar(40) DEFAULT NULL COMMENT '製品型番',
  `UNITPRICE` int(8) NOT NULL DEFAULT '0' COMMENT '販売単価',
  `PO_PRICE` int(8) DEFAULT '0' COMMENT '仕入単価',
  `COST` int(8) NOT NULL DEFAULT '0' COMMENT '売上原価',
  `TAX_TYPE` int(1) NOT NULL DEFAULT '1' COMMENT '税区分',
  `CATEGORY_CODE` varchar(8) DEFAULT NULL COMMENT '商品分類コード',
  `WIDE_USE_TYPE` int(1) DEFAULT NULL COMMENT '雑区分',
  `STOCK_MANAGE_TYPE` int(1) DEFAULT '1' COMMENT '在庫管理対象区分',
  `STOCK_RESERVE_TYPE` int(1) DEFAULT NULL COMMENT '在庫引当区分',
  `SUP_CODE` varchar(8) NOT NULL COMMENT '仕入先コード',
  `SUP_SUB_NO` int(2) DEFAULT NULL COMMENT '仕入先枝番',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`PROD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PRODUCT_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_CATEGORY` (
  `CATEGORY_CODE` varchar(8) NOT NULL COMMENT '商品分類コード',
  `PROD_CATE_NAME` varchar(30) DEFAULT NULL COMMENT '商品分類名',
  `LAYER` int(2) NOT NULL DEFAULT '0' COMMENT '階層',
  `UPPER_CATEGORY` varchar(8) DEFAULT NULL COMMENT '上位商品分類コード',
  PRIMARY KEY (`CATEGORY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分類マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PURCHASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PURCHASE` (
  `PU_NO` varchar(10) NOT NULL COMMENT '仕入番号',
  `PU_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '仕入日',
  `SUP_CODE` varchar(8) NOT NULL COMMENT '仕入先コード',
  `SUP_SUB_NO` int(2) DEFAULT NULL COMMENT '仕入先枝番',
  `EMP_CODE` varchar(10) NOT NULL COMMENT '仕入担当者コード',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '部門コード',
  `PO_NO` varchar(10) DEFAULT NULL COMMENT '発注番号',
  `PU_AMMOUNT` int(10) DEFAULT NULL COMMENT '仕入金額合計',
  `CMP_TAX` int(10) NOT NULL DEFAULT '0' COMMENT '消費税金額',
  `SLIP_COMMENT` varchar(1000) DEFAULT NULL COMMENT '備考',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  `START_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '開始日',
  PRIMARY KEY (`PU_NO`),
  KEY `EMP_CODE` (`EMP_CODE`),
  KEY `DEPT_CODE` (`DEPT_CODE`,`START_DATE`),
  CONSTRAINT `PURCHASE_ibfk_1` FOREIGN KEY (`EMP_CODE`) REFERENCES `EMPLOYEE` (`EMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PURCHASE_ibfk_2` FOREIGN KEY (`DEPT_CODE`, `START_DATE`) REFERENCES `DEPT_MST` (`DEPT_CODE`, `START_DATE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仕入データ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PURCHASE_ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PURCHASE_ORDERS` (
  `PO_NO` varchar(10) NOT NULL COMMENT '発注番号',
  `PO_DATE` datetime DEFAULT NULL COMMENT '発注日',
  `ORDER_NO` varchar(10) NOT NULL COMMENT '受注番号',
  `SUP_CODE` varchar(8) NOT NULL COMMENT '仕入先コード',
  `SUP_SUB_NO` int(2) DEFAULT NULL COMMENT '仕入先枝番',
  `EMP_CODE` varchar(10) NOT NULL COMMENT '発注担当者コード',
  `DUE_DATE` datetime DEFAULT NULL COMMENT '指定納期',
  `WH_CODE` varchar(3) NOT NULL COMMENT '倉庫コード',
  `PO_AMNT` int(10) DEFAULT NULL COMMENT '発注金額合計',
  `CMP_TAX` int(10) NOT NULL DEFAULT '0' COMMENT '消費税金額',
  `SLIP_COMMENT` varchar(1000) DEFAULT NULL COMMENT '備考',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`PO_NO`),
  KEY `EMP_CODE` (`EMP_CODE`),
  CONSTRAINT `PURCHASE_ORDERS_ibfk_1` FOREIGN KEY (`EMP_CODE`) REFERENCES `EMPLOYEE` (`EMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='発注データ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PU_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PU_DETAILS` (
  `PU_NO` varchar(10) NOT NULL COMMENT '仕入番号',
  `PU_ROW_NO` int(3) NOT NULL COMMENT '仕入行番号',
  `PU_ROW_DSP_NO` int(3) NOT NULL COMMENT '仕入行表示番号',
  `PO_ROW_NO` int(3) NOT NULL COMMENT '発注行番号',
  `PROD_CODE` varchar(16) NOT NULL COMMENT '商品コード',
  `WH_CODE` varchar(3) NOT NULL COMMENT '倉庫コード',
  `PROD_NAME` varchar(10) NOT NULL COMMENT '商品名',
  `PO_PRICE` int(8) DEFAULT '0' COMMENT '仕入単価',
  `PU_QUANTITY` int(4) NOT NULL DEFAULT '1' COMMENT '仕入数量',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`PU_NO`,`PU_ROW_NO`),
  KEY `PROD_CODE` (`PROD_CODE`),
  KEY `WH_CODE` (`WH_CODE`),
  CONSTRAINT `PU_DETAILS_ibfk_1` FOREIGN KEY (`PU_NO`) REFERENCES `PURCHASE` (`PU_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PU_DETAILS_ibfk_2` FOREIGN KEY (`PROD_CODE`) REFERENCES `PRODUCTS` (`PROD_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PU_DETAILS_ibfk_3` FOREIGN KEY (`WH_CODE`) REFERENCES `WH_MST` (`WH_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仕入データ明細';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `SALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALES` (
  `SALES_NO` varchar(10) NOT NULL COMMENT '売上番号',
  `ORDER_NO` varchar(10) NOT NULL COMMENT '受注番号',
  `SALES_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '売上日',
  `SALES_TYPE` int(1) DEFAULT '1' COMMENT '売上区分',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '部門コード',
  `COMP_CODE` varchar(8) NOT NULL COMMENT '取引先コード',
  `EMP_CODE` varchar(10) NOT NULL COMMENT '社員コード',
  `SALES_AMNT` int(13) NOT NULL DEFAULT '0' COMMENT '売上金額合計',
  `CMP_TAX` int(10) NOT NULL DEFAULT '0' COMMENT '消費税合計',
  `SLIP_COMMENT` varchar(1000) DEFAULT NULL COMMENT '備考',
  `UPDATED_NO` int(10) DEFAULT NULL COMMENT '赤黒伝票番号',
  `ORGNL_NO` varchar(10) DEFAULT NULL COMMENT '元伝票番号',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`SALES_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='売上データ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `SALES_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALES_DETAILS` (
  `SALES_NO` varchar(10) NOT NULL COMMENT '売上番号',
  `ROW_NO` int(3) NOT NULL COMMENT '売上行番号',
  `PROD_CODE` varchar(16) NOT NULL COMMENT '商品コード',
  `PROD_NAME` varchar(10) NOT NULL COMMENT '商品名',
  `UNITPRICE` int(8) NOT NULL DEFAULT '0' COMMENT '販売単価',
  `DELIVERED_QTY` int(4) DEFAULT '0' COMMENT '出荷数量',
  `QUANTITY` int(4) NOT NULL DEFAULT '1' COMMENT '売上数量',
  `DISCOUNT` int(4) NOT NULL DEFAULT '0' COMMENT '値引金額',
  `INVOICED_DATE` datetime DEFAULT NULL COMMENT '請求日',
  `INVOICE_NO` varchar(10) DEFAULT NULL COMMENT '請求番号',
  `INVOICE_DELAY_TYPE` int(1) DEFAULT NULL COMMENT '請求遅延区分',
  `AUTO_JOURNAL_DATE` datetime DEFAULT NULL COMMENT '自動仕訳処理日',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`SALES_NO`,`ROW_NO`),
  CONSTRAINT `SALES_DETAILS_ibfk_1` FOREIGN KEY (`SALES_NO`) REFERENCES `SALES` (`SALES_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='売上データ明細';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `STOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCK` (
  `WH_CODE` varchar(3) NOT NULL COMMENT '倉庫コード',
  `PROD_CODE` varchar(16) NOT NULL COMMENT '商品コード',
  `ROT_NO` varchar(20) NOT NULL COMMENT 'ロット番号',
  `STOCK_TYPE` varchar(1) NOT NULL DEFAULT '1' COMMENT '在庫区分',
  `QUALITY_TYPE` varchar(1) NOT NULL DEFAULT 'G' COMMENT '良品区分',
  `ACTUAL` int(4) NOT NULL DEFAULT '1' COMMENT '実在庫数',
  `VALID` int(4) NOT NULL DEFAULT '1' COMMENT '有効在庫数',
  `LAST_DELIVERY_DATE` datetime DEFAULT NULL COMMENT '最終出荷日',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`WH_CODE`,`PROD_CODE`,`ROT_NO`,`STOCK_TYPE`,`QUALITY_TYPE`),
  CONSTRAINT `STOCK_ibfk_1` FOREIGN KEY (`WH_CODE`) REFERENCES `WH_MST` (`WH_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在庫データ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `SUPPLIER_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUPPLIER_MST` (
  `SUP_CODE` varchar(8) NOT NULL COMMENT '仕入先コード',
  `SUP_SUB_NO` int(2) NOT NULL COMMENT '仕入先枝番',
  `SUP_NAME` varchar(40) NOT NULL COMMENT '仕入先名',
  `SUP_KANA` varchar(40) DEFAULT NULL COMMENT '仕入先名カナ',
  `SUP_EMP_NAME` varchar(20) DEFAULT NULL COMMENT '仕入先担当者名',
  `SUP_DEP_NAME` varchar(40) DEFAULT NULL COMMENT '仕入先部門名',
  `SUP_ZIP_CODE` char(8) DEFAULT NULL COMMENT '仕入先郵便番号',
  `SUP_STATE` varchar(4) DEFAULT NULL COMMENT '仕入先都道府県',
  `SUP_ADDRESS1` varchar(40) DEFAULT NULL COMMENT '仕入先住所１',
  `SUP_ADDRESS2` varchar(40) DEFAULT NULL COMMENT '仕入先住所２',
  `SUP_TEL` varchar(13) DEFAULT NULL COMMENT '仕入先電話番号',
  `SUP_FAX` varchar(13) DEFAULT NULL COMMENT '仕入先FAX番号',
  `SUP_EMAIL` varchar(100) DEFAULT NULL COMMENT '仕入先メールアドレス',
  `SUP_CLOSE_DATE` int(2) NOT NULL COMMENT '仕入先締日',
  `SUP_PAY_MONTHS` int(1) DEFAULT '1' COMMENT '仕入先支払月',
  `SUP_PAY_DATES` int(1) DEFAULT NULL COMMENT '仕入先支払日',
  `PAY_METHOD_TYPE` int(1) DEFAULT '1' COMMENT '支払方法区分',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`SUP_CODE`,`SUP_SUB_NO`),
  CONSTRAINT `SUPPLIER_MST_ibfk_1` FOREIGN KEY (`SUP_CODE`) REFERENCES `COMPANYS_MST` (`COMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仕入先マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `WH_DEPT_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WH_DEPT_MST` (
  `WH_CODE` varchar(3) NOT NULL COMMENT '倉庫コード',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '部門コード',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  `START_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '開始日',
  PRIMARY KEY (`WH_CODE`,`DEPT_CODE`,`START_DATE`),
  KEY `DEPT_CODE` (`DEPT_CODE`,`START_DATE`),
  CONSTRAINT `WH_DEPT_MST_ibfk_1` FOREIGN KEY (`WH_CODE`) REFERENCES `WH_MST` (`WH_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `WH_DEPT_MST_ibfk_2` FOREIGN KEY (`DEPT_CODE`, `START_DATE`) REFERENCES `DEPT_MST` (`DEPT_CODE`, `START_DATE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='倉庫部門マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `WH_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WH_MST` (
  `WH_CODE` varchar(3) NOT NULL COMMENT '倉庫コード',
  `WH_NAME` varchar(20) DEFAULT NULL COMMENT '倉庫名',
  `WH_TYPE` varchar(1) DEFAULT 'N' COMMENT '倉庫区分',
  `ZIP_CODE` char(8) DEFAULT NULL COMMENT '郵便番号',
  `STATE` varchar(4) DEFAULT NULL COMMENT '都道府県',
  `ADDRESS1` varchar(40) DEFAULT NULL COMMENT '住所１',
  `ADDRESS2` varchar(40) DEFAULT NULL COMMENT '住所２',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新日時',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '更新者名',
  PRIMARY KEY (`WH_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='倉庫マスタ';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
