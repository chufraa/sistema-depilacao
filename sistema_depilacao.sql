-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 11/11/2026 às 18:16
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `sistema_depilacao`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `agenda`
--

CREATE TABLE `agenda` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  `data_hora` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` varchar(50) DEFAULT 'Agendado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `agenda`
--

INSERT INTO `agenda` (`id`, `cliente_id`, `servico_id`, `data_hora`, `created_at`, `status`) VALUES
(1, 1, 37, '2026-11-11 15:09:00', '2026-11-11 13:04:48', 'Agendado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamentos`
--

CREATE TABLE `agendamentos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `profissional_id` int(11) NOT NULL,
  `servico_id` int(11) NOT NULL,
  `data_horario` datetime NOT NULL,
  `status` enum('agendado','confirmado','concluido','cancelado') DEFAULT 'agendado',
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `agendamento_produtos`
--

CREATE TABLE `agendamento_produtos` (
  `id` int(11) NOT NULL,
  `agendamento_id` int(11) NOT NULL,
  `produto_id` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `caixa`
--

CREATE TABLE `caixa` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `data_abertura` datetime NOT NULL,
  `data_fechamento` datetime DEFAULT NULL,
  `valor_inicial` decimal(10,2) NOT NULL DEFAULT 0.00,
  `valor_final_dinheiro` decimal(10,2) DEFAULT NULL,
  `valor_final_pix` decimal(10,2) DEFAULT NULL,
  `valor_final_cartao` decimal(10,2) DEFAULT NULL,
  `status` enum('aberto','fechado') DEFAULT 'aberto',
  `observacoes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `cpf` varchar(14) DEFAULT NULL,
  `data_nascimento` date DEFAULT NULL,
  `anamnese` text DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `clientes`
--

