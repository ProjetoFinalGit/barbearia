-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 25-Out-2021 às 21:20
-- Versão do servidor: 5.7.31
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `projetoetb`
--
CREATE DATABASE IF NOT EXISTS `projetoetb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `projetoetb`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `agendamento`
--

DROP TABLE IF EXISTS `agendamento`;
CREATE TABLE IF NOT EXISTS `agendamento` (
  `idAgendamento` int(11) NOT NULL AUTO_INCREMENT,
  `dataAgendamento` date NOT NULL,
  `valorTotal` double NOT NULL,
  `status` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  PRIMARY KEY (`idAgendamento`,`idCliente`,`idUsuario`),
  KEY `fk_Agendamento_usuario1_idx` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu`
--

DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `idMenu` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `link` varchar(124) NOT NULL,
  `icone` varchar(45) NOT NULL,
  `exibir` int(11) NOT NULL,
  PRIMARY KEY (`idMenu`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `menu`
--

INSERT INTO `menu` (`idMenu`, `nome`, `link`, `icone`, `exibir`) VALUES
(3, 'Perfis', 'listarPerfil.jsp', '', 1),
(4, 'Menus', 'listarMenu.jsp', '', 1),
(5, 'Usuarios', 'listarUsuario.jsp', '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `menu_perfil`
--

DROP TABLE IF EXISTS `menu_perfil`;
CREATE TABLE IF NOT EXISTS `menu_perfil` (
  `idMenu` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  PRIMARY KEY (`idMenu`,`idPerfil`),
  KEY `fk_menu_has_Perfil_Perfil1_idx` (`idPerfil`),
  KEY `fk_menu_has_Perfil_menu1_idx` (`idMenu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `menu_perfil`
--

INSERT INTO `menu_perfil` (`idMenu`, `idPerfil`) VALUES
(3, 1),
(4, 1),
(5, 1),
(4, 2),
(5, 2),
(5, 3),
(5, 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `perfil`
--

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE IF NOT EXISTS `perfil` (
  `idPerfil` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `dataCadastro` date NOT NULL,
  PRIMARY KEY (`idPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `perfil`
--

INSERT INTO `perfil` (`idPerfil`, `nome`, `dataCadastro`) VALUES
(1, 'Administrador', '2021-10-13'),
(2, 'Gerente', '2021-10-12'),
(3, 'Funcionário', '2021-10-11'),
(4, 'Cliente', '2021-10-10');

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico`
--

DROP TABLE IF EXISTS `servico`;
CREATE TABLE IF NOT EXISTS `servico` (
  `idServico` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `descricao` varchar(125) NOT NULL,
  `preco` double NOT NULL,
  PRIMARY KEY (`idServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `servico_has_agendamento`
--

DROP TABLE IF EXISTS `servico_has_agendamento`;
CREATE TABLE IF NOT EXISTS `servico_has_agendamento` (
  `idServico` int(11) NOT NULL,
  `idAgendamento` int(11) NOT NULL,
  `horario` date NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`idServico`,`idAgendamento`),
  KEY `fk_Servico_has_Agendamento_Agendamento1_idx` (`idAgendamento`),
  KEY `fk_Servico_has_Agendamento_Servico1_idx` (`idServico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE IF NOT EXISTS `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(64) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(124) NOT NULL,
  `status` int(11) NOT NULL,
  `idPerfil` int(11) NOT NULL,
  `telefone` varchar(45) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `endereco` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  PRIMARY KEY (`idUsuario`,`idPerfil`),
  KEY `fk_usuario_Perfil_idx` (`idPerfil`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nome`, `login`, `senha`, `status`, `idPerfil`, `telefone`, `dataNascimento`, `endereco`, `cpf`) VALUES
(9, 'Vitor Gabriel', 'vgvitor@hotmail.com', '123321', 1, 1, '', NULL, '', '060.828.811-09'),
(10, 'Miguelzin', 'vitorphilos1@hotmail.com', '050220', 2, 6, '', NULL, '', ''),
(11, 'Orso', 'teste@etb.com.br', '123321123', 1, 7, '', NULL, '', ''),
(13, 'Diego', 'seculurum@hotmail.com', '050220', 1, 2, '', NULL, '', ''),
(14, 'Miguel', 'miguel@hotmail.com', '123', 1, 3, '', NULL, '', ''),
(15, 'Vitor', 'teste@etb.com.br', '9873465251987', 1, 2, '', NULL, '', ''),
(16, 'Orso Miguel', 'miguelito@hotmail.com', '91851540', 1, 4, '', NULL, '', ''),
(18, 'Duduzin Henrique', 'duduzin@gmail.com', '91851540', 1, 4, '', NULL, '', ''),
(22, 'Novo Teste Implementação', 'testedeverificacao@teste.com.br', '984198749864', 1, 4, '(61) 99628-0717', '1996-12-31', 'Qs 05, Rua 310, Costa Vitória', '564.984.191-84');

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `agendamento`
--
ALTER TABLE `agendamento`
  ADD CONSTRAINT `fk_Agendamento_usuario1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `menu_perfil`
--
ALTER TABLE `menu_perfil`
  ADD CONSTRAINT `fk_menu_has_Perfil_Perfil1` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_menu_has_Perfil_menu1` FOREIGN KEY (`idMenu`) REFERENCES `menu` (`idMenu`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `servico_has_agendamento`
--
ALTER TABLE `servico_has_agendamento`
  ADD CONSTRAINT `fk_Servico_has_Agendamento_Agendamento1` FOREIGN KEY (`idAgendamento`) REFERENCES `agendamento` (`idAgendamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Servico_has_Agendamento_Servico1` FOREIGN KEY (`idServico`) REFERENCES `servico` (`idServico`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_Perfil` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`idPerfil`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
