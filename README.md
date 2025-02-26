# LinkedInCloneDataBase

## Visão Geral
Este repositório documenta a estrutura do banco de dados do **LinkedInCloneDataBase**, explicando as principais tabelas, suas funções dentro da plataforma e as decisões tomadas para modelagem dos dados.

## Estrutura do Banco de Dados

### Principais Tabelas e Suas Funções
As principais tabelas criadas foram projetadas para suportar as funcionalidades essenciais da plataforma:

- **Membros**: Armazena os perfis dos usuários, incluindo nome, e-mail, localização, data de registro e biografia.
- **HistoricoProfissional**: Guarda informações sobre as experiências profissionais dos usuários, como cargos, empresas e descrições das experiências.
- **FormacaoAcademica**: Contém dados educacionais, incluindo instituição de ensino, curso e especialização.
- **Habilidades**: Lista as competências dos membros, como "Programação" e "Comunicação".
- **Membro_Habilidade**: Garante o relacionamento muitos-para-muitos entre membros e habilidades, registrando também o nível de proficiência.
- **Relacionamentos**: Armazena conexões entre membros, permitindo interações e networking.
- **Publicacoes**: Registra postagens dos usuários, promovendo compartilhamento de conteúdo e interação.

### Chaves Primárias e Estrangeiras
Foram definidas chaves primárias (PRIMARY KEY) e estrangeiras (FOREIGN KEY) para garantir a integridade e as associações corretas entre as tabelas:
- **Chaves Primárias**: Definidas como AUTO_INCREMENT para garantir identificadores únicos (ex.: `membro_id`, `habilidade_id`).
- **Chaves Estrangeiras**:
  - `membro_id` em **HistoricoProfissional** e **FormacaoAcademica** referencia `membro_id` em **Membros**.
  - `solicitante_id` e `receptor_id` em **Relacionamentos** referenciam `membro_id` em **Membros**.
  - `membro_id` e `habilidade_id` em **Membro_Habilidade** criam a relação entre Membros e Habilidades.

### Tipos de Dados Utilizados
Cada tipo de dado foi escolhido para otimizar armazenamento e performance:
- **VARCHAR**: Para texto de tamanho variável (ex.: `nome_completo`, `email_profissional`).
- **DATE**: Para datas (ex.: `data_de_nascimento`, `data_inicio`).
- **TIMESTAMP**: Para registrar data e hora de eventos (ex.: `data_registro`, `data_interacao`).
- **TEXT**: Para descrições longas (ex.: `biografia`, `descricao_experiencia`).
- **ENUM**: Para valores predefinidos (ex.: `nivel_proficiencia`, `status_relacionamento`).

### Tratamento de Relacionamentos Muitos-para-Muitos
Para modelar corretamente relações muitos-para-muitos:
- **Membro_Habilidade** relaciona Membros e Habilidades, com `membro_id` e `habilidade_id` como chaves estrangeiras.
- A coluna `nivel_proficiencia` permite registrar o grau de conhecimento de cada habilidade por um membro.

### Uso de Constraints
As constraints garantem consistência e integridade dos dados:
- **UNIQUE**: Aplicada a `email_profissional` para evitar duplicidade de contas.
- **PRIMARY KEY**: Define identificadores únicos para cada registro.
- **FOREIGN KEY**: Mantém referências consistentes entre tabelas.
- **ENUM**: Restringe valores permitidos em `nivel_proficiencia` e `status_relacionamento`.
- **ON DELETE/ON UPDATE CASCADE**: Propaga alterações e exclusões corretamente entre tabelas relacionadas.

### Índices Criados e Otimização de Consultas
Para melhorar o desempenho das consultas, foram criados índices nos campos mais utilizados:
- **Índices em Pesquisa**: `email_profissional` e `nome_completo` em **Membros**, para buscas rápidas.
- **Índices em Relacionamentos**: `membro_id` em **HistoricoProfissional**, **FormacaoAcademica**, **Membro_Habilidade** e **Relacionamentos**, otimizando consultas que envolvem dados vinculados a um membro.

## Conclusão
A estrutura do banco de dados foi projetada para garantir desempenho, escalabilidade e integridade dos dados, proporcionando uma base sólida para a plataforma **LinkedInCloneDataBase**.
