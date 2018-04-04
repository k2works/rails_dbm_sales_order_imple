
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
  `PROD_CODE` varchar(16) NOT NULL COMMENT '���i�R�[�h',
  `ALT_PROD_CODE` varchar(16) NOT NULL COMMENT '��֏��i�R�[�h',
  `PRIORITY` int(2) DEFAULT '1' COMMENT '�D�揇��',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`PROD_CODE`,`ALT_PROD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='��֏��i';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `APPROVAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `APPROVAL` (
  `APPROVAL_CODE` varchar(2) NOT NULL COMMENT '���F�����R�[�h',
  `APPROVAL_NAME` varchar(40) DEFAULT NULL COMMENT '���F������',
  PRIMARY KEY (`APPROVAL_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�d�q���F�}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `AUTO_NUMBER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AUTO_NUMBER` (
  `SLIP_TYPE` varchar(2) NOT NULL COMMENT '�`�[��ʃR�[�h',
  `YEARMONTH` datetime NOT NULL COMMENT '�N��',
  `LAST_SILP_NO` int(4) NOT NULL DEFAULT '0' COMMENT '�ŏI�`�[�ԍ�',
  PRIMARY KEY (`SLIP_TYPE`,`YEARMONTH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����̔ԃ}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `BANK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BANK` (
  `BANK_ACUT_CODE` varchar(8) NOT NULL COMMENT '���������R�[�h',
  `RECIVE_ACT_NAME` varchar(30) DEFAULT NULL COMMENT '����������',
  `APPL_START_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�K�p�J�n��',
  `APPL_END_DATE` datetime DEFAULT '2100-12-31 00:00:00' COMMENT '�K�p�I����',
  `START_ACT_NAME` varchar(30) DEFAULT NULL COMMENT '�K�p�J�n�����������',
  `RECIVE_BANK_ACT_TYPE` varchar(1) DEFAULT NULL COMMENT '���������敪',
  `RECIVE_ACT_NO` varchar(12) DEFAULT NULL COMMENT '���������ԍ�',
  `BANK_ACT_TYPE` varchar(1) DEFAULT NULL COMMENT '��s�������',
  `ACT_NAME` varchar(20) DEFAULT NULL COMMENT '�������`�l',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '����R�[�h',
  `START_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�J�n��',
  `A_BANK_CODE` varchar(4) DEFAULT NULL COMMENT '�S�⋦��s�R�[�h',
  `A_BANK_BLNC_CODE` varchar(3) DEFAULT NULL COMMENT '�S�⋦�x�X�R�[�h',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  `UPDATE_PLG_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�v���O�����X�V����',
  `UPDATE_PGM` varchar(50) DEFAULT NULL COMMENT '�X�V�v���O������',
  PRIMARY KEY (`BANK_ACUT_CODE`),
  KEY `DEPT_CODE` (`DEPT_CODE`,`START_DATE`),
  CONSTRAINT `BANK_ibfk_1` FOREIGN KEY (`DEPT_CODE`, `START_DATE`) REFERENCES `DEPT_MST` (`DEPT_CODE`, `START_DATE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���������}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `BOM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BOM` (
  `PROD_CODE` varchar(16) NOT NULL COMMENT '���i�R�[�h',
  `BOM_CODE` varchar(16) NOT NULL COMMENT '���i�R�[�h',
  `QUANTITY` int(4) NOT NULL DEFAULT '1' COMMENT '���i����',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`PROD_CODE`,`BOM_CODE`),
  CONSTRAINT `BOM_ibfk_1` FOREIGN KEY (`PROD_CODE`) REFERENCES `PRODUCTS` (`PROD_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���i�\';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CATEGORY_TYPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CATEGORY_TYPE` (
  `CATEGORY_TYPE_CODE` varchar(2) NOT NULL COMMENT '����敪�ގ�ʃR�[�h',
  `CATE_TYPE_NAME` varchar(20) DEFAULT NULL COMMENT '����敪�ގ�ʖ�',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`CATEGORY_TYPE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����敪�ގ�ʃ}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `COMPANYS_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPANYS_MST` (
  `COMP_CODE` varchar(8) NOT NULL COMMENT '�����R�[�h',
  `COMP_NAME` varchar(40) NOT NULL COMMENT '����於',
  `COMP_KANA` varchar(40) DEFAULT NULL COMMENT '����於�J�i',
  `SUP_TYPE` int(1) DEFAULT '0' COMMENT '�d����敪',
  `ZIP_CODE` char(8) DEFAULT NULL COMMENT '�X�֔ԍ�',
  `STATE` varchar(4) DEFAULT NULL COMMENT '�s���{��',
  `ADDRESS1` varchar(40) DEFAULT NULL COMMENT '�Z���P',
  `ADDRESS2` varchar(40) DEFAULT NULL COMMENT '�Z���Q',
  `NO_SALES_FLG` int(1) DEFAULT '0' COMMENT '����֎~�t���O',
  `WIDE_USE_TYPE` int(1) DEFAULT NULL COMMENT '�G�敪',
  `COMP_GROUP_CODE` varchar(4) NOT NULL COMMENT '�����O���[�v�R�[�h',
  `MAX_CREDIT` int(10) DEFAULT NULL COMMENT '�^�M���x�z',
  `TEMP_CREDIT_UP` int(10) DEFAULT '0' COMMENT '�^�M�ꎞ�����g',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`COMP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `COMPANY_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPANY_CATEGORY` (
  `CATEGORY_TYPE` varchar(2) NOT NULL COMMENT '����敪�ގ�ʃR�[�h',
  `COMP_CATE_CODE` varchar(8) NOT NULL COMMENT '����敪�ރR�[�h',
  `COMP_CATE_NAME` varchar(30) DEFAULT NULL COMMENT '����敪�ޖ�',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`COMP_CATE_CODE`,`CATEGORY_TYPE`),
  KEY `CATEGORY_TYPE` (`CATEGORY_TYPE`),
  CONSTRAINT `COMPANY_CATEGORY_ibfk_1` FOREIGN KEY (`CATEGORY_TYPE`) REFERENCES `CATEGORY_TYPE` (`CATEGORY_TYPE_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����敪�ރ}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `COMPANY_CATEGORY_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPANY_CATEGORY_GROUP` (
  `CATEGORY_TYPE` varchar(2) NOT NULL COMMENT '����敪�ގ�ʃR�[�h',
  `COMP_CATE_CODE` varchar(8) NOT NULL COMMENT '����敪�ރR�[�h',
  `COMP_CODE` varchar(8) NOT NULL COMMENT '�����R�[�h',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`CATEGORY_TYPE`,`COMP_CODE`,`COMP_CATE_CODE`),
  KEY `COMP_CATE_CODE` (`COMP_CATE_CODE`,`CATEGORY_TYPE`),
  CONSTRAINT `COMPANY_CATEGORY_GROUP_ibfk_1` FOREIGN KEY (`COMP_CATE_CODE`, `CATEGORY_TYPE`) REFERENCES `COMPANY_CATEGORY` (`COMP_CATE_CODE`, `CATEGORY_TYPE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����敪�ޏ����}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `COMPANY_GROUP_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPANY_GROUP_MST` (
  `COMP_GROUP_CODE` varchar(4) NOT NULL COMMENT '�����O���[�v�R�[�h',
  `GROUP_NAME` varchar(40) DEFAULT NULL COMMENT '�����O���[�v��',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`COMP_GROUP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����O���[�v�}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CREDIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDIT` (
  `CREDIT_NO` varchar(10) NOT NULL COMMENT '�����ԍ�',
  `CREDIT_DATE` datetime DEFAULT NULL COMMENT '������',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '����R�[�h',
  `START_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�J�n��',
  `COMP_CODE` varchar(8) NOT NULL COMMENT '�ڋq�R�[�h',
  `COMP_SUB_NO` int(2) DEFAULT NULL COMMENT '�ڋq�}��',
  `PAY_METHOD_TYPE` int(1) DEFAULT '1' COMMENT '�x�����@�敪',
  `BANK_ACUT_CODE` varchar(8) DEFAULT NULL COMMENT '���������R�[�h',
  `RECEIVED_AMNT` int(13) DEFAULT '0' COMMENT '�������z',
  `RECEIVED` int(13) DEFAULT '0' COMMENT '�������z',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  `UPDATE_PLG_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�v���O�����X�V����',
  `UPDATE_PGM` varchar(50) DEFAULT NULL COMMENT '�X�V�v���O������',
  PRIMARY KEY (`CREDIT_NO`),
  KEY `DEPT_CODE` (`DEPT_CODE`,`START_DATE`),
  CONSTRAINT `CREDIT_ibfk_1` FOREIGN KEY (`DEPT_CODE`, `START_DATE`) REFERENCES `DEPT_MST` (`DEPT_CODE`, `START_DATE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����f�[�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CREDIT_BALANCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CREDIT_BALANCE` (
  `COMP_CODE` varchar(8) NOT NULL COMMENT '�����R�[�h',
  `ORDER_BALANCE` int(13) DEFAULT '0' COMMENT '�󒍎c��',
  `REC_BALANCE` int(13) DEFAULT '0' COMMENT '���c��',
  `PAY_BALANCE` int(13) DEFAULT '0' COMMENT '���c��',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`COMP_CODE`),
  CONSTRAINT `CREDIT_BALANCE_ibfk_1` FOREIGN KEY (`COMP_CODE`) REFERENCES `COMPANYS_MST` (`COMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�^�M�c���f�[�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `CUSTOMERS_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CUSTOMERS_MST` (
  `CUST_CODE` varchar(8) NOT NULL COMMENT '�ڋq�R�[�h',
  `CUST_SUB_NO` int(2) NOT NULL COMMENT '�ڋq�}��',
  `CUST_TYPE` int(1) DEFAULT '0' COMMENT '�ڋq�敪',
  `AR_CODE` varchar(8) NOT NULL COMMENT '������R�[�h',
  `AR_SUB_NO` int(2) DEFAULT NULL COMMENT '������}��',
  `PAYER_CODE` varchar(8) NOT NULL COMMENT '�����R�[�h',
  `PAYER_SUB_NO` int(2) DEFAULT NULL COMMENT '�����}��',
  `CUST_NAME` varchar(40) NOT NULL COMMENT '�ڋq��',
  `CUST_KANA` varchar(40) DEFAULT NULL COMMENT '�ڋq���J�i',
  `EMP_CODE` varchar(10) NOT NULL COMMENT '���ВS���҃R�[�h',
  `CUST_USER_NAME` varchar(20) DEFAULT NULL COMMENT '�ڋq�S���Җ�',
  `CUST_USER_DEP_NAME` varchar(40) DEFAULT NULL COMMENT '�ڋq���喼',
  `CUST_ZIP_CODE` char(8) DEFAULT NULL COMMENT '�ڋq�X�֔ԍ�',
  `CUST_STATE` varchar(4) DEFAULT NULL COMMENT '�ڋq�s���{��',
  `CUST_ADDRESS1` varchar(40) DEFAULT NULL COMMENT '�ڋq�Z���P',
  `CUST_ADDRESS2` varchar(40) DEFAULT NULL COMMENT '�ڋq�Z���Q',
  `CUST_TEL` varchar(13) DEFAULT NULL COMMENT '�ڋq�d�b�ԍ�',
  `CUST_FAX` varchar(13) DEFAULT NULL COMMENT '�ڋqFAX�ԍ�',
  `CUST_EMAIL` varchar(100) DEFAULT NULL COMMENT '�ڋq���[���A�h���X',
  `CUST_AR_FLAG` int(1) DEFAULT NULL COMMENT '�ڋq�����敪',
  `CUST_CLOSE_DATE1` int(2) NOT NULL COMMENT '�ڋq�����P',
  `CUST_PAY_MONTHS1` int(1) DEFAULT '1' COMMENT '�ڋq�x�����P',
  `CUST_PAY_DATES1` int(1) DEFAULT NULL COMMENT '�ڋq�x�����P',
  `CUST_PAY_METHOD1` int(1) DEFAULT '1' COMMENT '�ڋq�x�����@�P',
  `CUST_CLOSE_DATE2` int(2) NOT NULL COMMENT '�ڋq�����Q',
  `CUST_PAY_MONTHS2` int(1) DEFAULT '1' COMMENT '�ڋq�x�����Q',
  `CUST_PAY_DATES2` int(1) DEFAULT NULL COMMENT '�ڋq�x�����Q',
  `CUST_PAY_METHOD2` int(1) DEFAULT '1' COMMENT '�ڋq�x�����@�Q',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`CUST_CODE`,`CUST_SUB_NO`),
  CONSTRAINT `CUSTOMERS_MST_ibfk_1` FOREIGN KEY (`CUST_CODE`) REFERENCES `COMPANYS_MST` (`COMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ڋq�}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `DEPT_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPT_MST` (
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '����R�[�h',
  `START_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�J�n��',
  `END_DATE` datetime DEFAULT '2100-12-31 00:00:00' COMMENT '�I����',
  `DEP_NAME` varchar(40) DEFAULT NULL COMMENT '���喼',
  `LAYER` int(2) NOT NULL DEFAULT '0' COMMENT '�g�D�K�w',
  `UP_DIVISION_CODE` varchar(5) NOT NULL COMMENT '��ʕ���R�[�h',
  `SLIT_YN` int(1) DEFAULT '1' COMMENT '�`�[���͉�',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`DEPT_CODE`,`START_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `DESTINATIONS_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DESTINATIONS_MST` (
  `COMP_CODE` varchar(8) NOT NULL COMMENT '�����R�[�h',
  `COMP_SUB_NO` int(2) NOT NULL COMMENT '�ڋq�}��',
  `DIST_NO` int(2) NOT NULL COMMENT '�o�א�ԍ�',
  `DIST_NAME` varchar(40) NOT NULL COMMENT '�o�א於',
  `ZIP_CODE` char(8) DEFAULT NULL COMMENT '�o�א�X�֔ԍ�',
  `ADDRESS1` varchar(40) DEFAULT NULL COMMENT '�o�א�Z���P',
  `ADDRESS2` varchar(40) DEFAULT NULL COMMENT '�o�א�Z���Q',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`COMP_CODE`,`DIST_NO`,`COMP_SUB_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�o�א�}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEE` (
  `EMP_CODE` varchar(10) NOT NULL COMMENT '�Ј��R�[�h',
  `EMP_NAME` varchar(20) DEFAULT NULL COMMENT '�Ј���',
  `EMP_KANA` varchar(40) DEFAULT NULL COMMENT '�Ј����J�i',
  `PASSWORD` varchar(8) DEFAULT NULL COMMENT '�p�X���[�h',
  `TEL` varchar(13) DEFAULT NULL COMMENT '�d�b�ԍ�',
  `FAX` varchar(13) DEFAULT NULL COMMENT 'FAX�ԍ�',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '����R�[�h',
  `START_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�J�n��',
  `OCCU_CODE` varchar(2) NOT NULL COMMENT '�E��R�[�h',
  `APPROVAL_CODE` varchar(2) NOT NULL COMMENT '���F�����R�[�h',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`EMP_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�Ј��}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `INVOICE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVOICE` (
  `INVOICE_NO` varchar(10) NOT NULL COMMENT '�����ԍ�',
  `INVOICED_DATE` datetime DEFAULT NULL COMMENT '������',
  `COMP_CODE` varchar(8) NOT NULL COMMENT '�����R�[�h',
  `CUST_SUB_NO` int(2) DEFAULT NULL COMMENT '�ڋq�}��',
  `LAST_RECEIVED` int(13) DEFAULT NULL COMMENT '�O������z',
  `MONTH_SALES` int(13) DEFAULT NULL COMMENT '��������z',
  `MONTH_RECEIVED` int(13) DEFAULT NULL COMMENT '���������z',
  `MONTH_INVOICE` int(13) DEFAULT NULL COMMENT '���������z',
  `CMP_TAX` int(10) NOT NULL DEFAULT '0' COMMENT '����ŋ��z',
  `INVOICE_RECEIVED` int(13) DEFAULT '0' COMMENT '�����������z',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`INVOICE_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����f�[�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `INVOICE_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `INVOICE_DETAILS` (
  `INVOICE_NO` varchar(10) NOT NULL COMMENT '�����ԍ�',
  `SALES_NO` varchar(10) NOT NULL COMMENT '����ԍ�',
  `ROW_NO` int(3) NOT NULL COMMENT '����s�ԍ�',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`INVOICE_NO`,`SALES_NO`,`ROW_NO`),
  CONSTRAINT `INVOICE_DETAILS_ibfk_1` FOREIGN KEY (`INVOICE_NO`) REFERENCES `INVOICE` (`INVOICE_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����f�[�^����';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `LOCATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LOCATION` (
  `WH_CODE` varchar(3) NOT NULL COMMENT '�q�ɃR�[�h',
  `LOCATION_CODE` varchar(4) NOT NULL COMMENT '�I�ԃR�[�h',
  `PROD_CODE` varchar(16) NOT NULL COMMENT '���i�R�[�h',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`WH_CODE`,`LOCATION_CODE`,`PROD_CODE`),
  KEY `PROD_CODE` (`PROD_CODE`),
  CONSTRAINT `LOCATION_ibfk_1` FOREIGN KEY (`WH_CODE`) REFERENCES `WH_MST` (`WH_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `LOCATION_ibfk_2` FOREIGN KEY (`PROD_CODE`) REFERENCES `PRODUCTS` (`PROD_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�I�ԃ}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `OCCUPATION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OCCUPATION` (
  `OCCU_CODE` varchar(2) NOT NULL COMMENT '�E��R�[�h',
  `OCCU_NAME` varchar(20) NOT NULL COMMENT '�E�햼',
  PRIMARY KEY (`OCCU_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�E��敪';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDERS` (
  `ORDER_NO` varchar(10) NOT NULL COMMENT '�󒍔ԍ�',
  `ORDER_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�󒍓�',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '����R�[�h',
  `CUST_CODE` varchar(8) NOT NULL COMMENT '�ڋq�R�[�h',
  `CUST_SUB_NO` int(2) DEFAULT NULL COMMENT '�ڋq�}��',
  `EMP_CODE` varchar(10) NOT NULL COMMENT '�Ј��R�[�h',
  `REQUIRED_DATE` datetime DEFAULT NULL COMMENT '��]�[��',
  `CUSTORDER_NO` varchar(20) DEFAULT NULL COMMENT '�q�撍���ԍ�',
  `WH_CODE` varchar(3) NOT NULL COMMENT '�q�ɃR�[�h',
  `ORDER_AMNT` int(10) NOT NULL DEFAULT '0' COMMENT '�󒍋��z���v',
  `CMP_TAX` int(10) NOT NULL DEFAULT '0' COMMENT '����ŋ��z',
  `SLIP_COMMENT` varchar(1000) DEFAULT NULL COMMENT '���l',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`ORDER_NO`),
  KEY `EMP_CODE` (`EMP_CODE`),
  KEY `CUST_CODE` (`CUST_CODE`,`CUST_SUB_NO`),
  KEY `WH_CODE` (`WH_CODE`),
  CONSTRAINT `ORDERS_ibfk_1` FOREIGN KEY (`EMP_CODE`) REFERENCES `EMPLOYEE` (`EMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ORDERS_ibfk_2` FOREIGN KEY (`CUST_CODE`, `CUST_SUB_NO`) REFERENCES `CUSTOMERS_MST` (`CUST_CODE`, `CUST_SUB_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ORDERS_ibfk_3` FOREIGN KEY (`WH_CODE`) REFERENCES `WH_MST` (`WH_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�󒍃f�[�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `ORDER_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ORDER_DETAILS` (
  `ORDER_NO` varchar(10) NOT NULL COMMENT '�󒍔ԍ�',
  `SO_ROW_NO` int(3) NOT NULL COMMENT '�󒍍s�ԍ�',
  `PROD_CODE` varchar(16) NOT NULL COMMENT '���i�R�[�h',
  `PROD_NAME` varchar(10) NOT NULL COMMENT '���i��',
  `UNITPRICE` int(8) NOT NULL DEFAULT '0' COMMENT '�̔��P��',
  `QUANTITY` int(4) NOT NULL DEFAULT '1' COMMENT '�󒍐���',
  `CMP_TAX_RATE` int(3) DEFAULT NULL COMMENT '����ŗ�',
  `RESERVE_QTY` int(4) DEFAULT '0' COMMENT '��������',
  `DELIVERY_ORDER_QTY` int(4) DEFAULT '0' COMMENT '�o�׎w������',
  `DELIVERED_QTY` int(4) DEFAULT '0' COMMENT '�o�׍ϐ���',
  `COMPLETE_FLG` int(1) NOT NULL DEFAULT '0' COMMENT '�����t���O',
  `DISCOUNT` int(4) NOT NULL DEFAULT '0' COMMENT '�l�����z',
  `DELIVERY_DATE` datetime DEFAULT NULL COMMENT '�[��',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`ORDER_NO`,`SO_ROW_NO`),
  CONSTRAINT `ORDER_DETAILS_ibfk_1` FOREIGN KEY (`ORDER_NO`) REFERENCES `ORDERS` (`ORDER_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�󒍃f�[�^����';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PAY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PAY` (
  `PAY_NO` varchar(10) NOT NULL COMMENT '�x���ԍ�',
  `PAY_DATE` int(1) DEFAULT NULL COMMENT '�x����',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '����R�[�h',
  `SUP_CODE` varchar(8) NOT NULL COMMENT '�d����R�[�h',
  `SUP_SUB_NO` int(2) DEFAULT NULL COMMENT '�d����}��',
  `PAY_METHOD_TYPE` int(1) DEFAULT '1' COMMENT '�x�����@�敪',
  `PAY_AMNT` int(13) DEFAULT NULL COMMENT '�x�����z',
  `CMP_TAX` int(10) NOT NULL DEFAULT '0' COMMENT '����ŋ��z',
  `COMPLETE_FLG` int(1) NOT NULL DEFAULT '0' COMMENT '�x�������t���O',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  `START_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�J�n��',
  PRIMARY KEY (`PAY_NO`),
  KEY `SUP_CODE` (`SUP_CODE`,`SUP_SUB_NO`),
  KEY `DEPT_CODE` (`DEPT_CODE`,`START_DATE`),
  CONSTRAINT `PAY_ibfk_1` FOREIGN KEY (`SUP_CODE`, `SUP_SUB_NO`) REFERENCES `SUPPLIER_MST` (`SUP_CODE`, `SUP_SUB_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PAY_ibfk_2` FOREIGN KEY (`DEPT_CODE`, `START_DATE`) REFERENCES `DEPT_MST` (`DEPT_CODE`, `START_DATE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�x���f�[�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PO_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PO_DETAILS` (
  `PO_NO` varchar(10) NOT NULL COMMENT '�����ԍ�',
  `PO_ROW_NO` int(3) NOT NULL COMMENT '�����s�ԍ�',
  `PO_ROW_DSP_NO` int(3) NOT NULL COMMENT '�����s�\���ԍ�',
  `ORDER_NO` varchar(10) NOT NULL COMMENT '�󒍔ԍ�',
  `SO_ROW_NO` int(3) NOT NULL COMMENT '�󒍍s�ԍ�',
  `PROD_CODE` varchar(16) NOT NULL COMMENT '���i�R�[�h',
  `PROD_NAME` varchar(10) NOT NULL COMMENT '���i��',
  `PO_PRICE` int(8) DEFAULT '0' COMMENT '�d���P��',
  `PO_QT` int(4) NOT NULL DEFAULT '1' COMMENT '��������',
  `RECIVED_QT` int(4) NOT NULL DEFAULT '1' COMMENT '���׍ϐ���',
  `COMPLETE_FLG` int(1) NOT NULL DEFAULT '0' COMMENT '�����t���O',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`PO_NO`,`PO_ROW_NO`),
  CONSTRAINT `PO_DETAILS_ibfk_1` FOREIGN KEY (`PO_NO`) REFERENCES `PURCHASE_ORDERS` (`PO_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����f�[�^����';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PRICEBYCUSTOMER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRICEBYCUSTOMER` (
  `PROD_CODE` varchar(16) NOT NULL COMMENT '���i�R�[�h',
  `COMP_CODE` varchar(8) NOT NULL COMMENT '�����R�[�h',
  `UNITPRICE` int(8) NOT NULL DEFAULT '0' COMMENT '�̔��P��',
  PRIMARY KEY (`PROD_CODE`,`COMP_CODE`),
  KEY `COMP_CODE` (`COMP_CODE`),
  CONSTRAINT `PRICEBYCUSTOMER_ibfk_1` FOREIGN KEY (`COMP_CODE`) REFERENCES `COMPANYS_MST` (`COMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�ڋq�ʔ̔��P��';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PRODUCTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCTS` (
  `PROD_CODE` varchar(16) NOT NULL COMMENT '���i�R�[�h',
  `PROD_FULLNAME` varchar(40) NOT NULL COMMENT '���i������',
  `PROD_NAME` varchar(10) NOT NULL COMMENT '���i��',
  `PROD_KANA` varchar(20) NOT NULL COMMENT '���i���J�i',
  `PROD_TYPE` varchar(1) DEFAULT NULL COMMENT '���i�敪',
  `SERIAL_NO` varchar(40) DEFAULT NULL COMMENT '���i�^��',
  `UNITPRICE` int(8) NOT NULL DEFAULT '0' COMMENT '�̔��P��',
  `PO_PRICE` int(8) DEFAULT '0' COMMENT '�d���P��',
  `COST` int(8) NOT NULL DEFAULT '0' COMMENT '���㌴��',
  `TAX_TYPE` int(1) NOT NULL DEFAULT '1' COMMENT '�ŋ敪',
  `CATEGORY_CODE` varchar(8) DEFAULT NULL COMMENT '���i���ރR�[�h',
  `WIDE_USE_TYPE` int(1) DEFAULT NULL COMMENT '�G�敪',
  `STOCK_MANAGE_TYPE` int(1) DEFAULT '1' COMMENT '�݌ɊǗ��Ώۋ敪',
  `STOCK_RESERVE_TYPE` int(1) DEFAULT NULL COMMENT '�݌Ɉ����敪',
  `SUP_CODE` varchar(8) NOT NULL COMMENT '�d����R�[�h',
  `SUP_SUB_NO` int(2) DEFAULT NULL COMMENT '�d����}��',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`PROD_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���i�}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PRODUCT_CATEGORY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PRODUCT_CATEGORY` (
  `CATEGORY_CODE` varchar(8) NOT NULL COMMENT '���i���ރR�[�h',
  `PROD_CATE_NAME` varchar(30) DEFAULT NULL COMMENT '���i���ޖ�',
  `LAYER` int(2) NOT NULL DEFAULT '0' COMMENT '�K�w',
  `UPPER_CATEGORY` varchar(8) DEFAULT NULL COMMENT '��ʏ��i���ރR�[�h',
  PRIMARY KEY (`CATEGORY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='���i���ރ}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PURCHASE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PURCHASE` (
  `PU_NO` varchar(10) NOT NULL COMMENT '�d���ԍ�',
  `PU_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�d����',
  `SUP_CODE` varchar(8) NOT NULL COMMENT '�d����R�[�h',
  `SUP_SUB_NO` int(2) DEFAULT NULL COMMENT '�d����}��',
  `EMP_CODE` varchar(10) NOT NULL COMMENT '�d���S���҃R�[�h',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '����R�[�h',
  `PO_NO` varchar(10) DEFAULT NULL COMMENT '�����ԍ�',
  `PU_AMMOUNT` int(10) DEFAULT NULL COMMENT '�d�����z���v',
  `CMP_TAX` int(10) NOT NULL DEFAULT '0' COMMENT '����ŋ��z',
  `SLIP_COMMENT` varchar(1000) DEFAULT NULL COMMENT '���l',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  `START_DATE` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '�J�n��',
  PRIMARY KEY (`PU_NO`),
  KEY `EMP_CODE` (`EMP_CODE`),
  KEY `DEPT_CODE` (`DEPT_CODE`,`START_DATE`),
  CONSTRAINT `PURCHASE_ibfk_1` FOREIGN KEY (`EMP_CODE`) REFERENCES `EMPLOYEE` (`EMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PURCHASE_ibfk_2` FOREIGN KEY (`DEPT_CODE`, `START_DATE`) REFERENCES `DEPT_MST` (`DEPT_CODE`, `START_DATE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�d���f�[�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PURCHASE_ORDERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PURCHASE_ORDERS` (
  `PO_NO` varchar(10) NOT NULL COMMENT '�����ԍ�',
  `PO_DATE` datetime DEFAULT NULL COMMENT '������',
  `ORDER_NO` varchar(10) NOT NULL COMMENT '�󒍔ԍ�',
  `SUP_CODE` varchar(8) NOT NULL COMMENT '�d����R�[�h',
  `SUP_SUB_NO` int(2) DEFAULT NULL COMMENT '�d����}��',
  `EMP_CODE` varchar(10) NOT NULL COMMENT '�����S���҃R�[�h',
  `DUE_DATE` datetime DEFAULT NULL COMMENT '�w��[��',
  `WH_CODE` varchar(3) NOT NULL COMMENT '�q�ɃR�[�h',
  `PO_AMNT` int(10) DEFAULT NULL COMMENT '�������z���v',
  `CMP_TAX` int(10) NOT NULL DEFAULT '0' COMMENT '����ŋ��z',
  `SLIP_COMMENT` varchar(1000) DEFAULT NULL COMMENT '���l',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`PO_NO`),
  KEY `EMP_CODE` (`EMP_CODE`),
  CONSTRAINT `PURCHASE_ORDERS_ibfk_1` FOREIGN KEY (`EMP_CODE`) REFERENCES `EMPLOYEE` (`EMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�����f�[�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `PU_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PU_DETAILS` (
  `PU_NO` varchar(10) NOT NULL COMMENT '�d���ԍ�',
  `PU_ROW_NO` int(3) NOT NULL COMMENT '�d���s�ԍ�',
  `PU_ROW_DSP_NO` int(3) NOT NULL COMMENT '�d���s�\���ԍ�',
  `PO_ROW_NO` int(3) NOT NULL COMMENT '�����s�ԍ�',
  `PROD_CODE` varchar(16) NOT NULL COMMENT '���i�R�[�h',
  `WH_CODE` varchar(3) NOT NULL COMMENT '�q�ɃR�[�h',
  `PROD_NAME` varchar(10) NOT NULL COMMENT '���i��',
  `PO_PRICE` int(8) DEFAULT '0' COMMENT '�d���P��',
  `PU_QUANTITY` int(4) NOT NULL DEFAULT '1' COMMENT '�d������',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`PU_NO`,`PU_ROW_NO`),
  KEY `PROD_CODE` (`PROD_CODE`),
  KEY `WH_CODE` (`WH_CODE`),
  CONSTRAINT `PU_DETAILS_ibfk_1` FOREIGN KEY (`PU_NO`) REFERENCES `PURCHASE` (`PU_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PU_DETAILS_ibfk_2` FOREIGN KEY (`PROD_CODE`) REFERENCES `PRODUCTS` (`PROD_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `PU_DETAILS_ibfk_3` FOREIGN KEY (`WH_CODE`) REFERENCES `WH_MST` (`WH_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�d���f�[�^����';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `SALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALES` (
  `SALES_NO` varchar(10) NOT NULL COMMENT '����ԍ�',
  `ORDER_NO` varchar(10) NOT NULL COMMENT '�󒍔ԍ�',
  `SALES_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�����',
  `SALES_TYPE` int(1) DEFAULT '1' COMMENT '����敪',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '����R�[�h',
  `COMP_CODE` varchar(8) NOT NULL COMMENT '�����R�[�h',
  `EMP_CODE` varchar(10) NOT NULL COMMENT '�Ј��R�[�h',
  `SALES_AMNT` int(13) NOT NULL DEFAULT '0' COMMENT '������z���v',
  `CMP_TAX` int(10) NOT NULL DEFAULT '0' COMMENT '����ō��v',
  `SLIP_COMMENT` varchar(1000) DEFAULT NULL COMMENT '���l',
  `UPDATED_NO` int(10) DEFAULT NULL COMMENT '�ԍ��`�[�ԍ�',
  `ORGNL_NO` varchar(10) DEFAULT NULL COMMENT '���`�[�ԍ�',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`SALES_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����f�[�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `SALES_DETAILS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SALES_DETAILS` (
  `SALES_NO` varchar(10) NOT NULL COMMENT '����ԍ�',
  `ROW_NO` int(3) NOT NULL COMMENT '����s�ԍ�',
  `PROD_CODE` varchar(16) NOT NULL COMMENT '���i�R�[�h',
  `PROD_NAME` varchar(10) NOT NULL COMMENT '���i��',
  `UNITPRICE` int(8) NOT NULL DEFAULT '0' COMMENT '�̔��P��',
  `DELIVERED_QTY` int(4) DEFAULT '0' COMMENT '�o�א���',
  `QUANTITY` int(4) NOT NULL DEFAULT '1' COMMENT '���㐔��',
  `DISCOUNT` int(4) NOT NULL DEFAULT '0' COMMENT '�l�����z',
  `INVOICED_DATE` datetime DEFAULT NULL COMMENT '������',
  `INVOICE_NO` varchar(10) DEFAULT NULL COMMENT '�����ԍ�',
  `INVOICE_DELAY_TYPE` int(1) DEFAULT NULL COMMENT '�����x���敪',
  `AUTO_JOURNAL_DATE` datetime DEFAULT NULL COMMENT '�����d�󏈗���',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`SALES_NO`,`ROW_NO`),
  CONSTRAINT `SALES_DETAILS_ibfk_1` FOREIGN KEY (`SALES_NO`) REFERENCES `SALES` (`SALES_NO`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='����f�[�^����';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `STOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STOCK` (
  `WH_CODE` varchar(3) NOT NULL COMMENT '�q�ɃR�[�h',
  `PROD_CODE` varchar(16) NOT NULL COMMENT '���i�R�[�h',
  `ROT_NO` varchar(20) NOT NULL COMMENT '���b�g�ԍ�',
  `STOCK_TYPE` varchar(1) NOT NULL DEFAULT '1' COMMENT '�݌ɋ敪',
  `QUALITY_TYPE` varchar(1) NOT NULL DEFAULT 'G' COMMENT '�Ǖi�敪',
  `ACTUAL` int(4) NOT NULL DEFAULT '1' COMMENT '���݌ɐ�',
  `VALID` int(4) NOT NULL DEFAULT '1' COMMENT '�L���݌ɐ�',
  `LAST_DELIVERY_DATE` datetime DEFAULT NULL COMMENT '�ŏI�o�ד�',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`WH_CODE`,`PROD_CODE`,`ROT_NO`,`STOCK_TYPE`,`QUALITY_TYPE`),
  CONSTRAINT `STOCK_ibfk_1` FOREIGN KEY (`WH_CODE`) REFERENCES `WH_MST` (`WH_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�݌Ƀf�[�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `SUPPLIER_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUPPLIER_MST` (
  `SUP_CODE` varchar(8) NOT NULL COMMENT '�d����R�[�h',
  `SUP_SUB_NO` int(2) NOT NULL COMMENT '�d����}��',
  `SUP_NAME` varchar(40) NOT NULL COMMENT '�d���於',
  `SUP_KANA` varchar(40) DEFAULT NULL COMMENT '�d���於�J�i',
  `SUP_EMP_NAME` varchar(20) DEFAULT NULL COMMENT '�d����S���Җ�',
  `SUP_DEP_NAME` varchar(40) DEFAULT NULL COMMENT '�d���敔�喼',
  `SUP_ZIP_CODE` char(8) DEFAULT NULL COMMENT '�d����X�֔ԍ�',
  `SUP_STATE` varchar(4) DEFAULT NULL COMMENT '�d����s���{��',
  `SUP_ADDRESS1` varchar(40) DEFAULT NULL COMMENT '�d����Z���P',
  `SUP_ADDRESS2` varchar(40) DEFAULT NULL COMMENT '�d����Z���Q',
  `SUP_TEL` varchar(13) DEFAULT NULL COMMENT '�d����d�b�ԍ�',
  `SUP_FAX` varchar(13) DEFAULT NULL COMMENT '�d����FAX�ԍ�',
  `SUP_EMAIL` varchar(100) DEFAULT NULL COMMENT '�d���惁�[���A�h���X',
  `SUP_CLOSE_DATE` int(2) NOT NULL COMMENT '�d�������',
  `SUP_PAY_MONTHS` int(1) DEFAULT '1' COMMENT '�d����x����',
  `SUP_PAY_DATES` int(1) DEFAULT NULL COMMENT '�d����x����',
  `PAY_METHOD_TYPE` int(1) DEFAULT '1' COMMENT '�x�����@�敪',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`SUP_CODE`,`SUP_SUB_NO`),
  CONSTRAINT `SUPPLIER_MST_ibfk_1` FOREIGN KEY (`SUP_CODE`) REFERENCES `COMPANYS_MST` (`COMP_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�d����}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `WH_DEPT_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WH_DEPT_MST` (
  `WH_CODE` varchar(3) NOT NULL COMMENT '�q�ɃR�[�h',
  `DEPT_CODE` varchar(5) NOT NULL COMMENT '����R�[�h',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  `START_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�J�n��',
  PRIMARY KEY (`WH_CODE`,`DEPT_CODE`,`START_DATE`),
  KEY `DEPT_CODE` (`DEPT_CODE`,`START_DATE`),
  CONSTRAINT `WH_DEPT_MST_ibfk_1` FOREIGN KEY (`WH_CODE`) REFERENCES `WH_MST` (`WH_CODE`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `WH_DEPT_MST_ibfk_2` FOREIGN KEY (`DEPT_CODE`, `START_DATE`) REFERENCES `DEPT_MST` (`DEPT_CODE`, `START_DATE`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�q�ɕ���}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
DROP TABLE IF EXISTS `WH_MST`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WH_MST` (
  `WH_CODE` varchar(3) NOT NULL COMMENT '�q�ɃR�[�h',
  `WH_NAME` varchar(20) DEFAULT NULL COMMENT '�q�ɖ�',
  `WH_TYPE` varchar(1) DEFAULT 'N' COMMENT '�q�ɋ敪',
  `ZIP_CODE` char(8) DEFAULT NULL COMMENT '�X�֔ԍ�',
  `STATE` varchar(4) DEFAULT NULL COMMENT '�s���{��',
  `ADDRESS1` varchar(40) DEFAULT NULL COMMENT '�Z���P',
  `ADDRESS2` varchar(40) DEFAULT NULL COMMENT '�Z���Q',
  `UPDATE_DATE` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '�X�V����',
  `UPDATER` varchar(12) DEFAULT NULL COMMENT '�X�V�Җ�',
  PRIMARY KEY (`WH_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='�q�Ƀ}�X�^';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

