/*
Navicat MariaDB Data Transfer

Source Server         : one
Source Server Version : 100509
Source Host           : localhost:3307
Source Database       : short-video-dev

Target Server Type    : MariaDB
Target Server Version : 100509
File Encoding         : 65001

Date: 2021-05-20 02:37:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for bgm
-- ----------------------------
DROP TABLE IF EXISTS `bgm`;
CREATE TABLE `bgm` (
  `id` varchar(64) NOT NULL,
  `author` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL COMMENT '播放地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of bgm
-- ----------------------------
INSERT INTO `bgm` VALUES ('1001', '颜人中', '晚安', '\\bgm\\颜人中 - 胆小鬼.mp3');
INSERT INTO `bgm` VALUES ('1002', '纯音乐', '遇见', '\\bgm\\遇见.mp3');
INSERT INTO `bgm` VALUES ('1003', 'July', 'My Soul', '\\bgm\\My Soul.mp3');
INSERT INTO `bgm` VALUES ('1004', '虎二', '你应该很快乐', '\\bgm\\你应该很快乐.mp3');
INSERT INTO `bgm` VALUES ('1005', '全弟', '小城里岁月流过去', '\\bgm\\小城里岁月流过去.mp3');
INSERT INTO `bgm` VALUES ('1006', '好乐无荒', '7710', '\\bgm\\7710.mp3');

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` varchar(20) NOT NULL,
  `father_comment_id` varchar(20) DEFAULT NULL,
  `to_user_id` varchar(20) DEFAULT NULL,
  `video_id` varchar(20) NOT NULL COMMENT '视频id',
  `from_user_id` varchar(20) NOT NULL COMMENT '留言者，评论的用户id',
  `comment` text NOT NULL COMMENT '评论内容',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='课程评论表';

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('210421BXADZXP568', 'undefined', 'undefined', '210421BWAZF7SRP0', '180425CFA4RB6T0H', '好可爱', '2021-04-21 16:40:57');
INSERT INTO `comments` VALUES ('210428BHMKMAHYRP', 'undefined', 'undefined', '210427BBDKSK9Z54', '2104246KM637AWM8', '123', '2021-04-28 16:14:48');
INSERT INTO `comments` VALUES ('2105116KTZZF0XD4', 'undefined', 'undefined', '21051165ZCZMT1WH', '2104246KM637AWM8', '你好', '2021-05-11 09:18:02');
INSERT INTO `comments` VALUES ('210511814FYTHK8H', '', '2104246KM637AWM8', '21051165ZCZMT1WH', '180425CFA4RB6T0H', 'dddd', '2021-05-11 11:16:02');
INSERT INTO `comments` VALUES ('210516BHZYTCDKAW', 'undefined', 'undefined', '21051165ZCZMT1WH', '180425CFA4RB6T0H', '222', '2021-05-16 16:15:48');
INSERT INTO `comments` VALUES ('2105198P9N3S5MNC', 'undefined', 'undefined', '210518CTSG58NA14', '2105198CSR3AHKKP', 'hao可爱', '2021-05-19 12:13:38');
INSERT INTO `comments` VALUES ('2105198PDRWD73F8', '2105198P9N3S5MNC', '2105198CSR3AHKKP', '210518CTSG58NA14', '2105198CSR3AHKKP', '是啊', '2021-05-19 12:14:05');
INSERT INTO `comments` VALUES ('2105199CST9BN3TC', 'undefined', 'undefined', '210518CSC3WM71WH', '2105199A3FXD82Y8', '好美啊', '2021-05-19 13:15:06');
INSERT INTO `comments` VALUES ('2105199CZR31ZGHH', '2105199CST9BN3TC', '2105199A3FXD82Y8', '210518CSC3WM71WH', '2105199A3FXD82Y8', '是啊', '2021-05-19 13:15:38');
INSERT INTO `comments` VALUES ('2105199DCGYXB540', 'undefined', 'undefined', '210518CSC3WM71WH', '2105199A3FXD82Y8', '我也要去', '2021-05-19 13:17:00');
INSERT INTO `comments` VALUES ('2105199DG41XA5P0', '2105199DCGYXB540', '2105199A3FXD82Y8', '210518CSC3WM71WH', '2105199A3FXD82Y8', '嗯', '2021-05-19 13:17:17');

-- ----------------------------
-- Table structure for search_records
-- ----------------------------
DROP TABLE IF EXISTS `search_records`;
CREATE TABLE `search_records` (
  `id` varchar(64) NOT NULL,
  `content` varchar(255) NOT NULL COMMENT '搜索的内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='视频搜索的记录表';

-- ----------------------------
-- Records of search_records
-- ----------------------------
INSERT INTO `search_records` VALUES ('18051309YBCMHYRP', '风景');
INSERT INTO `search_records` VALUES ('1805130DAXX58ARP', '风景');
INSERT INTO `search_records` VALUES ('1805130DMG6P0ZC0', '风景');
INSERT INTO `search_records` VALUES ('180513C94W152Z7C', 'dwqdwq');
INSERT INTO `search_records` VALUES ('180513DXNT7SY04H', '风景');
INSERT INTO `search_records` VALUES ('210420DFS3FG96Y8', '1');
INSERT INTO `search_records` VALUES ('210424FTF26FA5AW', '测试');
INSERT INTO `search_records` VALUES ('210424FTK19C6C6W', '梨清');
INSERT INTO `search_records` VALUES ('2104278TSPFKZNF8', 'zookeeper');
INSERT INTO `search_records` VALUES ('210428BH9M2K1AW0', '1');
INSERT INTO `search_records` VALUES ('210428BHG1HNY2CH', '梨清');
INSERT INTO `search_records` VALUES ('210511CD8Y1DYAY8', '梨清');
INSERT INTO `search_records` VALUES ('210518FRKKWDNSRP', '风景');
INSERT INTO `search_records` VALUES ('2105198686GSCARP', '狗子');
INSERT INTO `search_records` VALUES ('210519874F229B54', '美食');
INSERT INTO `search_records` VALUES ('21051987NR7WM428', '蔡文姬');
INSERT INTO `search_records` VALUES ('2105198Y8DDP21D4', '风景');
INSERT INTO `search_records` VALUES ('2105198ZF8YGAA80', '美景');
INSERT INTO `search_records` VALUES ('210519905NDP4MK4', '治愈');
INSERT INTO `search_records` VALUES ('2105200BDH90K5YW', '治愈');
INSERT INTO `search_records` VALUES ('2105200C0FZ73168', '治愈');
INSERT INTO `search_records` VALUES ('7', 'zookeeper');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` varchar(64) NOT NULL,
  `username` varchar(20) NOT NULL COMMENT '用户名',
  `password` varchar(64) NOT NULL COMMENT '密码',
  `face_image` varchar(255) DEFAULT NULL COMMENT '我的头像，如果没有默认给一张',
  `nickname` varchar(20) NOT NULL COMMENT '昵称',
  `fans_counts` int(11) DEFAULT 0 COMMENT '我的粉丝数量',
  `follow_counts` int(11) DEFAULT 0 COMMENT '我关注的人总数',
  `receive_like_counts` int(11) DEFAULT 0 COMMENT '我接受到的赞美/收藏 的数量',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('180425B0B3N6B25P', 'imooc11', 'wzNncBURtPYCDsYd7TUgWQ==', null, 'imooc', '0', '0', '0');
INSERT INTO `users` VALUES ('180425BNSR1CG0H0', 'abc', '4QrcOUm6Wau+VuBX8g+IPg==', null, 'abc', '0', '0', '0');
INSERT INTO `users` VALUES ('180425CFA4RB6T0H', 'imooc', 'kU8h64TG/bK2Y91vRT9lyg==', '/180425CFA4RB6T0H/face/AygJRG0zxt00cdef5965073510c38b8046e84e5d6fd9.jpg', 'imooc1', '3', '2', '3');
INSERT INTO `users` VALUES ('2104246KM637AWM8', 'xhmy', '4QrcOUm6Wau+VuBX8g+IPg==', '/2104246KM637AWM8/face/5D8xes52pbo85ed4584d63f01d6f07cfd0ad31d92a57.jpg', 'xhmy', '0', '1', '1');
INSERT INTO `users` VALUES ('210511BSC2R8Z06W', 'yxy', 'tQhoC641YUqIyv20ibF66w==', null, 'yxy', '0', '1', '0');
INSERT INTO `users` VALUES ('210518CACK18GSRP', 'food', 'YlBr401XTaSg0VimclPqmQ==', '/210518CACK18GSRP/face/2i6y3jVZBMp3535b72ddcc3de16ff5bdc9535c9a1789.png', 'food', '0', '0', '0');
INSERT INTO `users` VALUES ('210518CFMZXK3B0H', 'games', 'nPp678xhk2twquxnKTKe2g==', '/210518CFMZXK3B0H/face/qgkyn9owsTlO4cfe9981ff06089a8c05ca66ac159f7d.png', 'games', '0', '0', '0');
INSERT INTO `users` VALUES ('210518CGZPC62PBC', 'sports', 'CISV8wkBWA3dUXFTHNJmSQ==', '/210518CGZPC62PBC/face/RamZuuykaf8o5432032e2e3ced160cc4182c38d8f1ab.png', 'sports', '0', '0', '0');
INSERT INTO `users` VALUES ('210518CK5PR4DZTC', 'school', 'dRbDs1WAs0kCSGKc/15JjA==', '/210518CK5PR4DZTC/face/wENBEtkz3r735c0a3d9c63fcc054cf10a53dfeb22e97.jpeg', 'school', '0', '0', '0');
INSERT INTO `users` VALUES ('210518CMBC91G9AW', 'animal', 'HkSD6DMCWsEOYYTnXLLRnQ==', '/210518CMBC91G9AW/face/phdJJv3zmGwB0ea5d41132f20d0af55f26e6c7a44f16.png', 'animal', '0', '0', '0');
INSERT INTO `users` VALUES ('210518CNB8T27B0H', 'movies', 'VbpExUjT66/Z9w5kp/IysA==', '/210518CNB8T27B0H/face/IfHO8yUolQXm9b2cecfe87a699824f74f6ece712e10b.png', 'movies', '0', '0', '0');
INSERT INTO `users` VALUES ('210518CRDYF53H6W', 'view', 'G9qA8r5NNljguqQ/vnrowQ==', '/210518CRDYF53H6W/face/Xj3LkcT9DfAGe9a14fdbe5fd9b6150c369e4dbf37762.png', 'view', '1', '0', '1');
INSERT INTO `users` VALUES ('210518CSW19NZKGC', 'kids', 'UYWSsi8xXvSG14v16FxSTQ==', '/210518CSW19NZKGC/face/RNgId76jL7hoce99e600f1190d3a12a4d73a323e9027.png', 'kids', '2', '0', '1');
INSERT INTO `users` VALUES ('2105198BD5A8T91P', '123', 'ICy5YqxZB1uWSwcVLSNLcA==', null, '123', '0', '0', '0');
INSERT INTO `users` VALUES ('2105198CSR3AHKKP', 'name', 'sGiTHMRQRCtj9bPSdupClw==', '/2105198CSR3AHKKP/face/BPUy8CuUT4HA5be45830c9a8a193f39c071183a4dc4e.JPG', 'name', '0', '2', '0');
INSERT INTO `users` VALUES ('2105199A3FXD82Y8', 'qwert', 'o4S2Rj/CFqX47LZnD4ZFag==', '/2105199A3FXD82Y8/face/yanZr94It5H5228b096f037a265d1ac723eb3986f4db.jpg', 'qwert', '0', '1', '0');

-- ----------------------------
-- Table structure for users_fans
-- ----------------------------
DROP TABLE IF EXISTS `users_fans`;
CREATE TABLE `users_fans` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL COMMENT '用户',
  `fan_id` varchar(64) NOT NULL COMMENT '粉丝',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`fan_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户粉丝关联关系表';

-- ----------------------------
-- Records of users_fans
-- ----------------------------
INSERT INTO `users_fans` VALUES ('210428BH23AN3168', '180425CFA4RB6T0H', '2104246KM637AWM8');
INSERT INTO `users_fans` VALUES ('210511BSDFN5THH0', '180425CFA4RB6T0H', '210511BSC2R8Z06W');
INSERT INTO `users_fans` VALUES ('2105198FRHFGR028', '210518CRDYF53H6W', '2105198CSR3AHKKP');
INSERT INTO `users_fans` VALUES ('2105198FM88TH46W', '210518CSW19NZKGC', '2105198CSR3AHKKP');
INSERT INTO `users_fans` VALUES ('2105199BZA288H94', '210518CSW19NZKGC', '2105199A3FXD82Y8');

-- ----------------------------
-- Table structure for users_like_videos
-- ----------------------------
DROP TABLE IF EXISTS `users_like_videos`;
CREATE TABLE `users_like_videos` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL COMMENT '用户',
  `video_id` varchar(64) NOT NULL COMMENT '视频',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_video_rel` (`user_id`,`video_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户喜欢的/赞过的视频';

-- ----------------------------
-- Records of users_like_videos
-- ----------------------------
INSERT INTO `users_like_videos` VALUES ('210515F3N852A800', '180425CFA4RB6T0H', '21051165SDGD4TF8');
INSERT INTO `users_like_videos` VALUES ('180520HBA054FPPH', '180518CKMAAM5TXP', '180510CCX05TABHH');
INSERT INTO `users_like_videos` VALUES ('180520HSBDW6M0SW', '180518CKMAAM5TXP', '180510CD0A6K3SRP');
INSERT INTO `users_like_videos` VALUES ('2105198FTR0CPH00', '2105198CSR3AHKKP', '210518CXMDRBT1GC');
INSERT INTO `users_like_videos` VALUES ('2105199C1Y921400', '2105199A3FXD82Y8', '210518CTSG58NA14');

-- ----------------------------
-- Table structure for users_report
-- ----------------------------
DROP TABLE IF EXISTS `users_report`;
CREATE TABLE `users_report` (
  `id` varchar(64) NOT NULL,
  `deal_user_id` varchar(64) NOT NULL COMMENT '被举报用户id',
  `deal_video_id` varchar(64) NOT NULL,
  `title` varchar(128) NOT NULL COMMENT '类型标题，让用户选择，详情见 枚举',
  `content` varchar(255) DEFAULT NULL COMMENT '内容',
  `userid` varchar(64) NOT NULL COMMENT '举报人的id',
  `create_date` datetime NOT NULL COMMENT '举报时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='举报用户表';

-- ----------------------------
-- Records of users_report
-- ----------------------------
INSERT INTO `users_report` VALUES ('180521FZ501ABDYW', '180425CFA4RB6T0H', '180510CD0A6K3SRP', '引人不适', '不合时宜的视频', '180518CKMAAM5TXP', '2018-05-21 20:58:35');
INSERT INTO `users_report` VALUES ('180521FZK44ZRWX4', '180425CFA4RB6T0H', '180510CD0A6K3SRP', '引人不适', '不合时宜的视频', '180518CKMAAM5TXP', '2018-05-21 20:59:53');
INSERT INTO `users_report` VALUES ('180521FZR1TYRTXP', '180425CFA4RB6T0H', '180510CD0A6K3SRP', '辱骂谩骂', 't4t43', '180518CKMAAM5TXP', '2018-05-21 21:00:18');
INSERT INTO `users_report` VALUES ('2105198PMXF3ZMW0', '210518CSW19NZKGC', '210518CTSG58NA14', '诱导分享', '大幅回升的浪费了', '2105198CSR3AHKKP', '2021-05-19 12:14:38');
INSERT INTO `users_report` VALUES ('2105199DN557558H', '210518CRDYF53H6W', '210518CSC3WM71WH', '引人不适', '和金克拉飒飒v', '2105199A3FXD82Y8', '2021-05-19 13:17:43');

-- ----------------------------
-- Table structure for videos
-- ----------------------------
DROP TABLE IF EXISTS `videos`;
CREATE TABLE `videos` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL COMMENT '发布者id',
  `audio_id` varchar(64) DEFAULT NULL COMMENT '用户使用音频的信息',
  `video_desc` varchar(128) DEFAULT NULL COMMENT '视频描述',
  `video_path` varchar(255) NOT NULL COMMENT '视频存放的路径',
  `video_seconds` float(6,2) DEFAULT NULL COMMENT '视频秒数',
  `video_width` int(6) DEFAULT NULL COMMENT '视频宽度',
  `video_height` int(6) DEFAULT NULL COMMENT '视频高度',
  `cover_path` varchar(255) DEFAULT NULL COMMENT '视频封面图',
  `like_counts` bigint(20) NOT NULL DEFAULT 0 COMMENT '喜欢/赞美的数量',
  `status` int(1) NOT NULL COMMENT '视频状态：\r\n1、发布成功\r\n2、禁止播放，管理员操作',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='视频信息表';

-- ----------------------------
-- Records of videos
-- ----------------------------
INSERT INTO `videos` VALUES ('2105115W14YMGY14', '2104246KM637AWM8', '', '', '/2104246KM637AWM8/video/DUXACfYuqaut170529a560954de9857afcca54335323.mp4', '6.99', '1280', '720', '/2104246KM637AWM8/video/DUXACfYuqaut170529a560954de9857afcca54335323.jpg', '0', '1', '2021-05-11 08:12:32');
INSERT INTO `videos` VALUES ('21051165SDGD4TF8', '2104246KM637AWM8', '1001', '风景  治愈系', '/2104246KM637AWM8/video/68fcec88-ee52-457f-8c38-d92ab850e7ff.mp4', '10.20', '720', '1280', '/2104246KM637AWM8/video/GxwFnbzwTu8Ge4cec790d2c0809c8d715af57399b9e5.jpg', '1', '1', '2021-05-11 08:41:50');
INSERT INTO `videos` VALUES ('21051165ZCZMT1WH', '2104246KM637AWM8', '1004', '梨清', '/2104246KM637AWM8/video/17431c87-d0e7-4fb3-9a18-7bbedda1ea90.mp4', '5.13', '720', '1280', '/2104246KM637AWM8/video/0P9ez6TdvX6y5f5b5608407fba0ae664b8c17f9a99de.jpg', '0', '1', '2021-05-11 08:42:22');
INSERT INTO `videos` VALUES ('210511BM2XCD81KP', '180425CFA4RB6T0H', '1005', '月亮', '/180425CFA4RB6T0H/video/f3f30055-6f5a-4eab-b693-ce23fd142dd2.mp4', '9.33', '720', '1280', '/180425CFA4RB6T0H/video/pjaldIpGeKMoe2cdddefe2a607708ca3ccd371bf8489.jpg', '0', '1', '2021-05-11 16:19:07');
INSERT INTO `videos` VALUES ('210518CDBM24KHBC', '210518CACK18GSRP', '', '这个肉末茄子煲，简单好吃~', '/210518CACK18GSRP/video/Z9cXcf8Dh9Cv8663991d848d32db2cfc681fc3cddefa.mp4', '29.49', '720', '1280', '/210518CACK18GSRP/video/Z9cXcf8Dh9Cv8663991d848d32db2cfc681fc3cddefa.jpg', '0', '1', '2021-05-18 17:29:07');
INSERT INTO `videos` VALUES ('210518CF5K726CX4', '210518CACK18GSRP', '', '真是没想到这个鸡蛋做法会这么好吃！', '/210518CACK18GSRP/video/TDVo5WAu34d5a47a6a71ca03dc4482df7568c99c0412.mp4', '20.55', '1280', '720', '/210518CACK18GSRP/video/TDVo5WAu34d5a47a6a71ca03dc4482df7568c99c0412.jpg', '0', '1', '2021-05-18 17:31:28');
INSERT INTO `videos` VALUES ('210518CG6Z6DWH00', '210518CFMZXK3B0H', '', '原来王者荣耀这么好玩啊！！！', '/210518CFMZXK3B0H/video/LPeU0duAruqOb843aa80b441787a4c95995171952602.mp4', '24.13', '1280', '720', '/210518CFMZXK3B0H/video/LPeU0duAruqOb843aa80b441787a4c95995171952602.jpg', '0', '1', '2021-05-18 17:34:37');
INSERT INTO `videos` VALUES ('210518CGD226NSCH', '210518CFMZXK3B0H', '', '吕德华', '/210518CFMZXK3B0H/video/qPgKOWz96Mtc915bf56a97d00473ea1a56b470db764f.mp4', '20.78', '720', '1280', '/210518CFMZXK3B0H/video/qPgKOWz96Mtc915bf56a97d00473ea1a56b470db764f.jpg', '0', '1', '2021-05-18 17:35:16');
INSERT INTO `videos` VALUES ('210518CHRZHA90PH', '210518CGZPC62PBC', '', '湖人总冠军！', '/210518CGZPC62PBC/video/Q0WUMQnk4XPF35b1b0dcce1cd947ecb4b49f9dbf961e.mp4', '14.88', '720', '720', '/210518CGZPC62PBC/video/Q0WUMQnk4XPF35b1b0dcce1cd947ecb4b49f9dbf961e.jpg', '0', '1', '2021-05-18 17:39:14');
INSERT INTO `videos` VALUES ('210518CKMKX5ZS3C', '210518CK5PR4DZTC', '', '一开口就知道是王者~', '/210518CK5PR4DZTC/video/1XQuaTNmzoCf93ba882a0ccf3f2e67f41c4b3b834b0c.mp4', '14.12', '720', '1270', '/210518CK5PR4DZTC/video/1XQuaTNmzoCf93ba882a0ccf3f2e67f41c4b3b834b0c.jpg', '0', '1', '2021-05-18 17:41:52');
INSERT INTO `videos` VALUES ('210518CMY2TG5028', '210518CMBC91G9AW', '', '我怀疑它是人伴的？', '/210518CMBC91G9AW/video/KrPsdm67xhlzd9f75978a373d8687c22481c942c0e21.mp4', '7.50', '720', '1280', '/210518CMBC91G9AW/video/KrPsdm67xhlzd9f75978a373d8687c22481c942c0e21.jpg', '0', '1', '2021-05-18 17:45:41');
INSERT INTO `videos` VALUES ('210518CP3C9T8A3C', '210518CNB8T27B0H', '', 'hhhhhhh', '/210518CNB8T27B0H/video/nRxNqYyJsBute907d970d78e6d7223bbf7b4951183ec.mp4', '29.28', '1290', '720', '/210518CNB8T27B0H/video/nRxNqYyJsBute907d970d78e6d7223bbf7b4951183ec.jpg', '0', '1', '2021-05-18 17:49:15');
INSERT INTO `videos` VALUES ('210518CPRACDS1D4', '210518CNB8T27B0H', '', '搞笑电影', '/210518CNB8T27B0H/video/ZKb9zJYiLZMV33d9527c3680ed7374b9dc20f082ebed.mp4', '42.77', '1280', '720', '/210518CNB8T27B0H/video/ZKb9zJYiLZMV33d9527c3680ed7374b9dc20f082ebed.jpg', '0', '1', '2021-05-18 17:51:10');
INSERT INTO `videos` VALUES ('210518CS3DB1YC6W', '210518CRDYF53H6W', '', '真的好美啊~', '/210518CRDYF53H6W/video/lPuwCh5EIC6b0147ea4c990070c4d6cbaa9856cf5eb1.mp4', '11.70', '720', '1280', '/210518CRDYF53H6W/video/lPuwCh5EIC6b0147ea4c990070c4d6cbaa9856cf5eb1.jpg', '0', '1', '2021-05-18 17:55:16');
INSERT INTO `videos` VALUES ('210518CSC3WM71WH', '210518CRDYF53H6W', '', '超级治愈！', '/210518CRDYF53H6W/video/VKptM63pX8pt8f5897c63b9be68ea8fa4d994a14d8d7.mp4', '7.13', '720', '1280', '/210518CRDYF53H6W/video/VKptM63pX8pt8f5897c63b9be68ea8fa4d994a14d8d7.jpg', '0', '1', '2021-05-18 17:56:11');
INSERT INTO `videos` VALUES ('210518CTGKDT930H', '210518CSW19NZKGC', '', '蔡文姬同款jiojio', '/210518CSW19NZKGC/video/TueI2xlBOASlb4d8251c956925b2b181b4d8cbbb79de.mp4', '15.70', '720', '1280', '/210518CSW19NZKGC/video/TueI2xlBOASlb4d8251c956925b2b181b4d8cbbb79de.jpg', '0', '1', '2021-05-18 17:59:34');
INSERT INTO `videos` VALUES ('210518CTSG58NA14', '210518CSW19NZKGC', '', '放开那只手，让我来', '/210518CSW19NZKGC/video/KA09ENZqESNY1e555cc6df0c18b5876204fb784c8cce.mp4', '19.32', '720', '1280', '/210518CSW19NZKGC/video/KA09ENZqESNY1e555cc6df0c18b5876204fb784c8cce.jpg', '1', '1', '2021-05-18 18:00:18');
INSERT INTO `videos` VALUES ('210518CW9NFC8XD4', '210518CGZPC62PBC', '', '利拉德率队进入季后赛', '/210518CGZPC62PBC/video/ImM4lWX9SMX6bd6eeeeec988415b66750c5d8edfe8ff.mp4', '12.19', '720', '720', '/210518CGZPC62PBC/video/ImM4lWX9SMX6bd6eeeeec988415b66750c5d8edfe8ff.jpg', '0', '1', '2021-05-18 18:01:56');
INSERT INTO `videos` VALUES ('210518CX6HPXFCH0', '210518CMBC91G9AW', '', '狗子：我在思考人生，别打扰我', '/210518CMBC91G9AW/video/xjeILJx2X9KP5b8b22e550796784cfe575c9430751c5.mp4', '9.43', '720', '1280', '/210518CMBC91G9AW/video/xjeILJx2X9KP5b8b22e550796784cfe575c9430751c5.jpg', '0', '1', '2021-05-18 18:04:36');
INSERT INTO `videos` VALUES ('210518CXMDRBT1GC', '210518CRDYF53H6W', '', '治愈系 美景', '/210518CRDYF53H6W/video/yVjIWkpRHdgSfc8d0ecd91dfd5977b3cd73df22069d8.mp4', '7.73', '720', '1280', '/210518CRDYF53H6W/video/yVjIWkpRHdgSfc8d0ecd91dfd5977b3cd73df22069d8.jpg', '1', '1', '2021-05-18 18:05:53');
INSERT INTO `videos` VALUES ('2105198F61FM36RP', '2105198CSR3AHKKP', '1006', '人美歌甜！', '/2105198CSR3AHKKP/video/45d0041f-25fa-45f5-9b3d-92b737ca56f9.mp4', '23.27', '720', '1270', '/2105198CSR3AHKKP/video/fRe1wjFf5q5g1b7be84b52dc4a83fec5edf67ea61480.jpg', '0', '1', '2021-05-19 11:55:14');
INSERT INTO `videos` VALUES ('2105199B5TBD3FY8', '2105199A3FXD82Y8', '1003', '橄榄球', '/2105199A3FXD82Y8/video/a6daea89-c167-4741-a754-168bad93b3b2.mp4', '18.30', '720', '1280', '/2105199A3FXD82Y8/video/Ecs8Wredzo8c3b7075a2c94c70e7347e1f4d01962217.jpg', '0', '1', '2021-05-19 13:10:17');
INSERT INTO `videos` VALUES ('210519HYGGCTY6A8', '210518CRDYF53H6W', '', '美景', '/210518CRDYF53H6W/video/7U3C6EDNJeuB0147ea4c990070c4d6cbaa9856cf5eb1.mp4', '11.70', '720', '1280', '/210518CRDYF53H6W/video/7U3C6EDNJeuB0147ea4c990070c4d6cbaa9856cf5eb1.jpg', '0', '1', '2021-05-19 23:44:51');
INSERT INTO `videos` VALUES ('210519HYN8CCX1AW', '210518CRDYF53H6W', '', '美景二', '/210518CRDYF53H6W/video/4mGX9n3Lkwl515568220c669cf4b87264be6c136cfa1.mp4', '8.05', '720', '1280', '/210518CRDYF53H6W/video/4mGX9n3Lkwl515568220c669cf4b87264be6c136cfa1.jpg', '0', '1', '2021-05-19 23:45:15');
INSERT INTO `videos` VALUES ('210519HYS9306894', '210518CRDYF53H6W', '', '治愈 美景', '/210518CRDYF53H6W/video/QQ3wVWy9u1AG4d69494d0d867655c209b9bf97b10c38.mp4', '9.40', '1080', '1920', '/210518CRDYF53H6W/video/QQ3wVWy9u1AG4d69494d0d867655c209b9bf97b10c38.jpg', '0', '1', '2021-05-19 23:45:34');
INSERT INTO `videos` VALUES ('210519HYWTFPA8M8', '210518CRDYF53H6W', '', '美景3', '/210518CRDYF53H6W/video/eYOhTvAHdHIPe4cec790d2c0809c8d715af57399b9e5.mp4', '10.20', '720', '1280', '/210518CRDYF53H6W/video/eYOhTvAHdHIPe4cec790d2c0809c8d715af57399b9e5.jpg', '0', '1', '2021-05-19 23:45:50');
