/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.32 : Database - ywesc
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ywesc` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `ywesc`;

/*Table structure for table `yw_car` */

DROP TABLE IF EXISTS `yw_car`;

CREATE TABLE `yw_car` (
  `car_id` int NOT NULL AUTO_INCREMENT COMMENT '汽车id',
  `car_brand` varchar(32) NOT NULL COMMENT '汽车品牌',
  `car_series` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '汽车系列',
  `car_year` varchar(16) NOT NULL COMMENT '汽车年份',
  `car_pl` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '排量',
  `car_oil` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '燃油',
  `car_bsx` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '变速箱',
  `car_pf` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '排放',
  `car_sp_time` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '上牌时间',
  `car_km` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '公里数',
  `car_address` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '地址',
  `car_price` int NOT NULL COMMENT '售价',
  `car_old_price` int NOT NULL COMMENT '指导价',
  `car_insure_time` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '保险到期时间',
  `car_img` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '汽车正脸照片',
  `car_is_mb` int NOT NULL COMMENT '是否面包车',
  PRIMARY KEY (`car_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `yw_car` */

insert  into `yw_car`(`car_id`,`car_brand`,`car_series`,`car_year`,`car_pl`,`car_oil`,`car_bsx`,`car_pf`,`car_sp_time`,`car_km`,`car_address`,`car_price`,`car_old_price`,`car_insure_time`,`car_img`,`car_is_mb`) values (41,'别克','凯悦','2010','1.6L','汽油          ','自动','国Ⅴ','2020-06','90000','苏州          ',198,999,'          ','ywesc-img.webwss.cn/别克凯悦a9164d5f7f4d424982b64201e66c2102.jpg',0),(42,'奔驰','C200','2011','1.8T','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',399,2166,'','ywesc-img.webwss.cn/奔驰C200ee3c9913acd743b4842bf106aab736e3.jpg',0),(43,'别克','英朗GT','2012','1.6L','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',199,1259,'','ywesc-img.webwss.cn/别克英朗GT6b5972bebf984cb3a2b2b06d02ffd37a.jpg',0),(44,'大众','迈腾','2014','2.0T','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',9999,1479,'','ywesc-img.webwss.cn/大众迈腾702fda29c0754c96880b486165b64162.jpg',0),(45,'宝马','320Li','2015','2.0T','汽油','自动','国Ⅴ','2020-06','110000','苏州          ',999,2146,'','ywesc-img.webwss.cn/宝马320Li70cb8cf263aa4f26b94e92cb19671da3.jpg',0),(46,'长安','欧诺','2015','1.5L','汽油          ','手动','国Ⅴ','2020-06','60000          ','苏州          ',299,389,'          ','ywesc-img.webwss.cn/长安欧诺75c5a0bd3e9f455f89a0c6433c51f057.jpg',1),(48,'东风','风光330','2016','2.0T','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',199,419,'          ','ywesc-img.webwss.cn/东风风光3306284803e7fe94a90a3ed6edafaf7d485.jpg',1),(49,'五菱','荣光小卡','2017','2.0T','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',9999,396,'          ','ywesc-img.webwss.cn/五菱荣光小卡590feaa6ca5540aca43ad1c3239d5efd.jpg',1),(50,'比亚迪','唐（高配）','2015','2.0T','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',399,2076,'','ywesc-img.webwss.cn/比亚迪唐（高配）743099160c54471e9c45eb9a2f8afeef.jpg',0),(51,'马自达','6','2010','2.0L','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',199,1298,'','ywesc-img.webwss.cn/马自达642a46c8d54594e68b2d7fc237a4f3984.jpg',0),(52,'宝马','530Li','2012','2.0T','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',899,4599,'','ywesc-img.webwss.cn/宝马530Li3285e92e8f3740ff9dfddd7a55d28d58.jpg',0),(53,'别克','君威','2013','2.0L','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',299,1248,'','ywesc-img.webwss.cn/别克君威89c03c8a10c74366979a87127123cc3c.jpg',0),(54,'宝马','730Li','2013','2.0T','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',1099,6200,'','ywesc-img.webwss.cn/宝马730Li0acfb84641da46569de53a0241f3b9ce.jpg',0),(55,'丰田','锐志','2014','2.0T','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',799,2088,'','ywesc-img.webwss.cn/丰田锐志45b3229d10d6498c80166c32235b8ae1.jpg',0),(56,'柯斯达','明锐','2015','1.6T','汽油','自动','国Ⅴ','2020-06','90000','苏州',399,1439,'','ywesc-img.webwss.cn/柯斯达明锐0ae8db9d53af45dc945cee9bcea2823f.jpg',0),(57,'福特','全顺','2016','2.8T','柴油          ','自动','国Ⅴ','2020-06','90000','苏州          ',9999,1398,'          ','ywesc-img.webwss.cn/福特全顺0b76108d937d4ebab9eb30d08bb4d91e.jpg',1),(58,'福特','锐界','2018','2.0T','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',9999,2210,'','ywesc-img.webwss.cn/福特锐界5b70822f5eda426b8176b6bb97b5d7b2.jpg',0),(59,'上汽','大通V80','2018','2.5T','柴油          ','自动','国Ⅴ','2020-06','90000','苏州          ',9999,958,'          ','ywesc-img.webwss.cn/上汽大通V8065de7cffffcf45848da506a72be89c32.jpg',1),(61,'大众','途观','2016','2.0T','汽油','自动','国Ⅴ','2020-06','90000','苏州          ',799,1399,'','ywesc-img.webwss.cn/大众途观d402a06673eb4bd68cfc6d7be4c4e05a.jpg',0);

