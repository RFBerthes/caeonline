-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 18/05/2019 às 00:15
-- Versão do servidor: 10.1.38-MariaDB
-- Versão do PHP: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `totem`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `alunos`
--

CREATE TABLE `alunos` (
  `idalunos` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `matricula` varchar(45) DEFAULT NULL,
  `curso` varchar(45) DEFAULT NULL,
  `passwd` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `alunos`
--

INSERT INTO `alunos` (`idalunos`, `nome`, `matricula`, `curso`, `passwd`) VALUES
(1, 'Rafael Flores Berthes da Silva', 'alu201722754', 'ADS', '55782209'),
(2, 'Lucas Lima', 'alu201917450', 'CDC', NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `atendimento`
--

CREATE TABLE `atendimento` (
  `idatendimento` int(11) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `atendimentocol` varchar(45) DEFAULT NULL,
  `alunos_idalunos` int(11) NOT NULL,
  `operador_idoperador` int(11) NOT NULL,
  `filapref_idfilapref` int(11) NOT NULL,
  `filanormal_idfilanormal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `filanormal`
--

CREATE TABLE `filanormal` (
  `idfilanormal` int(11) NOT NULL,
  `numeron` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `filapref`
--

CREATE TABLE `filapref` (
  `idfilapref` int(11) NOT NULL,
  `filaprefcol` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura para tabela `operador`
--

CREATE TABLE `operador` (
  `idoperador` int(11) NOT NULL,
  `usuario` varchar(45) DEFAULT NULL,
  `matricula` varchar(10) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `passwd` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Despejando dados para a tabela `operador`
--

INSERT INTO `operador` (`idoperador`, `usuario`, `matricula`, `tipo`, `passwd`) VALUES
(0, 'operador', 'operador', 'operador', 'operador');

--
-- Índices de tabelas apagadas
--

--
-- Índices de tabela `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`idalunos`);

--
-- Índices de tabela `atendimento`
--
ALTER TABLE `atendimento`
  ADD PRIMARY KEY (`idatendimento`),
  ADD KEY `fk_atendimento_alunos1_idx` (`alunos_idalunos`),
  ADD KEY `fk_atendimento_operador1_idx` (`operador_idoperador`),
  ADD KEY `fk_atendimento_filapref1_idx` (`filapref_idfilapref`),
  ADD KEY `fk_atendimento_filanormal1_idx` (`filanormal_idfilanormal`);

--
-- Índices de tabela `filanormal`
--
ALTER TABLE `filanormal`
  ADD PRIMARY KEY (`idfilanormal`);

--
-- Índices de tabela `filapref`
--
ALTER TABLE `filapref`
  ADD PRIMARY KEY (`idfilapref`);

--
-- Índices de tabela `operador`
--
ALTER TABLE `operador`
  ADD PRIMARY KEY (`idoperador`);

--
-- AUTO_INCREMENT de tabelas apagadas
--

--
-- AUTO_INCREMENT de tabela `alunos`
--
ALTER TABLE `alunos`
  MODIFY `idalunos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `atendimento`
--
ALTER TABLE `atendimento`
  MODIFY `idatendimento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `filanormal`
--
ALTER TABLE `filanormal`
  MODIFY `idfilanormal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `filapref`
--
ALTER TABLE `filapref`
  MODIFY `idfilapref` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para dumps de tabelas
--

--
-- Restrições para tabelas `atendimento`
--
ALTER TABLE `atendimento`
  ADD CONSTRAINT `fk_atendimento_alunos1` FOREIGN KEY (`alunos_idalunos`) REFERENCES `alunos` (`idalunos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atendimento_filanormal1` FOREIGN KEY (`filanormal_idfilanormal`) REFERENCES `filanormal` (`idfilanormal`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atendimento_filapref1` FOREIGN KEY (`filapref_idfilapref`) REFERENCES `filapref` (`idfilapref`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_atendimento_operador1` FOREIGN KEY (`operador_idoperador`) REFERENCES `operador` (`idoperador`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
