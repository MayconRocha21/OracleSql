-- Sintaxe HAVING

/*
A cláusula HAVING está associada a uma consulta que tenha GROUP BY, ou seja, uma agregação. 
Pois, permite que seja aplicado um filtro sobre o resultado da agregação.
*/

-- SELECT (DISTINCT)
-- <Lista de campos> ou *
-- FROM
-- <Nome da Tabela>
-- WHERE
-- <Filtro>
-- AND ROWNUM <= <VALOR>
-- GROUP BY <CAMPOS>
-- ORDER BY <CAMPOS> (ASC,DESC)
-- HAVING <CONDIÇÃO>

/*
vamos fazer um critério para verificar o limite de crédito por estado e somar os limites de crédito.

Para isso, selecionamos ESTADO e LIMITE_DE_CREDITO, acrescentando o critério de agregação SUM() ao limite de crédito.

Ambos campos são da TABELA_DE_CLIENTES e serão agrupados por ESTADO.
*/

SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES GROUP BY ESTADO;

/*
Agora, queremos verificar somente os estados cujo limite de crédito é maior do que 900 mil.

Vamos copiar o comando anterior e acrescentar a cláusula WHERE antes de GROUP BY, 
onde o critério é a soma do limite de crédito maior ou igual (>=) à 900000.
*/

SELECT ESTADO, SUM(LIMITE_DE_CREDITO)
FROM TABELA_DE_CLIENTES
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;

--Com isso, estamos aplicando um filtro sobre o resultado do agrupamento que tem como critério o estado.

/*
Podemos utilizar o HAVING sem precisar ter como condição todos os critérios de agrupamento que estão sendo usados dentro do GROUP BY.

Como exemplo, vamos utilizar agora a tabela de produtos.

Vamos selecionar o campo EMBALAGEM, seguido de vírgula (,) e também selecionar o campo PRECO_DE_LISTA.

Colocaremos dois critérios de agrupamento no preço de lista: valor máximo (MAX) e valor mínimo (MIN), ambos com alias (AS).

Ou seja, escrevemos MAX(PRECO_DE_LISTA) com o apelido de MAIOR_PRECO. Acrescentamos uma vírgula (,)
e digitamos MIN(PRECO_DE_LISTA) com o apelido de MENOR_PRECO.

Lembre-se de colocar que esses campos são da TABELA_DE_PRODUTOS e estão agrupados por EMBALAGEM.
*/

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS
GROUP BY EMBALAGEM;

/*
Suponha que só queremos visualizar produtos que custem mais do que 10 reais, por exemplo.

Como estamos fazendo um critério que não é sobre a agregação, podemos colocar o filtro como WHERE.

Então, no mesmo comando anterior, antes de GROUP BY, adicionamos WHERE onde PRECO_LISTA seja maior ou igual (>=) à 10.
*/

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM;

/*
De PET, o produto mais barato custa 10,512, porque filtramos só produtos maiores que 10. 
E o produto de garrafa com menor preço é 13,312. Não tem produto mais barato que 10 reais em lata, por isso, 
o registro Lata não apareceu.

Se o nosso critério for só pegar produtos cujo maior preço agrupado (critério de valor máximo)
é maior que 20 reais, teremos que usar a cláusula HAVING.

Vamos adicionar o filtro HAVING, com MAX(PRECO_DE_LISTA) maior ou igual (>=) à 20, ao final do comando anterior.
*/

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM
HAVING MAX(PRECO_DE_LISTA) >= 20;

/*
Ao aplicar o filtro HAVING, somente a linha de produtos de embalagem PET será selecionada, 
porque é a única que possui o maior preço de lista com valor maior do que 20 reais. E a coluna "MENOR_PRECO" em PET 
continua sendo exibida, mesmo com valor menor que 20, porque só aplicamos o HAVING na coluna "MAIOR_PRECO".
*/
