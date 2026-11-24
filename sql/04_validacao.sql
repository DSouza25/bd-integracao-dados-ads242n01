-- 04_validacao
-- Nome: Dário Souza | Caua Gomes

-- Faturamento por mês
select 
	case extract(month from data_emissao)
		when 1 then 'Janeiro' when 2 then 'Fevereiro' when 3 then 'Março' when 4 then 'Abril'
		when 5 then 'Maio' when 6 then 'Junho' when 7 then 'Julho' when 8 then 'Agosto'
		when 9 then 'Setembro' when 10 then 'Outubro' when 11 then 'Novembro' when 12 then 'Dezembro'
	end as "Mês", 
	round(sum(qtde_vendida * valor_unitario )::numeric, 2) as "Faturamento"
from venda
group by "Mês";



create or replace function public.relatorio(mes_observado int )
	returns table( indicador text, valor text)
	language sql
	as $$
		select indicador, valor
		from (
			select 
				'Mês' as indicador, 
				case mes_observado
				when 1 then 'Janeiro' when 2 then 'Fevereiro' when 3 then 'Março' when 4 then 'Abril'
				when 5 then 'Maio' when 6 then 'Junho' when 7 then 'Julho' when 8 then 'Agosto'
				when 9 then 'Setembro' when 10 then 'Outubro' when 11 then 'Novembro' when 12 then 'Dezembro'
				end as valor
			from public.venda
			group by valor
			) as filtro_mes
		union all
		select
			'Faturamento' as indicador,
			concat('R$ ', round(sum(qtde_vendida * valor_unitario )::numeric, 2)::text) as valor
		from venda
		where extract(month from data_emissao) = mes_observado
		union all
		select 
			'Unidades vendidas' as indicador,
			trunc(sum(qtde_vendida))::text as valor
		from venda
		where extract(month from data_emissao) = mes_observado
		group by extract(month from data_emissao)
		union all 
		select
			'Mais vendido' as indicador,
			concat(indicador, ' (', trunc(qtde), ')')
		from (
			select
			descricao_produto as indicador,
			sum(qtde_vendida) as qtde,
			sum(qtde_vendida * valor_unitario) as valor
			from venda
			join entradas_mercadoria on venda.produto_id = entradas_mercadoria.produto_id
			where extract(month from venda.data_emissao) = mes_observado
			group by indicador
			order by valor desc
			limit 1
			)as queridinho;
		$$;

select * from relatorio(1);
