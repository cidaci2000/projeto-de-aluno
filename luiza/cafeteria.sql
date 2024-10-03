-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 03/10/2024 às 14:15
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `cafeteria`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `cadastro`
--

CREATE TABLE `cadastro` (
  `email` varchar(100) NOT NULL,
  `nome_usuario` varchar(50) NOT NULL,
  `senha` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cpf` varchar(11) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `nome_usuario` varchar(50) DEFAULT NULL,
  `senha` varchar(255) NOT NULL,
  `rua` varchar(100) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `complemento` varchar(50) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(100) DEFAULT NULL,
  `cep` varchar(8) DEFAULT NULL,
  `tipo` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id_cliente`, `nome`, `cpf`, `telefone`, `email`, `nome_usuario`, `senha`, `rua`, `numero`, `complemento`, `bairro`, `cidade`, `cep`, `tipo`) VALUES
(1, '', NULL, NULL, NULL, NULL, '', 'aaaa', 123, 'ssss', 'Parque Verde', 'Cascavel', '85807670', 0),
(2, 'Aparecida Ferreira', '777.777.777', '45999003009', 'aparec@gmail.com', 'Aparecida Ferreira', '123', 'aaaa', 123, 'ssss', 'Parque Verde', 'Cascavel', '85807670', 0),
(3, 'Aparecida Ferreira', '777.777.777', '45999003009', 'aparecida.ferre@gmail.com', 'Aparecida Ferreira', '123', 'aaaa', 123, 'ssss', 'Parque Verde', 'Cascavel', '85807670', 0);

-- --------------------------------------------------------

--
-- Estrutura para tabela `endereco_entrega`
--

CREATE TABLE `endereco_entrega` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome_produto` varchar(100) NOT NULL,
  `descricao` text NOT NULL,
  `preco` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome_produto`, `descricao`, `preco`) VALUES
(6, 'cafe', 'pacote de café', 7.00);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `cadastro`
--
ALTER TABLE `cadastro`
  ADD UNIQUE KEY `nome_usuario` (`nome_usuario`),
  ADD UNIQUE KEY `email` (`email`) USING BTREE;

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices de tabela `endereco_entrega`
--
ALTER TABLE `endereco_entrega`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `endereco_entrega`
--
ALTER TABLE `endereco_entrega`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `endereco_entrega`
--
ALTER TABLE `endereco_entrega`
  ADD CONSTRAINT `endereco_entrega_ibfk_1` FOREIGN KEY (`email`) REFERENCES `cadastro` (`email`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
