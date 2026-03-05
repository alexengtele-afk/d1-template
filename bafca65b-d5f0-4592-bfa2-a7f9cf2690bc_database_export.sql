-- Database export from project: bafca65b-d5f0-4592-bfa2-a7f9cf2690bc
-- Database name: bafca65b-d5f0-4592-bfa2-a7f9cf2690bc-db
-- Exported at: 2026-03-05T10:58:06.513169+00:00

-- Table: usuarios
DROP TABLE IF EXISTS "usuarios";
CREATE TABLE usuarios (
  id TEXT PRIMARY KEY,
  nome TEXT ,
  email TEXT ,
  senha_hash TEXT ,
  tipo TEXT ,
  status TEXT ,
  foto_url TEXT ,
  tentativas_login REAL ,
  ultimo_login DATETIME ,
  criado_em DATETIME ,
  criado_por TEXT ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: equipamentos
DROP TABLE IF EXISTS "equipamentos";
CREATE TABLE equipamentos (
  id TEXT PRIMARY KEY,
  ordem_servico TEXT ,
  data_entrada DATETIME ,
  status TEXT ,
  cliente_id TEXT ,
  modelo TEXT ,
  serial TEXT ,
  nf_venda TEXT ,
  fornecedor TEXT ,
  nf_entrada TEXT ,
  lacre_ok TEXT ,
  acessorios TEXT ,
  acessorios_descricao TEXT ,
  garantia_fiscal TEXT ,
  garantia_validade DATETIME ,
  defeito_informado TEXT ,
  criado_por TEXT ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: avaliacoes_tecnicas
DROP TABLE IF EXISTS "avaliacoes_tecnicas";
CREATE TABLE avaliacoes_tecnicas (
  id TEXT PRIMARY KEY,
  equipamento_id TEXT ,
  defeito_constatado TEXT ,
  acao_realizada TEXT ,
  avaliacao_tecnica TEXT ,
  componente_garantia TEXT ,
  componente_orcamento TEXT ,
  responsavel TEXT ,
  conselho_classe TEXT ,
  assinatura TEXT ,
  data_avaliacao DATETIME ,
  criado_por TEXT ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: orcamentos
DROP TABLE IF EXISTS "orcamentos";
CREATE TABLE orcamentos (
  id TEXT PRIMARY KEY,
  numero_orcamento TEXT ,
  equipamento_id TEXT ,
  itens TEXT ,
  total_pecas REAL ,
  mao_obra REAL ,
  valor_total REAL ,
  status TEXT ,
  observacoes TEXT ,
  data_aprovacao DATETIME ,
  aprovado_por TEXT ,
  criado_por TEXT ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: saidas
DROP TABLE IF EXISTS "saidas";
CREATE TABLE saidas (
  id TEXT PRIMARY KEY,
  equipamento_id TEXT ,
  data_saida DATETIME ,
  nf_retorno TEXT ,
  observacoes TEXT ,
  entregue_para TEXT ,
  documento_retirada TEXT ,
  criado_por TEXT ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: pecas
DROP TABLE IF EXISTS "pecas";
CREATE TABLE pecas (
  id TEXT PRIMARY KEY,
  codigo TEXT ,
  descricao TEXT ,
  preco_venda REAL ,
  ativo TEXT ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: pecas_v2
DROP TABLE IF EXISTS "pecas_v2";
CREATE TABLE pecas_v2 (
  id TEXT PRIMARY KEY,
  codigo TEXT ,
  descricao TEXT ,
  preco_venda REAL ,
  ativo TEXT ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: servicos
DROP TABLE IF EXISTS "servicos";
CREATE TABLE servicos (
  id TEXT PRIMARY KEY,
  tipo_servico TEXT ,
  preco REAL ,
  ativo TEXT ,
  created_at DATETIME ,
  updated_at DATETIME 
);

-- Table: clientes
DROP TABLE IF EXISTS "clientes";
CREATE TABLE clientes (
  id TEXT PRIMARY KEY,
  cnpj TEXT ,
  razao_social TEXT ,
  nome_fantasia TEXT ,
  telefone TEXT ,
  email TEXT ,
  cep TEXT ,
  logradouro TEXT ,
  numero TEXT ,
  complemento TEXT ,
  bairro TEXT ,
  cidade TEXT ,
  estado TEXT ,
  criado_por TEXT ,
  portal_ativo BOOLEAN ,
  portal_senha TEXT ,
  portal_primeiro_acesso BOOLEAN ,
  notificar_email BOOLEAN ,
  notificar_whatsapp BOOLEAN ,
  portal_ultimo_acesso DATETIME ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: modelos
DROP TABLE IF EXISTS "modelos";
CREATE TABLE modelos (
  id TEXT PRIMARY KEY,
  tipo TEXT ,
  modelo TEXT ,
  faixa_frequencia TEXT ,
  ativo TEXT ,
  created_at DATETIME ,
  updated_at DATETIME 
);

-- Table: boletos
DROP TABLE IF EXISTS "boletos";
CREATE TABLE boletos (
  id TEXT PRIMARY KEY,
  cliente_id TEXT ,
  cliente_nome TEXT ,
  descricao TEXT ,
  vencimento TEXT ,
  valor REAL ,
  status TEXT ,
  arquivo_nome TEXT ,
  arquivo_base64 TEXT ,
  data_upload DATETIME ,
  usuario_upload TEXT ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: consentimentos_lgpd
DROP TABLE IF EXISTS "consentimentos_lgpd";
CREATE TABLE consentimentos_lgpd (
  id TEXT PRIMARY KEY,
  usuario_id TEXT ,
  tipo TEXT ,
  dados_coletados TEXT ,
  finalidade TEXT ,
  consentimento_dado BOOLEAN ,
  data_consentimento DATETIME ,
  ip_origem TEXT ,
  versao_termo TEXT ,
  revogado BOOLEAN ,
  data_revogacao DATETIME ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: logs_auditoria_lgpd
DROP TABLE IF EXISTS "logs_auditoria_lgpd";
CREATE TABLE logs_auditoria_lgpd (
  id TEXT PRIMARY KEY,
  usuario_id TEXT ,
  acao TEXT ,
  entidade TEXT ,
  entidade_id TEXT ,
  dados_anteriores TEXT ,
  dados_novos TEXT ,
  ip_origem TEXT ,
  user_agent TEXT ,
  data_hora DATETIME ,
  justificativa TEXT ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: solicitacoes_exclusao
DROP TABLE IF EXISTS "solicitacoes_exclusao";
CREATE TABLE solicitacoes_exclusao (
  id TEXT PRIMARY KEY,
  usuario_id TEXT ,
  data_solicitacao DATETIME ,
  status TEXT ,
  data_conclusao DATETIME ,
  responsavel TEXT ,
  observacoes TEXT ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- Table: incidentes_seguranca_lgpd
DROP TABLE IF EXISTS "incidentes_seguranca_lgpd";
CREATE TABLE incidentes_seguranca_lgpd (
  id TEXT PRIMARY KEY,
  tipo TEXT ,
  gravidade TEXT ,
  descricao TEXT ,
  dados_afetados TEXT ,
  usuarios_afetados REAL ,
  data_ocorrencia DATETIME ,
  data_deteccao DATETIME ,
  data_notificacao_anpd DATETIME ,
  status TEXT ,
  acoes_tomadas TEXT ,
  responsavel_registro TEXT ,
  notificado_anpd BOOLEAN ,
  notificado_titulares BOOLEAN ,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
