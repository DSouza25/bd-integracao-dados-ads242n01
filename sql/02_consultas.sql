-- 02_consultas
-- Nome: Dário Souza | Cauã Gomes
select -- Retorna o produto (descrição), quantidade vendida e faturamento relacionado ao mês de fevereiro
	descricao_produto as "Produto", 
	sum(qtde_vendida) as "Quantidade vendida", 
	round(sum(qtde_vendida * valor_unitario )::numeric, 2) as "Faturamento - Fevereiro"  
from public.venda 
join public.entradas_mercadoria on public.venda.produto_id = public.entradas_mercadoria.produto_id 
where extract(month from data_emissao) = 2
group by descricao_produto ;

-- Dados inconsistentes para esta consulta
