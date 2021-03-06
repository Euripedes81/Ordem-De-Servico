-- MySQL dump 10.13  Distrib 5.7.31, for Win64 (x86_64)
--
-- Host: localhost    Database: ordemdeservico
-- ------------------------------------------------------
-- Server version	5.7.31-log

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

--
-- Table structure for table `atendente`
--

DROP TABLE IF EXISTS `atendente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `atendente` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(45) NOT NULL,
  `Nome` varchar(45) DEFAULT NULL,
  `Senha` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `usuario_UNIQUE` (`Usuario`)
) --ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atendente`
--

LOCK TABLES `atendente` WRITE;
/*!40000 ALTER TABLE `atendente` DISABLE KEYS */;
INSERT INTO `atendente` VALUES (1,'admin','ADMINISTRADOR DE USU├üRIOS','da39a3ee5e6b4b0d3255bfef95601890afd80709');
/*!40000 ALTER TABLE `atendente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquina`
--

DROP TABLE IF EXISTS `maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `maquina` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Patrimonio` int(11) DEFAULT NULL,
  `Tipo` varchar(45) NOT NULL,
  `Descricao` mediumtext,
  `IdSetor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `patrimonio_UNIQUE` (`Patrimonio`),
  KEY `idSetor_idx` (`IdSetor`),
  CONSTRAINT `maquina_ibfk_1` FOREIGN KEY (`IdSetor`) REFERENCES `setor` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ---ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquina`
--

LOCK TABLES `maquina` WRITE;
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordemdeservico`
--

DROP TABLE IF EXISTS `ordemdeservico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordemdeservico` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `IdSolicitante` int(11) DEFAULT NULL,
  `IdMaquina` int(11) DEFAULT NULL,
  `IdSetor` int(11) DEFAULT NULL,
  `Diagnostico` tinytext,
  `DataAbertura` datetime DEFAULT NULL,
  `Solucao` varchar(45) DEFAULT NULL,
  `DataFechamento` datetime DEFAULT NULL,
  `Observacao` varchar(90) DEFAULT NULL,
  `IdAtendente` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idFuncionario_idx` (`IdSolicitante`),
  KEY `idMaquina_idx` (`IdMaquina`),
  KEY `idAtendente_idx` (`IdAtendente`),
  KEY `idSetor_idx` (`IdSetor`),
  CONSTRAINT `idAtendente` FOREIGN KEY (`IdAtendente`) REFERENCES `atendente` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idMaquina` FOREIGN KEY (`IdMaquina`) REFERENCES `maquina` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `idSolicitante` FOREIGN KEY (`IdSolicitante`) REFERENCES `solicitante` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) --ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordemdeservico`
--

LOCK TABLES `ordemdeservico` WRITE;
/*!40000 ALTER TABLE `ordemdeservico` DISABLE KEYS */;
/*!40000 ALTER TABLE `ordemdeservico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secretaria`
--

DROP TABLE IF EXISTS `secretaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `secretaria` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Descricao` varchar(45) DEFAULT NULL,
  `Telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `nome_UNIQUE` (`Nome`)
) --ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secretaria`
--

LOCK TABLES `secretaria` WRITE;
/*!40000 ALTER TABLE `secretaria` DISABLE KEYS */;
/*!40000 ALTER TABLE `secretaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `setor`
--

DROP TABLE IF EXISTS `setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `setor` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Descricao` varchar(45) DEFAULT NULL,
  `IdSecretaria` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `nome_UNIQUE` (`Nome`),
  KEY `idSecretaria_idx` (`IdSecretaria`),
  CONSTRAINT `idSecretaria` FOREIGN KEY (`IdSecretaria`) REFERENCES `secretaria` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) --ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `setor`
--

LOCK TABLES `setor` WRITE;
/*!40000 ALTER TABLE `setor` DISABLE KEYS */;
/*!40000 ALTER TABLE `setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitante`
--

DROP TABLE IF EXISTS `solicitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitante` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(45) NOT NULL,
  `Descricao` varchar(45) DEFAULT NULL,
  `IdSetor` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `idSetor_idx` (`IdSetor`),
  CONSTRAINT `idSetor` FOREIGN KEY (`IdSetor`) REFERENCES `setor` (`Id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) --ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitante`
--

LOCK TABLES `solicitante` WRITE;
/*!40000 ALTER TABLE `solicitante` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitante` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-10-18 15:48:37