/*Table structure for table `yw_car_img` */

DROP TABLE IF EXISTS `yw_car_img`;

CREATE TABLE `yw_car_img` (
  `car_img_id` int NOT NULL AUTO_INCREMENT COMMENT '汽车图片id',
  `car_id` int NOT NULL COMMENT '汽车id',
  `car_img_path` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '汽车图片地址',
  PRIMARY KEY (`car_img_id`,`car_img_path`)
) ENGINE=InnoDB AUTO_INCREMENT=307 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `yw_car_img` */

insert  into `yw_car_img`(`car_img_id`,`car_id`,`car_img_path`) values (131,41,'ywesc-img.webwss.cn/别克凯悦83abb3b6b0ff4a729f21ba42335979fd.jpg'),(132,41,'ywesc-img.webwss.cn/别克凯悦38929294ff39476896b2a07268d4fb1e.jpg'),(133,41,'ywesc-img.webwss.cn/别克凯悦a2d95bde0a3b4046b60f97e2b64e0328.jpg'),(134,41,'ywesc-img.webwss.cn/别克凯悦f8e409dab7b94b8aab8af29e533d79df.jpg'),(135,41,'ywesc-img.webwss.cn/别克凯悦592e153564ee4b5dad791a786bedaa23.jpg'),(136,41,'ywesc-img.webwss.cn/别克凯悦8d6379b08e0a4d75a12b72b71913f16c.jpg'),(137,41,'ywesc-img.webwss.cn/别克凯悦cf1cbc4e134e4e3f9dfa6a0894c8b863.jpg'),(138,41,'ywesc-img.webwss.cn/别克凯悦8e63ecf716724bc9be426e52ff1e3b9c.jpg'),(139,42,'ywesc-img.webwss.cn/奔驰C20079f406e7a7134720a1f24f778314cf2c.jpg'),(140,42,'ywesc-img.webwss.cn/奔驰C200b746458ab4f448b795f00982d7df2320.jpg'),(141,42,'ywesc-img.webwss.cn/奔驰C20075e9eae591f640138974816404ad1f72.jpg'),(142,42,'ywesc-img.webwss.cn/奔驰C2005ad36b84713a45658d0cd1f88a7f6e42.jpg'),(143,42,'ywesc-img.webwss.cn/奔驰C200f6e42174e08b4aef8d50c99cff9a091e.jpg'),(144,42,'ywesc-img.webwss.cn/奔驰C200b841d4ba0332443792e1aaa024a39502.jpg'),(145,42,'ywesc-img.webwss.cn/奔驰C2008825d3e240f04b5cb366c40232afdb00.jpg'),(146,42,'ywesc-img.webwss.cn/奔驰C200fd6430aa78c04ff3ae127dbe0d538389.jpg'),(147,43,'ywesc-img.webwss.cn/别克英朗GTadd23da3280c4e7082c00c3f145ad61c.jpg'),(148,43,'ywesc-img.webwss.cn/别克英朗GT0097c49e60004f4c934aad36aeac172b.jpg'),(149,43,'ywesc-img.webwss.cn/别克英朗GT4d0280056cc64cc7b963b1fecfa723ec.jpg'),(150,43,'ywesc-img.webwss.cn/别克英朗GTdede1a425a6b4a359b474f59e0a815d1.jpg'),(151,43,'ywesc-img.webwss.cn/别克英朗GTe3a13e5e5a7f4c3a920765db539f3440.jpg'),(152,43,'ywesc-img.webwss.cn/别克英朗GTbc65c1c857904a8ca6aa76901f9d0c2e.jpg'),(153,43,'ywesc-img.webwss.cn/别克英朗GT116a051e0f234798b3560ccb18d8a506.jpg'),(154,43,'ywesc-img.webwss.cn/别克英朗GTae86f0db61e345589b9a560ee3eed863.jpg'),(155,44,'ywesc-img.webwss.cn/大众迈腾8748f555b2164e98916258b2ed66218f.jpg'),(156,44,'ywesc-img.webwss.cn/大众迈腾c34900f6423e46a19ea7f6e73e6192bb.jpg'),(157,44,'ywesc-img.webwss.cn/大众迈腾60b26636a4724bd8a8d789a76ccec429.jpg'),(158,44,'ywesc-img.webwss.cn/大众迈腾58fc6de740864e75834bbf4748b75b01.jpg'),(159,44,'ywesc-img.webwss.cn/大众迈腾13600ceb511a4e0aa21e5af83bcb66c6.jpg'),(160,44,'ywesc-img.webwss.cn/大众迈腾83edbe66d8964e1481c539c927be2a75.jpg'),(161,44,'ywesc-img.webwss.cn/大众迈腾70d890373cc044408b987fa431639186.jpg'),(162,44,'ywesc-img.webwss.cn/大众迈腾54d3277278fb4467b9c99ee2a27fdf7c.jpg'),(163,45,'ywesc-img.webwss.cn/宝马320Li27dd534fef514c5ea5eb07fbf6a15da3.jpg'),(164,45,'ywesc-img.webwss.cn/宝马320Lib8952ae3064c4cf49166efef35862769.jpg'),(165,45,'ywesc-img.webwss.cn/宝马320Li0a59804c0a154e20827795aa48535bf1.jpg'),(166,45,'ywesc-img.webwss.cn/宝马320Li7305daa0ac114f6fad04349e7650bad2.jpg'),(167,45,'ywesc-img.webwss.cn/宝马320Lief2325fc89fb4605bf5427325cfdf583.jpg'),(168,45,'ywesc-img.webwss.cn/宝马320Li535be922c0624f63940d3cf263addc17.jpg'),(169,45,'ywesc-img.webwss.cn/宝马320Li8270151313b3463aab2f091a02fe259d.jpg'),(170,45,'ywesc-img.webwss.cn/宝马320Li1e1a97bd1b314d0b9a7adacfdf25fc30.jpg'),(171,46,'ywesc-img.webwss.cn/长安欧诺1fd6fe368a614ec9b781ad28c5b1bced.jpg'),(172,46,'ywesc-img.webwss.cn/长安欧诺9a0f0d44933c46e29454e7e006892d2d.jpg'),(173,46,'ywesc-img.webwss.cn/长安欧诺b8817ee01beb4f8f8e5ba8af62f02d5a.jpg'),(174,46,'ywesc-img.webwss.cn/长安欧诺f95c50a497904669bb3fccf28c20be08.jpg'),(175,46,'ywesc-img.webwss.cn/长安欧诺23052a4b0a834b92a4eff95eea0d2288.jpg'),(176,46,'ywesc-img.webwss.cn/长安欧诺cb23147400ca4913b4a00e5c5babaf34.jpg'),(177,46,'ywesc-img.webwss.cn/长安欧诺fec51cdacb12499f8a7dbf1a549fdcf6.jpg'),(178,46,'ywesc-img.webwss.cn/长安欧诺5b160753b349409b9f6a63e35de187c9.jpg'),(187,48,'ywesc-img.webwss.cn/东风风光330466624def5804e03b53d1626c59abc63.jpg'),(188,48,'ywesc-img.webwss.cn/东风风光33036ffdf3c0b3945adb253b7ae5bfd261c.jpg'),(189,48,'ywesc-img.webwss.cn/东风风光330281b82b5a58e4ffeba1272ca3a1a3d48.jpg'),(190,48,'ywesc-img.webwss.cn/东风风光330e538d2acba974c0ab1559b6173723899.jpg'),(191,48,'ywesc-img.webwss.cn/东风风光33056914e8e92914191909cfc8f310c0e38.jpg'),(192,48,'ywesc-img.webwss.cn/东风风光330650656cb0c864283b148d6b289c50d10.jpg'),(193,48,'ywesc-img.webwss.cn/东风风光33007dbac09965043dfa8fe1cfc13c2427b.jpg'),(194,48,'ywesc-img.webwss.cn/东风风光3304789b29987634cbda37585a92de7652f.jpg'),(195,49,'ywesc-img.webwss.cn/五菱荣光小卡6180ba428af6428dbebb91cc849e809a.jpg'),(196,49,'ywesc-img.webwss.cn/五菱荣光小卡af6a5589b984411ea388fe9a5a6ee9f6.jpg'),(197,49,'ywesc-img.webwss.cn/五菱荣光小卡c682aecf62bb43d881ed4edcc1ef7b68.jpg'),(198,49,'ywesc-img.webwss.cn/五菱荣光小卡74b5cd833e794bda947549c2846e7dac.jpg'),(199,49,'ywesc-img.webwss.cn/五菱荣光小卡30b0b7ef1ef040228a6c8fe7f50f6034.jpg'),(200,49,'ywesc-img.webwss.cn/五菱荣光小卡bea5a92d3cac4a138f9c9b6e384911e3.jpg'),(201,49,'ywesc-img.webwss.cn/五菱荣光小卡0bb3a5fd0574436584a6eb94f38255d2.jpg'),(202,49,'ywesc-img.webwss.cn/五菱荣光小卡afcb8b76b68d4624b6fc5f775c406211.jpg'),(203,50,'ywesc-img.webwss.cn/比亚迪唐（高配）5b8ab00cea964505b4387471441871d6.jpg'),(204,50,'ywesc-img.webwss.cn/比亚迪唐（高配）c5bbd3e7bc49494c9ff14a40350c35f0.jpg'),(205,50,'ywesc-img.webwss.cn/比亚迪唐（高配）d745b48a374f4e128fa79dadf792e343.jpg'),(206,50,'ywesc-img.webwss.cn/比亚迪唐（高配）86d1f61dac734e3eb163b4876a0d88a1.jpg'),(207,50,'ywesc-img.webwss.cn/比亚迪唐（高配）be89acf4df6b47c788cb12a81c769704.jpg'),(208,50,'ywesc-img.webwss.cn/比亚迪唐（高配）25f08c5476df4998aac7e027dd3722e2.jpg'),(209,51,'ywesc-img.webwss.cn/马自达666b646f14dec4270899be9b11b30455a.jpg'),(210,51,'ywesc-img.webwss.cn/马自达6a3558af32893466f9962de8fb775ac8b.jpg'),(211,51,'ywesc-img.webwss.cn/马自达6e66006b3fe1f41d1be45fd2dc7071e58.jpg'),(212,51,'ywesc-img.webwss.cn/马自达64389b372daaf48c1950d0e9d839e6fa9.jpg'),(213,51,'ywesc-img.webwss.cn/马自达6b2d3612b9cd84d5392ed29d0244860dc.jpg'),(214,51,'ywesc-img.webwss.cn/马自达6ac7d13321eda4eddb2acf64df946d1ed.jpg'),(215,51,'ywesc-img.webwss.cn/马自达6dbc61297ee0446b0a208c10e91d924c4.jpg'),(216,51,'ywesc-img.webwss.cn/马自达6608682ada2254424b4429f1bffeb17ca.jpg'),(217,52,'ywesc-img.webwss.cn/宝马530Li665a6cf22408492ea0065826b390bac7.jpg'),(218,52,'ywesc-img.webwss.cn/宝马530Lif67369e2e7fe43268aecb4f2e1b8d728.jpg'),(219,52,'ywesc-img.webwss.cn/宝马530Li802ec28c6a354a41923feb7e457633b8.jpg'),(220,52,'ywesc-img.webwss.cn/宝马530Lib24d19151a6f43c78b66780c09a7a02d.jpg'),(221,52,'ywesc-img.webwss.cn/宝马530Li307ca1b1ec53487ba2172c8c592ca1ea.jpg'),(222,52,'ywesc-img.webwss.cn/宝马530Lifa08418aba564308ac3d3b772b2bc6be.jpg'),(223,52,'ywesc-img.webwss.cn/宝马530Liaa860e0f7f2045b2b189ce8f44cd3a75.jpg'),(224,52,'ywesc-img.webwss.cn/宝马530Li1e49a0504d9d44ce9b42bb440facee08.jpg'),(225,53,'ywesc-img.webwss.cn/别克君威87c5e2c181c54af29339476969578cd8.jpg'),(226,53,'ywesc-img.webwss.cn/别克君威691ef126f6a44b61b10c1ed36165984b.jpg'),(227,53,'ywesc-img.webwss.cn/别克君威5008a718b5f74824b24103151c258d2e.jpg'),(228,53,'ywesc-img.webwss.cn/别克君威ddd6902e93404dbcab7c073854aa6a74.jpg'),(229,53,'ywesc-img.webwss.cn/别克君威7e51313b374f466e90538952d3447614.jpg'),(230,53,'ywesc-img.webwss.cn/别克君威dde684131523474fb3e609e35f00cc0d.jpg'),(231,53,'ywesc-img.webwss.cn/别克君威c69b0589e5b64579ba18b7b3c223a4b0.jpg'),(232,53,'ywesc-img.webwss.cn/别克君威aae2a20ce108476b9c704ea5fbb80e09.jpg'),(233,54,'ywesc-img.webwss.cn/宝马730Lib028a30f400f4d13b4ee15f3bf5897d9.jpg'),(234,54,'ywesc-img.webwss.cn/宝马730Li46e3ad51962a4373bd56968bdf809889.jpg'),(235,54,'ywesc-img.webwss.cn/宝马730Lif5364763e93948fc89d51913bdc0e5df.jpg'),(236,54,'ywesc-img.webwss.cn/宝马730Li7161d546b165495e90da20decdb22fc2.jpg'),(237,54,'ywesc-img.webwss.cn/宝马730Lieff36ceb248044968e0e6afe11867aeb.jpg'),(238,54,'ywesc-img.webwss.cn/宝马730Lidbdecaa3c0814ec38623de82a3efbb40.jpg'),(239,54,'ywesc-img.webwss.cn/宝马730Li69d5341061fb42079e3784ae839a5663.jpg'),(240,54,'ywesc-img.webwss.cn/宝马730Libb19dc5a0b0f4ce7bd70761bb893b6d4.jpg'),(241,55,'ywesc-img.webwss.cn/丰田锐志1931d72988b840e381eaf21b3f0e7817.jpg'),(242,55,'ywesc-img.webwss.cn/丰田锐志e4d8a911317a462bb00d41172e89c721.jpg'),(243,55,'ywesc-img.webwss.cn/丰田锐志b403e287e2164ba5b94435172804531a.jpg'),(244,55,'ywesc-img.webwss.cn/丰田锐志1eda35b70cc841ad9dc8e96e19fd1900.jpg'),(245,55,'ywesc-img.webwss.cn/丰田锐志d928e6b866094cbdaed7d66ffdf56661.jpg'),(246,55,'ywesc-img.webwss.cn/丰田锐志d7f4dde15cd54509b3a84c05f2411a0d.jpg'),(247,55,'ywesc-img.webwss.cn/丰田锐志d35aac94af1e49fea2c5081435e74b3a.jpg'),(248,55,'ywesc-img.webwss.cn/丰田锐志20836c1534ca4091aea42c3a602849aa.jpg'),(249,56,'ywesc-img.webwss.cn/柯斯达明锐a8416a4f652e424a9192d5ea915bedfa.jpg'),(250,56,'ywesc-img.webwss.cn/柯斯达明锐4b57b9d43c0b4b8a80ffbd3e1b81caef.jpg'),(251,56,'ywesc-img.webwss.cn/柯斯达明锐821a41f10593443399d7991edc48048d.jpg'),(252,56,'ywesc-img.webwss.cn/柯斯达明锐874e876e669047e0af2a77876457824b.jpg'),(253,56,'ywesc-img.webwss.cn/柯斯达明锐4928dac6d39f43aea61e211111143a91.jpg'),(254,56,'ywesc-img.webwss.cn/柯斯达明锐229549741e174838b00deea1da81ccea.jpg'),(255,56,'ywesc-img.webwss.cn/柯斯达明锐b47dc0168b4845f2aa15634be67e3082.jpg'),(256,56,'ywesc-img.webwss.cn/柯斯达明锐89758163b56043e48617b2b54bf79167.jpg'),(257,57,'ywesc-img.webwss.cn/福特全顺68378b7677bf44e5a2806f5aed9c55e2.jpg'),(258,57,'ywesc-img.webwss.cn/福特全顺e9d18520f36445d8ac408dcd0ab27001.jpg'),(259,57,'ywesc-img.webwss.cn/福特全顺13a489d842624aebb98d8bbbe352d4e9.jpg'),(260,57,'ywesc-img.webwss.cn/福特全顺621ca005947d42eb95026992832d3476.jpg'),(261,57,'ywesc-img.webwss.cn/福特全顺81371acde01c43c8b6467f5a05225c9d.jpg'),(262,57,'ywesc-img.webwss.cn/福特全顺225d64f10a6e4122a55202ebd8c6146b.jpg'),(263,58,'ywesc-img.webwss.cn/福特锐界20694b91bf2b46cbb361b66cbfdacb1d.jpg'),(264,58,'ywesc-img.webwss.cn/福特锐界202904703e1b4615bb4491d2347593be.jpg'),(265,58,'ywesc-img.webwss.cn/福特锐界3884593483ee4a00b7c108ffe1582f00.jpg'),(266,58,'ywesc-img.webwss.cn/福特锐界2167f7e26429467a8cd68b76b54b69a8.jpg'),(267,58,'ywesc-img.webwss.cn/福特锐界bd8ecebad44b4f7a91acc765882610c2.jpg'),(268,58,'ywesc-img.webwss.cn/福特锐界b1c5b807a33d44aeab78ee6bf0a53af9.jpg'),(269,58,'ywesc-img.webwss.cn/福特锐界92224d0c944346a2b5d0a67308ac8d8a.jpg'),(270,58,'ywesc-img.webwss.cn/福特锐界b5fef8352a0d4e06bc5e77c5c97ee7f9.jpg'),(271,59,'ywesc-img.webwss.cn/上汽大通V80fef2198462114894b184496f71b9174f.jpg'),(272,59,'ywesc-img.webwss.cn/上汽大通V8060d66034a62c403da976dfacd4682219.jpg'),(273,59,'ywesc-img.webwss.cn/上汽大通V80ddf3f233285544c39b19e756e5cf7c8d.jpg'),(274,59,'ywesc-img.webwss.cn/上汽大通V8070f16c37f9c54c959318f943fd038d4f.jpg'),(275,59,'ywesc-img.webwss.cn/上汽大通V802a23434e1eb84471952f3a1cedbc6245.jpg'),(276,59,'ywesc-img.webwss.cn/上汽大通V806fa02157df7b4840a4aa7fc6a806b716.jpg'),(277,59,'ywesc-img.webwss.cn/上汽大通V806a7fc68ce4dd400e86bd17054662e1ba.jpg'),(278,59,'ywesc-img.webwss.cn/上汽大通V80361f23ea077549858d901564bb865ea8.jpg'),(287,61,'ywesc-img.webwss.cn/大众途观3b3e070c37214753afa944b9ed5a11ed.jpg'),(288,61,'ywesc-img.webwss.cn/大众途观1156ca8cee7c49b1acb679f217717764.jpg'),(289,61,'ywesc-img.webwss.cn/大众途观03f692800e1f49a981f2158db5e2c96f.jpg'),(290,61,'ywesc-img.webwss.cn/大众途观e2513836dfff4bf38d2412eb5d0391d8.jpg'),(291,61,'ywesc-img.webwss.cn/大众途观b0729470d06d4660bc95f4dd8f145f88.jpg'),(292,61,'ywesc-img.webwss.cn/大众途观0dca0e64047f4c4f8132d937daf3e271.jpg'),(293,61,'ywesc-img.webwss.cn/大众途观8bc6ff788e014f89a599af9d81c2eff9.jpg'),(294,61,'ywesc-img.webwss.cn/大众途观81fd0a9ea08d4e8dbcfc3671fd247629.jpg');

/*Table structure for table `yw_lxfs` */

DROP TABLE IF EXISTS `yw_lxfs`;

CREATE TABLE `yw_lxfs` (
  `lxfs_id` int NOT NULL AUTO_INCREMENT COMMENT '联系方式id',
  `name` varchar(16) NOT NULL COMMENT '名称',
  `tel` varchar(32) NOT NULL COMMENT '手机号',
  PRIMARY KEY (`lxfs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `yw_lxfs` */

insert  into `yw_lxfs`(`lxfs_id`,`name`,`tel`) values (1,'高老板','17777777777');

/*Table structure for table `yw_user` */

DROP TABLE IF EXISTS `yw_user`;

CREATE TABLE `yw_user` (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `phone` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `nickname` varchar(64) NOT NULL COMMENT '用户名',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `yw_user` */

insert  into `yw_user`(`user_id`,`phone`,`password`,`nickname`) values (1,'13359074748','123456','爽爽');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
