-- Sintaxe ORDER BY

-- SELECT (DISTINCT)
-- <Lista de campos> ou *
-- FROM
-- <Nome da Tabela>
-- WHERE
-- <Filtro>
-- AND ROWNUM <= <VALOR>
-- ORDER BY <CAMPOS> (ASC,DESC)

/*
Dentro de TABELA_DE_PRODUTOS, existe um campo chamado PRECO_DE_LISTA que é o preço tabelado de cada produto. 
Vamos ordenar o preço de lista para saber qual é o produto mais barato e mais caro.

Para isso, simplesmente vamos executar uma consulta com ORDER BY. Em outras palavras, 
vamos usar SELECT em todos os campos de TABELA_DE_PRODUTOS e ordenar pelo PRECO_DE_LISTA.
*/

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA;

/*
Quando executamos o comando, são exibidos os produtos ordenados desde o menor preço 
de 2,808 até o produto mais caro, custando 38,012.

Para inverter essa seleção, ou seja, visualizar do produto mais caro para o mais barato,
devemos acrescentar o critério DESC logo depois do campo PRECO_DE_LISTA.
*/

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;

-- ORDER BY com textos

/*
Também podemos utilizar o ORDER BY para ordenar textos alfabeticamente.

Por exemplo, queremos listar os produtos ordenados alfabeticamente pelo nome do produto.
Então, selecionamos todos os campos de TABELA_DE_PRODUTOS e acrescentamos ORDER BY 
seguido do campo NOME_DO_PRODUTO.
*/

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO;

-- ORDER BY com critérios compostos

/*
Além disso, podemos selecionar as embalagens e ordená-las, enquanto também ordenamos 
o nome do produto alfabeticamente dentro de cada embalagem.

Para isso, selecione todos os campos de TABELA_DE_PRODUTOS. Em seguida,
acrescente ORDER BY depois o campo EMBALAGEM seguido de vírgula (,) e o campo NOME_DO_PRODUTO.
*/

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM, NOME_DO_PRODUTO;

/*
Para mudar a seleção, poderíamos usar um critério de ordenação diferente.

Por exemplo, acrescentando a palavra DESC depois de EMBALAGEM no código anterior:
*/

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO;

/*
Para mudar a ordenação do segundo critério, também devemos acrescentar DESC depois
do campo NOME_DO_PRODUTO no código anterior.
*/

SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO DESC;

