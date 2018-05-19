/*
 Navicat MySQL Data Transfer

 Source Server         : Conexion 1
 Source Server Type    : MySQL
 Source Server Version : 100132
 Source Host           : localhost:3306
 Source Schema         : inversiones

 Target Server Type    : MySQL
 Target Server Version : 100132
 File Encoding         : 65001

 Date: 18/05/2018 20:54:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for inversiones_usuario
-- ----------------------------
DROP TABLE IF EXISTS `inversiones_usuario`;
CREATE TABLE `inversiones_usuario`  (
  `id_inversiones` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_proyecto` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_usuario` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_inversiones`) USING BTREE,
  INDEX `id_proyecto`(`id_proyecto`) USING BTREE,
  INDEX `id_usuario`(`id_usuario`) USING BTREE,
  CONSTRAINT `inversiones_usuario_ibfk_1` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `inversiones_usuario_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for proyecto
-- ----------------------------
DROP TABLE IF EXISTS `proyecto`;
CREATE TABLE `proyecto`  (
  `id_proyecto` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nombre` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descripcion` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `pdf_url` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id_proyecto`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for publicaciones_proyectos
-- ----------------------------
DROP TABLE IF EXISTS `publicaciones_proyectos`;
CREATE TABLE `publicaciones_proyectos`  (
  `id_publicaciones` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_proyecto` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `publicacion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `descripcion` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_tipo_publicacion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_final` date NOT NULL,
  `url` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` int(11) NOT NULL,
  PRIMARY KEY (`id_publicaciones`) USING BTREE,
  INDEX `id_tipo_publicacion`(`id_tipo_publicacion`) USING BTREE,
  INDEX `id_proyecto`(`id_proyecto`) USING BTREE,
  CONSTRAINT `publicaciones_proyectos_ibfk_1` FOREIGN KEY (`id_tipo_publicacion`) REFERENCES `tipo_publicaciones` (`id_tipo_publicacion`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `publicaciones_proyectos_ibfk_2` FOREIGN KEY (`id_proyecto`) REFERENCES `proyecto` (`id_proyecto`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tipo_publicaciones
-- ----------------------------
DROP TABLE IF EXISTS `tipo_publicaciones`;
CREATE TABLE `tipo_publicaciones`  (
  `id_tipo_publicacion` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `prioridad` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_tipo_publicacion`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for tipos_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `tipos_usuarios`;
CREATE TABLE `tipos_usuarios`  (
  `id_tipo_usuario` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `tipo` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_tipo_usuario`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id_usuario` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `id_tipo_usuario` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contrasena` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `estado` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id_usuario`) USING BTREE,
  INDEX `id_tipo_usuario`(`id_tipo_usuario`) USING BTREE,
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tipos_usuarios` (`id_tipo_usuario`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
