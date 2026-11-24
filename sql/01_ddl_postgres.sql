-- DDL corrigido para PostgreSQL

CREATE TABLE public.venda (
 venda_id int8 NOT NULL,
 data_emissao date NOT NULL,
 horariomov varchar(8) DEFAULT '00:00:00'::character varying NOT NULL,
 produto_id varchar(25) DEFAULT ''::character varying NOT NULL,
 qtde_vendida float8 NULL,
 valor_unitario numeric(12, 4) DEFAULT 0 NOT NULL,
 filial_id int8 DEFAULT 1 NOT NULL,
 item int4 DEFAULT 0 NOT NULL,
 unidade_medida varchar(3) NULL,
 CONSTRAINT pk_consumo PRIMARY KEY (filial_id, venda_id, data_emissao, produto_id, item, horariomov));

CREATE TABLE public.pedido_compra (
 pedido_id float8 DEFAULT 0 NOT NULL, 
 data_pedido date NULL, 
 item float8 DEFAULT 0 NOT NULL,
 produto_id varchar(25) DEFAULT '0' NOT NULL, 
 descricao_produto varchar(255) NULL,
 ordem_compra float8 DEFAULT 0 NOT NULL, 
 qtde_pedida float8 NULL, 
 filial_id int4 NULL,
 data_entrega date NULL, 
 qtde_entregue float8 DEFAULT 0 NOT NULL, 
 qtde_pendente float8 DEFAULT 0 NOT NULL,
 preco_compra float8 DEFAULT 0 NULL, 
 fornecedor_id int4 DEFAULT 0 NULL,
 CONSTRAINT pedido_compra_pkey PRIMARY KEY (pedido_id , produto_id, item));


CREATE TABLE public.entradas_mercadoria (
 data_entrada date NULL,
 nro_nfe varchar(255) NOT NULL,
 item float8 DEFAULT 0 NOT NULL,
 produto_id varchar(25) DEFAULT '0' NOT NULL,
 descricao_produto varchar(255) NULL,
 qtde_recebida float8 NULL,
 filial_id int4 NULL,
 custo_unitario numeric(12, 4) DEFAULT 0 NOT NULL,
 ordem_compra float8 default 0 not null,
 CONSTRAINT entradas_mercadoria_pkey PRIMARY KEY (ordem_compra,item, produto_id, nro_nfe));

CREATE TABLE public.produtos_filial (
 filial_id int4 NULL, 
 produto_id varchar(255) NOT NULL, 
 decricao varchar(255) NOT NULL,
 estoque float8 DEFAULT 0 NOT NULL, 
 preco_unitario float8 DEFAULT '0' NOT NULL,
 preco_compra float8 DEFAULT '0' NOT NULL, 
 preco_venda float8 DEFAULT '0' NOT NULL,
 idfonecedor int4 null,
 CONSTRAINT produtos_filial_pkey PRIMARY KEY (filial_id, produto_id));


CREATE TABLE public.fornecedor ( 	
 idforncedor varchar(255) NOT NULL, 
 razao_social varchar(255) NOT NULL,
 produto_id int not null,
 CONSTRAINT fornecedor_pkey PRIMARY KEY (idforncedor, produto_id));

SELECT current_database(), current_schema(); -- comando para verificar o database e o schema conectado

alter table public.fornecedor rename column idforncedor to idfornecedor;

drop column produto_id from public.fornecedor;

alter table public.fornecedor drop constraint fornecedor_pkey;
alter table public.fornecedor add primary key (idfornecedor);

alter table public.fornecedor drop column produto_id;

select * from fornecedor;

alter table public.produtos_filial rename column decricao to descricao;

alter table public.produtos_filial rename column produto_id to idproduto;

alter table public.produtos_filial rename column idfonecedor to idfornecedor;

alter table public.produtos_filial alter column idfornecedor type varchar(255);

select * from produtos_filial;

select * from pedido_compra;

select * from venda;

select * from entradas_mercadoria;

select * from fornecedor;
