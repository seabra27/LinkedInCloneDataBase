# LinkedInCloneDataBase

Quais foram as principais tabelas criadas no banco de dados e quais 
são suas funções dentro da plataforma?

- As principais tabelas que criei são essenciais para o funcionamento da plataforma e para representar
suas principais entidades. A tabela Membros contém os perfis dos usuários, armazenando dados 
pessoais como nome, e-mail, localização, data de registro e biografia. Essa tabela é central no banco
de dados, pois registra as informações essenciais de cada usuário. A tabela HistoricoProfissional
armazena o histórico de empregos dos usuários, incluindo detalhes sobre cargos, empresas, locais 
de trabalho e descrições das experiências, facilitando o acompanhamento das trajetórias 
profissionais. A tabela FormacaoAcademica guarda as informações educacionais dos membros, 
como instituição, curso e especialização, permitindo que os usuários registrem suas qualificações 
acadêmicas. A tabela Habilidades lista as competências que podem ser associadas aos membros, 
como "Programação" e "Comunicação". Para tratar o relacionamento muitos-para-muitos entre 
membros e habilidades, criei a tabela Membro_Habilidade, que conecta cada membro a suas 
habilidades, registrando ainda o nível de proficiência em cada uma. A tabela Relacionamentos
armazena as conexões entre membros, permitindo que a plataforma funcione como uma rede social 
onde os usuários podem estabelecer contatos profissionais. Além disso, a tabela Publicacoes
permite que os membros compartilhem conteúdos e atualizações profissionais, registrando 
publicações com título, conteúdo e data de publicação, promovendo a interação e troca de 
conhecimentos entre os usuários. 

Como foram definidas as chaves primárias e estrangeiras nas 
tabelas?

- Defini as chaves primárias e estrangeiras para garantir a integridade e as associações corretas dos 
dados entre as tabelas. As chaves primárias de cada tabela principal, como Membros, 
HistoricoProfissional, FormacaoAcademica e Habilidades, identificam exclusivamente cada 
registro e foram configuradas como colunas AUTO_INCREMENT (ex.: membro_id, hist_prof_id,
formacao_id e habilidade_id), assegurando que cada registro possua um identificador único. Quanto
às chaves estrangeiras, elas estabelecem associações consistentes entre tabelas, ligando as 
informações de experiência profissional, educação e habilidades aos membros correspondentes. Nas
tabelas HistoricoProfissional e FormacaoAcademica, por exemplo, membro_id referencia o 
membro_id na tabela Membros. Na tabela Relacionamentos, as colunas solicitante_id e 
receptor_id referenciam membro_id da tabela Membros, registrando as conexões entre os 
usuários.

Que tipos de dados foram utilizados para armazenar 
informações de perfis de usuários (nome, e-mail, experiências, 
etc.) e por quê?

- Escolhi diferentes tipos de dados para armazenar as informações dos perfis, cada um deles de 
acordo com o tipo de dado a ser representado. Para campos de texto de tamanho variável, como 
nome_completo, email_profissional, cidade, pais, empresa_nome e descricao_habilidade, utilizei o 
tipo VARCHAR, que otimiza o uso de armazenamento. Para datas, como data_de_nascimento, 
data_inicio e data_termino, utilizei o tipo DATE, que facilita operações de filtragem por data e 
cálculos de intervalo. Em data_registro e data_interacao, usei TIMESTAMP, ideal para capturar 
a data e a hora das ações, mantendo um histórico de interações. Em campos como biografia, 
descricao_experiencia e descricao_curso, utilizei TEXT, permitindo textos mais longos para 
descrições. Por fim, em campos como nivel_proficiencia e status_relacionamento, optei por 
ENUM, garantindo consistência nos valores possíveis e prevenindo valores inválidos.

Como foram tratados os relacionamentos muitos-para-muitos, como 
os que podem ocorrer entre "Usuários" e "Competências" 
(skills)?

- Para gerenciar o relacionamento muitos-para-muitos entre membros e habilidades, criei a tabela 
Membro_Habilidade. Essa tabela permite que um membro possua várias habilidades e uma 
habilidade pertença a vários membros. Na tabela Membro_Habilidade, inclui as colunas 
membro_id e habilidade_id como chaves estrangeiras que estabelecem a ligação entre Membros e 
Habilidades. Além disso, adicionei a coluna nivel_proficiencia para registrar o grau de 
competência de cada membro em uma habilidade específica.

Como foram utilizadas as constraints no DDL, qual sua importância e onde foram aplicadas ?

- Utilizei várias constraints para garantir a integridade e consistência dos dados. A 
restrição UNIQUE foi aplicada no campo email_profissional para garantir que cada e-mail seja 
único, evitando duplicidades. As PRIMARY KEY definem as chaves primárias em cada tabela, 
assegurando a exclusividade de cada registro, como membro_id em Membros e habilidade_id em 
Habilidades. As FOREIGN KEY mantêm a integridade referencial entre tabelas relacionadas, 
como membro_id em HistoricoProfissional e FormacaoAcademica, conectando esses dados aos 
membros correspondentes. O ENUM foi utilizado para limitar os valores permitidos em campos 
como nivel_proficiencia e status_relacionamento, assegurando a consistência dos dados e evitando 
entradas inválidas. Por fim, adicionei restrições de integridade referencial com ON DELETE e ON 
UPDATE CASCADE, garantindo que as alterações e exclusões sejam propagadas corretamente 
entre as tabelas relacionadas. 

Quais índices foram criados no banco de dados, como eles 
ajudam a otimizar as consultas e como decidi quais 
índices criar?

- Criei índices para otimizar consultas e melhorar o desempenho da plataforma. Em campos de 
pesquisa frequente, como email_profissional e nome_completo na tabela Membros, os índices 
facilitam buscas mais rápidas. Em colunas de relacionamento, como membro_id nas tabelas 
HistoricoProfissional, FormacaoAcademica, Membro_Habilidade e Relacionamentos, os 
índices aceleram as consultas que buscam dados associados a um membro específico. A decisão de 
criar esses índices baseou-se nos padrões de uso e nas consultas mais comuns esperadas para a 
plataforma, garantindo que as operações de leitura ocorram de forma eficiente.
