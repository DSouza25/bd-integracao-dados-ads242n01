# Parte 1: Documentação do processo de importação

## Ferramenta utilizada

## Estrutura da planilha

| Aba | Coluna | Tipo | Observação |
| --- | --- | --- | --- |
|  |  |  |  |

## Erros encontrados no DDL e como foram corrigidos

| Tabela | Erro | Correção |
| --- | --- | --- |
| entradas_mercadoria | Atributo 'ordem_compra' não encontrado | adicionar o atributo à tabela |
| produtos_filial | Erro de sintaxe - Faltava um ',' no fim do atributo idfornecedor | Adição da vírgula |
| produtos_filial | Atributo indicado não existe - estava com o nome trocado | Atributo indicado modificado para o nome correto |
| produtos_filial | atributo chamado na chave não existe | atributo adicionado a estrutura da tabela |
|  |  |  |

## Erros encontrados no script de importação e como foram corrigidos

| Erro | Efeito | Correção |
| --- | --- | --- |
| Nome do banco de dados incorreto | retorna que a tabela inexistente | alteração do nome do banco no script |
| Nome incorreto da coluna - idforncedor | Falha na inserção de dados | Alteração da coluna de idforncedor para idfornecedor |
| Erro na inserção de dados devido a duplicidade na pk | Rollback das operações | Ajuste na estrutura da tabela para evitar duplicidade |
| Nome incorreto da coluna - decricao | Falha na inserção de dados + Rollback das operações | Alteração da coluna de decricao para descricao |
| Nome incorreto da coluna - produto_id | Falha na inserção de dados + Rollback das operações| Alteração da tabela de produto_id para idproduto |
| Nome incorreto da coluna - idfonecedor | Falha na inserção de dados + Rollback das operações| Alteração da tabela de idfonecedor para idfornecedor |
| Tipo de dado incompatível idfornecedor | Falha na inserção de dados + Rollback das operações| Alteração do tipo de dado na coluna |
| Função 'excel_para_data' com conversão errada | Dados inseridos sempre como 'Null' | Ajuste na mudança de conversão |
|  |  |  |

## Tratamentos aplicados aos dados

(conversão de tipos, validações, normalizações)

## Conferência final

| Tabela | Linhas na planilha | Linhas no banco |
| --- | --- | --- |
| fornecedor |  |  |
| produtos_filial |  |  |
| pedido_compra |  |  |
| entradas_mercadoria |  |  |
| venda |  |  |
