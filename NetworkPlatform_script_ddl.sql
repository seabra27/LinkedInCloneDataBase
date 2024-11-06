-- Script de criação do banco de dados para plataforma estilo LinkedIn
-- Desenvolvido com MySQL Workbench
-- Criação do banco de dados

CREATE DATABASE ProfessionalNetworkDB;
USE ProfessionalNetworkDB;

-- Tabela de Membros
CREATE TABLE Membros (
    membro_id INT AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(150) NOT NULL,
    email_profissional VARCHAR(150) UNIQUE NOT NULL,
    data_de_nascimento DATE,
    cidade VARCHAR(100),
    pais VARCHAR(100),
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    biografia TEXT
);

-- Índices adicionais para otimizar consultas
CREATE INDEX idx_membros_email ON Membros(email_profissional);
CREATE INDEX idx_membros_nome ON Membros(nome_completo);

-- Tabela de Histórico Profissional
CREATE TABLE HistoricoProfissional (
    hist_prof_id INT AUTO_INCREMENT PRIMARY KEY,
    membro_id INT,
    titulo_profissional VARCHAR(120),
    empresa_nome VARCHAR(120),
    setor_empresa VARCHAR(100),
    local_trabalho VARCHAR(100),
    data_inicio DATE,
    data_termino DATE,
    descricao_experiencia TEXT,
    FOREIGN KEY (membro_id) REFERENCES Membros(membro_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Índice para otimizar consultas por membro
CREATE INDEX idx_historico_membro ON HistoricoProfissional(membro_id);

-- Tabela de Formação Acadêmica
CREATE TABLE FormacaoAcademica (
    formacao_id INT AUTO_INCREMENT PRIMARY KEY,
    membro_id INT,
    nome_instituicao VARCHAR(150),
    nivel_curso VARCHAR(100),
    especializacao VARCHAR(100),
    data_inicio DATE,
    data_termino DATE,
    descricao_curso TEXT,
    FOREIGN KEY (membro_id) REFERENCES Membros(membro_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Índice para otimizar consultas por membro
CREATE INDEX idx_formacao_membro ON FormacaoAcademica(membro_id);

-- Tabela de Habilidades
CREATE TABLE Habilidades (
    habilidade_id INT AUTO_INCREMENT PRIMARY KEY,
    descricao_habilidade VARCHAR(80) NOT NULL UNIQUE
);

-- Índice para otimizar consultas por habilidade
CREATE INDEX idx_habilidades_descricao ON Habilidades(descricao_habilidade);

-- Tabela de Associação: Membros e Habilidades
CREATE TABLE Membro_Habilidade (
    membro_id INT,
    habilidade_id INT,
    nivel_proficiencia ENUM('Básico', 'Intermediário', 'Avançado', 'Especialista') DEFAULT 'Intermediário',
    FOREIGN KEY (membro_id) REFERENCES Membros(membro_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (habilidade_id) REFERENCES Habilidades(habilidade_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (membro_id, habilidade_id)
);

-- Índices para otimizar consultas por membro e habilidade
CREATE INDEX idx_membro_habilidade_membro ON Membro_Habilidade(membro_id);
CREATE INDEX idx_membro_habilidade_habilidade ON Membro_Habilidade(habilidade_id);

-- Tabela de Conexões de Membros
CREATE TABLE Relacionamentos (
    solicitante_id INT,
    receptor_id INT,
    status_relacionamento ENUM('Solicitado', 'Conectado', 'Recusado') DEFAULT 'Solicitado',
    data_interacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (solicitante_id) REFERENCES Membros(membro_id) ON DELETE CASCADE ON UPDATE CASCADE,
    FOREIGN KEY (receptor_id) REFERENCES Membros(membro_id) ON DELETE CASCADE ON UPDATE CASCADE,
    PRIMARY KEY (solicitante_id, receptor_id)
);

--Tabela de Publicações dos membros
CREATE TABLE Publicacoes (
    publicacao_id INT AUTO_INCREMENT PRIMARY KEY,
    membro_id INT,
    titulo VARCHAR(200) NOT NULL,
    conteudo TEXT NOT NULL,
    data_publicacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (membro_id) REFERENCES Membros(membro_id) ON DELETE CASCADE
);

CREATE INDEX idx_publicacao_membro ON Publicacoes(membro_id);

-- Índices para otimizar consultas de relacionamentos
CREATE INDEX idx_relacionamento_solicitante ON Relacionamentos(solicitante_id);
CREATE INDEX idx_relacionamento_receptor ON Relacionamentos(receptor_id);