INSERT INTO `clientes` (`id`, `nome`, `telefone`, `cpf`, `data_nascimento`, `anamnese`, `criado_em`) VALUES
(1, 'Ana Paula Souza', '(11) 98765-4321', '244.987.857-52', '2000-05-31', 'Cliente Fidelidade', '2026-11-11 10:55:49'),
(2, 'Beatriz Lima', '(11) 97654-3210', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(3, 'Camila Ribeiro', '(11) 96543-2109', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(4, 'Daniela Martins', '(11) 95432-1098', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(5, 'Eduarda Carvalho', '(11) 94321-0987', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(6, 'Fernanda Alves', '(11) 93210-9876', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(7, 'Gabriela Rocha', '(11) 92109-8765', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(8, 'Helena Dias', '(11) 91098-7654', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(9, 'Isabela Mendes', '(11) 90987-6543', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(10, 'Jéssica Castro', '(11) 99887-7665', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(11, 'Larissa Farias', '(11) 98776-6554', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(12, 'Mariana Gomes', '(11) 97665-5443', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(13, 'Natália Azevedo', '(11) 96554-4332', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(14, 'Patrícia Ramos', '(11) 95443-3221', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(15, 'Rafaela Cardoso', '(11) 94332-2110', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(16, 'Sabrina Nogueira', '(11) 93221-1009', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(17, 'Tatiane Moreira', '(11) 92110-0998', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(18, 'Vanessa Correia', '(11) 91009-9887', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(19, 'Juliana Pires', '(11) 90998-8776', NULL, NULL, NULL, '2026-11-11 10:55:49'),
(20, 'Camila Queiroz', '(11) 99888-7777', NULL, NULL, NULL, '2026-11-11 10:55:49');

-- --------------------------------------------------------

--
-- Estrutura para tabela `financeiro`
--

CREATE TABLE `financeiro` (
  `id` int(11) NOT NULL,
  `tipo` enum('receita','despesa') NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `forma_pagamento` enum('dinheiro','pix','cartao_credito','cartao_debito','transferencia') NOT NULL,
  `agendamento_id` int(11) DEFAULT NULL,
  `categoria` varchar(50) DEFAULT NULL,
  `data_vencimento` date NOT NULL,
  `data_pagamento` date DEFAULT NULL,
  `status` enum('pendente','pago') DEFAULT 'pago',
  `data_lancamento` date DEFAULT NULL,
  `status_pagamento` varchar(20) DEFAULT 'Pago'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `financeiro`
--

INSERT INTO `financeiro` (`id`, `tipo`, `descricao`, `valor`, `forma_pagamento`, `agendamento_id`, `categoria`, `data_vencimento`, `data_pagamento`, `status`, `data_lancamento`, `status_pagamento`) VALUES
(4, '', 'Venda PDV - 1 item(ns) [Pgto: Pix]', 18.90, 'dinheiro', NULL, NULL, '0000-00-00', NULL, 'pago', '2026-11-11', 'Pago'),
(5, '', 'Venda PDV - 1 item(ns) [Pgto: Pix]', 18.90, 'dinheiro', NULL, NULL, '0000-00-00', NULL, 'pago', '2026-11-11', 'Pago'),
(6, '', 'Venda PDV - 1 item(ns) [Cliente: Beatriz Lima] [Pgto: Pix]', 52.00, 'dinheiro', NULL, NULL, '0000-00-00', NULL, 'pago', '2026-11-11', 'Pago'),
(9, '', 'Venda PDV - 1 item(ns) [Cliente: Daniela Martins] [Pgto: Pix]', 100.00, 'dinheiro', NULL, NULL, '0000-00-00', NULL, 'pago', '2026-11-11', 'Pago'),
(10, '', 'Conta de Luz', 100.00, 'dinheiro', NULL, NULL, '0000-00-00', NULL, 'pago', '2026-11-11', 'Pendente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedores`
--

CREATE TABLE `fornecedores` (
  `id` int(11) NOT NULL,
  `nome_empresa` varchar(150) NOT NULL,
  `contato_nome` varchar(100) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cnpj` varchar(20) DEFAULT NULL,
  `observacoes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `fornecedores`
--

INSERT INTO `fornecedores` (`id`, `nome_empresa`, `contato_nome`, `telefone`, `email`, `cnpj`, `observacoes`, `created_at`) VALUES
(1, 'Ceras Mozer & Cia', 'Roberto Vendas', '(11) 98888-1111', 'contato@cerasmozer.com', '12.345.678/0001-01', 'Fornecedor principal de cera quente.', '2026-11-11 14:46:28'),
(2, 'Bella Depil Distribuidora', 'Mariana Souza', '(11) 97777-2222', 'vendas@belladepil.com', '23.456.789/0001-02', 'Papel depilatório e espátulas.', '2026-11-11 14:46:28'),
(3, 'Global Descartáveis Ltda', 'Carlos Eduardo', '(21) 96666-3333', 'comercial@globaldesc.com', '34.567.890/0001-03', 'Luvas, lençóis e toucas.', '2026-11-11 14:46:28'),
(4, 'Essência & Pele Cosméticos', 'Ana Paula', '(31) 95555-4444', 'contato@essenciaepele.com', '45.678.901/0001-04', 'Óleos pós-depilatórios e hidratantes.', '2026-11-11 14:46:28'),
(5, 'Alpha Suprimentos Salão', 'Marcos Vinicius', '(21) 94444-5555', 'atendimento@alphasuprimentos.com', '56.789.012/0001-05', 'Maca e móveis para estética.', '2026-11-11 14:46:28'),
(6, 'Bio Purity Cosméticos', 'Juliana Lima', '(51) 93333-6666', 'vendas@biopurity.com', '67.890.123/0001-06', 'Esfoliantes corporais.', '2026-11-11 14:46:28'),
(7, 'Derma Clean Indústria', 'Fernando Dias', '(61) 92222-7777', 'contato@dermaclean.com', '78.901.234/0001-07', 'Gel calmante pós-depilação.', '2026-11-11 14:46:28'),
(8, 'New Style Embalagens', 'Patrícia Rocha', '(71) 91111-8888', 'comercial@newstyle.com', '89.012.345/0001-08', 'Embalagens e sacolas personalizadas.', '2026-11-11 14:46:28'),
(9, 'Sanitária Distribuidora', 'Lucas Mendes', '(81) 90000-9999', 'vendas@sanitaria.com', '90.123.456/0001-09', 'Produtos de esterilização e álcool.', '2026-11-11 14:46:28'),
(10, 'Stetic Pro Equipamentos', 'Camila Duarte', '(31) 98765-1234', 'contato@steticpro.com', '01.234.567/0001-10', 'Aparelhos de termocera e acessórios.', '2026-11-11 14:46:28'),
(11, 'Naturalis Essências', 'Bruno Silveira', '(11) 97654-2341', 'atendimento@naturalis.com', '11.223.344/0001-11', 'Essências para o ambiente do salão.', '2026-11-11 14:46:28'),
(12, 'Prime Distribuidora Beauty', 'Tatiane Souza', '(19) 96543-3452', 'vendas@primebeauty.com', '22.334.455/0001-12', 'Linha completa de depilação.', '2026-11-11 14:46:28'),
(13, 'Clean Express Produtos', 'Diego Ramos', '(27) 95432-4563', 'contato@cleanexpress.com', '33.445.566/0001-13', 'Produtos de limpeza pesada para o espaço.', '2026-11-11 14:46:28'),
(14, 'Gold Estética Atacado', 'Vanessa Costa', '(48) 94321-5674', 'comercial@goldestetica.com', '44.556.677/0001-14', 'Suprimentos gerais.', '2026-11-11 14:46:28'),
(15, 'Master Ceras e Afins', 'Eduardo Lima', '(62) 93210-6785', 'vendas@masterceras.com', '55.667.788/0001-15', 'Cera roll-on e refis.', '2026-11-11 14:46:28'),
(16, 'Valverde Suprimentos', 'Renata Farias', '(85) 92109-7896', 'contato@valverde.com', '66.778.899/0001-16', 'Toalhas descartáveis.', '2026-11-11 14:46:28'),
(17, 'Harmony Cosméticos', 'Gustavo Henrique', '(92) 91098-8907', 'vendas@harmonycosmeticos.com', '77.889.900/0001-17', 'Loções adstringentes.', '2026-11-11 14:46:28'),
(18, 'Quality Descartáveis', 'Larissa Martins', '(32) 90987-9018', 'atendimento@qualitydesc.com', '88.990.011/0001-18', 'Máscaras e toucas TNT.', '2026-11-11 14:46:28'),
(19, 'Pele Dourada Produtos', 'Rodrigo Alves', '(34) 99876-0129', 'contato@peledourada.com', '99.001.122/0001-19', 'Argilas e produtos de tratamento.', '2026-11-11 14:46:28'),
(20, 'Omega Comercial Estética', 'Beatriz Castro', '(35) 98765-1230', 'comercial@omegarestetica.com', '00.112.233/0001-20', 'Equipamentos e acessórios profissionais.', '2026-11-11 14:46:28');

-- --------------------------------------------------------

--
-- Estrutura para tabela `produtos`
--

CREATE TABLE `produtos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `quantidade_estoque` int(11) NOT NULL DEFAULT 0,
  `estoque_minimo` int(11) DEFAULT 5,
  `preco_custo` decimal(10,2) NOT NULL,
  `preco_venda` decimal(10,2) DEFAULT 0.00,
  `imagem` varchar(255) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `produtos`
--

INSERT INTO `produtos` (`id`, `nome`, `tipo`, `quantidade_estoque`, `estoque_minimo`, `preco_custo`, `preco_venda`, `imagem`, `foto`) VALUES
(1, 'Depilação Perna Inteira', '', 0, 5, 0.00, 90.00, NULL, NULL),
(2, 'Depilação Meia Perna', '', 0, 5, 0.00, 55.00, NULL, NULL),
(3, 'Depilação Virilha Completa', '', 0, 5, 0.00, 80.00, NULL, NULL),
(4, 'Depilação Virilha Simples', '', 0, 5, 0.00, 50.00, NULL, NULL),
(5, 'Depilação Virilha com Ânus', '', 0, 5, 0.00, 95.00, NULL, NULL),
(6, 'Depilação Axilas', '', 0, 5, 0.00, 35.00, NULL, NULL),
(7, 'Depilação Braços Inteiros', '', 0, 5, 0.00, 60.00, NULL, NULL),
(8, 'Depilação Antebraço', '', 0, 5, 0.00, 40.00, NULL, NULL),
(9, 'Depilação Buço', '', 0, 5, 0.00, 25.00, NULL, NULL),
(10, 'Depilação Queixo', '', 0, 5, 0.00, 25.00, NULL, NULL),
(11, 'Depilação Rosto Completo', '', 0, 5, 0.00, 70.00, NULL, NULL),
(12, 'Depilação Costas', '', 0, 5, 0.00, 80.00, NULL, NULL),
(13, 'Depilação Peito', '', 0, 5, 0.00, 70.00, NULL, NULL),
(14, 'Depilação Abdômen', '', 0, 5, 0.00, 60.00, NULL, NULL),
(15, 'Depilação Glúteos', '', 0, 5, 0.00, 65.00, NULL, NULL),
(16, 'Depilação Orelha', '', 0, 5, 0.00, 20.00, NULL, NULL),
(17, 'Depilação Nariz', '', 0, 5, 0.00, 20.00, NULL, NULL),
(18, 'Depilação Dedos dos Pés/Mãos', '', 0, 5, 0.00, 20.00, NULL, NULL),
(19, 'Combo Depilação Verão (Perna + Virilha + Axilas)', '', 0, 5, 0.00, 180.00, NULL, NULL),
(20, 'Combo Depilação Completa (Corpo Todo)', '', 0, 5, 0.00, 350.00, NULL, NULL),
(21, 'Design de Sobrancelha com Pinça', '', 0, 5, 0.00, 45.00, NULL, NULL),
(22, 'Design de Sobrancelha com Henna', '', 0, 5, 0.00, 60.00, NULL, NULL),
(23, 'Design de Sobrancelha com Coloração', '', 0, 5, 0.00, 65.00, NULL, NULL),
(24, 'Epilação Facial com Linha (Egípcia)', '', 0, 5, 0.00, 50.00, NULL, NULL),
(25, 'Lash Lifting (Cílios)', '', 0, 5, 0.00, 120.00, NULL, NULL),
(26, 'Extensão de Cílios Fio a Fio', '', 0, 5, 0.00, 150.00, NULL, NULL),
(27, 'Manutenção de Cílios', '', 0, 5, 0.00, 80.00, NULL, NULL),
(28, 'Brow Lamination (Sobrancelhas)', '', 0, 5, 0.00, 130.00, NULL, NULL),
(29, 'Limpeza de Pele Profunda', '', 0, 5, 0.00, 140.00, NULL, NULL),
(30, 'Peeling de Diamante', '', 0, 5, 0.00, 110.00, NULL, NULL),
(31, 'Hidratação Facial Profunda', '', 0, 5, 0.00, 90.00, NULL, NULL),
(32, 'Argiloterapia Facial', '', 0, 5, 0.00, 75.00, NULL, NULL),
(33, 'Massagem Modeladora (Sessão)', '', 0, 5, 0.00, 100.00, NULL, NULL),
(34, 'Drenagem Linfática Manual (Sessão)', '', 0, 5, 0.00, 110.00, NULL, NULL),
(35, 'Massagem Relaxante (Sessão)', '', 0, 5, 0.00, 120.00, NULL, NULL),
(36, 'Esfoliação Corporal Completa', '', 0, 5, 0.00, 130.00, NULL, NULL),
(37, 'Banho de Lua (Descoloração de Pelos)', '', 0, 5, 0.00, 90.00, NULL, NULL),
(38, 'Clareamento de Virilha e Axilas (Sessão)', '', 0, 5, 0.00, 150.00, NULL, NULL),
(39, 'Pacote 5 Sessões Depilação Axilas', '', 0, 5, 0.00, 150.00, NULL, NULL),
(40, 'Pacote 5 Sessões Virilha Completa', '', 0, 5, 0.00, 350.00, NULL, NULL),
(41, 'Creme Hidratante Pós-Depilação 200ml', '', 25, 5, 0.00, 45.00, NULL, NULL),
(42, 'Gel Calmante Camomila e Aloe Vera 150g', '', 30, 5, 0.00, 38.00, NULL, NULL),
(43, 'Esfoliante Corporal de Café 250g', '', 20, 5, 0.00, 55.00, NULL, NULL),
(44, 'Esfoliante Corporal de Maracujá 250g', '', 15, 5, 0.00, 55.00, NULL, NULL),
(45, 'Óleo Preenchedor e Hidratante Corporal', '', 18, 5, 0.00, 65.00, NULL, NULL),
(46, 'Loção Retardadora de Crescimento de Pelos', '', 12, 5, 0.00, 75.00, NULL, NULL),
(47, 'Creme Antifoliculite e Pelos Encravados', '', 25, 5, 0.00, 60.00, NULL, NULL),
(48, 'Desodorante Roll-on Sensitive Sem Álcool', '', 40, 5, 0.00, 28.00, NULL, NULL),
(49, 'Protetor Solar Corporal FPS 50 200ml', '', 15, 5, 0.00, 79.90, NULL, NULL),
(50, 'Protetor Solar Facial Toque Seco FPS 60', '', 20, 5, 0.00, 69.90, NULL, NULL),
(51, 'Água Termal Calmante 150ml', '', 14, 5, 0.00, 52.00, NULL, NULL),
(52, 'Sérum Facial Vitamina C 30ml', '', 10, 5, 0.00, 89.90, NULL, NULL),
(53, 'Espuma de Limpeza Facial Suave', '', 18, 5, 0.00, 48.00, NULL, NULL),
(54, 'Máscara Facial de Hidratação Noturna', '', 12, 5, 0.00, 54.00, NULL, NULL),
(55, 'Kit Skincare Básica (Espuma + Hidratante)', '', 8, 5, 0.00, 95.00, NULL, NULL),
(56, 'Kit Cuidados Pós-Depilação (Gel + Esfoliante)', '', 15, 5, 0.00, 85.00, NULL, NULL),
(57, 'Cera Roll-on Mel 100g', '', 50, 5, 0.00, 12.00, NULL, NULL),
(58, 'Cera Roll-on Algas 100g', '', 40, 5, 0.00, 12.00, NULL, NULL),
(59, 'Cera Roll-on Chocolate Branco 100g', '', 35, 5, 0.00, 14.00, NULL, NULL),
(60, 'Cera Roll-on Morango 100g', '', 30, 5, 0.00, 14.00, NULL, NULL),
(61, 'Refil TNT para Depilação (Pacote com 50)', '', 60, 5, 0.00, 18.00, NULL, NULL),
(62, 'Pinça Profissionalço Inox Biselada', '', 20, 5, 0.00, 25.00, NULL, NULL),
(63, 'Tesourinha para Sobrancelha Inox', '', 15, 5, 0.00, 22.00, NULL, NULL),
(64, 'Paquímetro para Design de Sobrancelha', '', 12, 5, 0.00, 19.90, NULL, NULL),
(65, 'Henna para Sobrancelha Castanho Escuro', '', 10, 5, 0.00, 35.00, NULL, NULL),
(66, 'Henna para Sobrancelha Castanho Claro', '', 10, 5, 0.00, 35.00, NULL, NULL),
(67, 'Fixador para Henna 15ml', '', 15, 5, 0.00, 15.00, NULL, NULL),
(68, 'Escovinhas Descartáveis para Cílios (50 un)', '', 25, 5, 0.00, 20.00, NULL, NULL),
(69, 'Microbrush Descartável para Estética (100 un)', '', 20, 5, 0.00, 22.00, NULL, NULL),
(70, 'Touca Descartável Sanfonada (Pacote 100 un)', '', 30, 5, 0.00, 25.00, NULL, NULL),
(71, 'Máscara Descartável Tripla (Pacote 50 un)', '', 25, 5, 0.00, 20.00, NULL, NULL),
(72, 'Luvas de Procedimento em Látex (Caixa 100 un)', '', 20, 5, 0.00, 45.00, NULL, NULL),
(73, 'Lençol de Papel Hospitalar Descartável (Rolo)', '', 15, 5, 0.00, 32.00, NULL, NULL),
(74, 'Papel Toalha Interfolha (Fardo com 1000)', '', 10, 5, 0.00, 28.00, NULL, NULL),
(75, 'Álcool 70% Antisséptico 1 Litro', '', 20, 5, 0.00, 18.90, NULL, NULL),
(76, 'Sabonete Líquido Antisséptico 1 Litro', '', 12, 5, 0.00, 35.00, NULL, NULL),
(77, 'Acetona Removedora Suave 500ml', '', 15, 5, 0.00, 14.00, NULL, NULL),
(78, 'Algodão Hidrófilo 500g', '', 18, 5, 0.00, 24.00, NULL, NULL),
(79, 'Hastes Flexíveis de Algodão (Caixa 300 un)', '', 30, 5, 0.00, 10.00, NULL, NULL),
(80, 'Espátula de Madeira para Cera (Pacote 100 un)', '', 25, 5, 0.00, 12.00, NULL, NULL),
(81, 'Pote Dappen de Vidro para Estética', '', 10, 5, 0.00, 15.00, NULL, NULL),
(82, 'Pinça Reta Profissional', '', 15, 5, 0.00, 22.00, NULL, NULL),
(83, 'Creme Hidratante para as Mãos 60g', '', 25, 5, 0.00, 20.00, NULL, NULL),
(84, 'Creme Hidratante para os Pés 60g', '', 25, 5, 0.00, 22.00, NULL, NULL),
(85, 'Esponja Elétrica de Limpeza Facial', '', 10, 5, 0.00, 45.00, NULL, NULL),
(86, 'Gua Sha de Quartzo Rosa para Massagem', '', 12, 5, 0.00, 38.00, NULL, NULL),
(87, 'Roller Facial de Jade', '', 10, 5, 0.00, 42.00, NULL, NULL),
(88, 'Faixa Cabelo para Maquiagem/Skincare', '', 30, 5, 0.00, 15.00, NULL, NULL),
(89, 'Necessaire Exclusiva Fernanda Mozer', '', 20, 5, 0.00, 35.00, NULL, NULL),
(90, 'Vela Aromática Relaxante para Ambiente', '', 15, 5, 0.00, 49.00, NULL, NULL),
(91, 'Incensos Artesanais Calmantes (Caixa)', '', 20, 5, 0.00, 18.00, NULL, NULL),
(92, 'Chá Relaxante Natural Sabor Camomila (Caixa)', '', 25, 5, 0.00, 16.00, NULL, NULL),
(93, 'Esponja Konjac Natural para Limpeza Facial', '', 14, 5, 0.00, 26.00, NULL, NULL),
(94, 'Sais de Banho Esfoliantes 300g', '', 12, 5, 0.00, 42.00, NULL, NULL),
(95, 'Bombas Efervescentes para Escalda-Pés (Unidade)', '', 30, 5, 0.00, 12.00, NULL, NULL),
(96, 'Óleo Essencial de Lavanda 10ml', '', 15, 5, 0.00, 35.00, NULL, NULL),
(97, 'Óleo Essencial de Melaleuca (Tea Tree) 10ml', '', 15, 5, 0.00, 38.00, NULL, NULL),
(98, 'Difusor de Aromas para Sala de Espera', 'Serviço', 8, 5, 0.00, 79.90, NULL, NULL),
(99, 'Refil para Difusor de Ambientes 250ml', 'Serviço', 12, 5, 0.00, 45.00, NULL, NULL),
(100, 'Cartão Presente (Vale-Depilação R$ 100)', 'Serviço', 49, 5, 0.00, 100.00, NULL, 'prod_1794396115.jpg');

-- --------------------------------------------------------

--
-- Estrutura para tabela `servicos`
--

CREATE TABLE `servicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `descricao` text DEFAULT NULL,
  `preco` decimal(10,2) NOT NULL,
  `duracao_minutos` int(11) DEFAULT 30,
  `comissao_porcentagem` decimal(5,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `nivel` enum('admin','recepcao','profissional') DEFAULT 'admin',
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `senha`, `nivel`, `criado_em`) VALUES
(3, 'Administrador', 'admin@admin.com', '123456', 'admin', '2026-11-11 09:50:47');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `agenda`
--
ALTER TABLE `agenda`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente_id` (`cliente_id`),
  ADD KEY `profissional_id` (`profissional_id`),
  ADD KEY `servico_id` (`servico_id`);

--
-- Índices de tabela `agendamento_produtos`
--
ALTER TABLE `agendamento_produtos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agendamento_id` (`agendamento_id`),
  ADD KEY `produto_id` (`produto_id`);

--
-- Índices de tabela `caixa`
--
ALTER TABLE `caixa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `financeiro`
--
ALTER TABLE `financeiro`
  ADD PRIMARY KEY (`id`),
  ADD KEY `agendamento_id` (`agendamento_id`);

--
-- Índices de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `produtos`
--
ALTER TABLE `produtos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `servicos`
--
ALTER TABLE `servicos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `agenda`
--
ALTER TABLE `agenda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `agendamentos`
--
ALTER TABLE `agendamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `agendamento_produtos`
--
ALTER TABLE `agendamento_produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `caixa`
--
ALTER TABLE `caixa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `financeiro`
--
ALTER TABLE `financeiro`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `fornecedores`
--
ALTER TABLE `fornecedores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `produtos`
--
ALTER TABLE `produtos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de tabela `servicos`
--
ALTER TABLE `servicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `agendamentos`
--
ALTER TABLE `agendamentos`
  ADD CONSTRAINT `agendamentos_ibfk_1` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`),
  ADD CONSTRAINT `agendamentos_ibfk_2` FOREIGN KEY (`profissional_id`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `agendamentos_ibfk_3` FOREIGN KEY (`servico_id`) REFERENCES `servicos` (`id`);

--
-- Restrições para tabelas `agendamento_produtos`
--
ALTER TABLE `agendamento_produtos`
  ADD CONSTRAINT `agendamento_produtos_ibfk_1` FOREIGN KEY (`agendamento_id`) REFERENCES `agendamentos` (`id`),
  ADD CONSTRAINT `agendamento_produtos_ibfk_2` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`id`);

--
-- Restrições para tabelas `caixa`
--
ALTER TABLE `caixa`
  ADD CONSTRAINT `caixa_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);

--
-- Restrições para tabelas `financeiro`
--
ALTER TABLE `financeiro`
  ADD CONSTRAINT `financeiro_ibfk_1` FOREIGN KEY (`agendamento_id`) REFERENCES `agendamentos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
