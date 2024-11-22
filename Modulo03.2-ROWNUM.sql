-- Sintaxe ROWNUM

-- SELECT (DISTINCT)
-- <Lista de campos> ou *
-- FROM
-- <Nome da Tabela>
-- WHERE
-- <Filtro>
-- AND ROWNUM <= <VALOR>


--Se executamos um SELECT * FROM CLIENTE, teremos como resposta a tabela toda.
SELECT * FROM tabela_de_clientes;

-- Logo, se acrescentamos um filtro, onde ROWNUM é menor ou igual (<=) à 4, a resposta será as quatro primeiras linhas da nossa seleção.
SELECT * FROM tabela_de_clientes WHERE ROWNUM <= 4;

SELECT * FROM TABELA_DE_PRODUTOS;

SELECT ROWNUM, TABELA_DE_PRODUTOS.* FROM TABELA_DE_PRODUTOS;

SELECT ROWNUM, TP.* FROM TABELA_DE_PRODUTOS TP;

-- Limitando a saída da consulta

SELECT ROWNUM, TP.* FROM TABELA_DE_PRODUTOS TP WHERE ROWNUM <= 5;

-- Não é necessário explicitar o ROWNUM na saída para usá-lo no filtro. Ou seja, 
--não é preciso visualizar a coluna na consulta para limitá-la.
SELECT TP.* FROM TABELA_DE_PRODUTOS TP WHERE ROWNUM <= 5;


-- Listando as 10 primeiras vendas do dia 01/10/2017
SELECT * FROM NOTAS_FISCAIS WHERE DATA_VENDA = TO_DATE('2017-10-01','YYYY-MM-DD') AND ROWNUM <= 10;
