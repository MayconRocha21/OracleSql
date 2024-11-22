-- Subconsultas substituindo o HAVING

--Usando HAVING

/*
selecionamos as embalagens e fazemos um SUMdo preço, a que chamaremos de SOMA_PRECO.
Esses dados virão da TABELA_DE_PRODUTOS, e os agruparemos por EMBALAGEM:
*/

SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM

/*
No entanto, queremos listar apenas o que estão acima de 80 - no caso, apenas PET.

Se quisermos fazer isso usando o HAVING, então, duplicamos o que acabamos de 
escrever e acrescentamos HAVING SUM(PRECO_DE_LISTA) >= 80:
*/

SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM
HAVING SUM(PRECO_DE_LISTA) >= 80;

-- Usando subconsulta

/*
Vamos copiar a query principal e colar ao final do script, inserindo-a entre parênteses. 
Vamos nomeá-la como SOMA_EMBALAGENS.

Acima desse código, teremos um SELECT. Os campos que temos como resposta dessa consulta
são EMBALAGEM e SOMA_PRECO. Então, no SELECT, pegamos o nome da subquery, inserimos um ponto e o nome desses campos.

Abaixo do SELECT, adicionamos um FROM que vai englobar a própria subquery. Abaixo dela, 
inserimos a condição (WHERE): o campo SOMA_PRECO deve ser maior ou igual a 80.
*/

SELECT SOMA_EMBALAGENS.EMBALAGEM, SOMA_EMBALAGENS.SOMA_PRECO
FROM
(
SELECT EMBALAGEM, SUM(PRECO_DE_LISTA) AS SOMA_PRECO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM
) SOMA_EMBALAGENS
WHERE SOMA_EMBALAGENS.SOMA_PRECO >= 80;