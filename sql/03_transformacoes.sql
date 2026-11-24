-- 03_transformacoes
-- Nome: Dário Souza | Cauã Gomes
select 
	concat_ws(' - ', produto_id, descricao_produto) as "Produto", 
	qtde_pedida as "Quantidade Requisitada",
	to_char(data_pedido, 'DD/MM/YYYY') as "Data Solicitação"
from pedido_compra 
where qtde_pedida > 10
order by "Produto";

-- Desenvolvimento de trigger não executado devido a falta de clareza no requisito estabelecido, podendo assim ter mais de uma interpretação possível;

