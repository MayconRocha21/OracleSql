-- CASE WHEN

/*
Quando fazemos o comando de seleção, podemos aplicar uma classificação sobre o campo que queremos exibir.

Um exemplo é a classificação da nota de alunos, onde quem tirou mais do que 5 foi aprovado e quem tirou menos que 5 foi reprovado. 
Outro exemplo, para saber se um produto é caro ou barato.

Podemos fazer vários critérios de classificação, utilizando CASE WHEN.
*/

--vamos criar um script novo e selecionar o campo NOME_DO_PRODUTO e PRECO_LISTA da TABELA_DE_PRODUTOS:

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA
FROM TABELA_DE_PRODUTOS;

/*
Após selecionar o comando e executá-lo, temos o resultado: a primeira coluna é para nome do produto e a segunda é o preço de lista.

Usando esses campos, faremos o seguinte critério de classificação:

Um PRODUTO CARO é aquele que tem um preço de lista maior ou igual a 12;
Um PRODUTO EM CONTA deve estar entre 7 e 12;
Um PRODUTO BARATO tem um preço de lista menor do que 7.
Agora, copiamos o comando anterior e acrescentamos uma vírgula (,) após PRECO_LISTA para acrescentar um novo campo no comando SELECT.

Em seguida, vamos abrir parênteses para isolar a expressão que vamos construir agora, a qual começa com o CASE WHEN.

Após CASE WHEN, devemos colocar nosso primeiro critério de seleção. Nesse caso, o campo PRECO_DE_LISTA deve ser maior ou igual (>=) à 12.

Se o preço de lista for maior ou igual a 12, então ele é um produto caro. Isto é, THEN 'PRODUTO CARO'

*/

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
 (CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
 )
FROM TABELA_DE_PRODUTOS;

/*
Para acrescentar um segundo critério, vamos escrever outro WHEN.

Não é preciso colocar "CASE" novamente, porque CASE só vem na frente do primeiro critério de seleção.

Após o WHEN, vamos digitar que o campo PRECO_DE_LISTA deve ser maior ou igual (>=) à 7.

Mas também deve ser, ao mesmo tempo, menor que 12. Para isso, acrescente AND e PRECO_LISTA < 12.

Estamos aplicando menor que 12, porque o igual a 12 já foi aplicado na primeira condição. 
Assim, um produto que custe 11,999 será em conta, porque o preço é menor que 12.

Se colocássemos que o produto é menor ou igual à 11 (<= 11), um produto que custasse 11,5 
não entraria nem como produto caro,nem como produto em conta.

Ao final desse segundo critério, estabelecemos o que será escrito se o
produto estiver entre o preço estabelecido: THEN 'PRODUTO EM CONTA'.
*/

WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA';

/*
O terceiro critério é que o produto com preço de lista menor que 7 é barato.

Como é a última cláusula, colocamos ELSE já que significa que nenhum dos dois primeiros critérios foi satisfeito.

Ao final da expressão, concluímos com END antes do fecha-parênteses.
*/

ELSE 'PRODUTO BARATO'
END

/*
Para poder apresentar um nome amigável para a coluna que será calculada através dessa expressão,
vamos colocar um alias - chamando a expressão de CLASSIFICACAO.

Para isso, após os parênteses e antes de FROM, acrescente AS CLASSIFICACAO.

Analise o comando completo e seu resultado:
*/

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS;


-- CASE WHEN com filtro

/*
Além disso, podemos aplicar um filtro ao final do mesmo comando, depois de FROM TABELA_DE_PRODUTOS.

Para isso, usamos a cláusula WHERE e especificamos que queremos os produtos com SABOR igual (=) à string Manga entre aspas simples.
*/

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga';

--Com isso, teremos somente a classificação entre caros, em conta e baratos dos produtos com sabor manga.

-- CASE WHEN ordenado

/*
Também podemos ordenar o resultado pela classificação com ORDER BY.

Assim, podemos ordenar por ordem alfabética: primeiro serão exibidos os produtos baratos, 
depois os produtos caros e por último os produtos em conta.

Primeiro, copie o comando anterior e apague o filtro WHEN e seu critério.

Depois, para ordenar a classificação, precisamos acrecentar o ORDER BY (depois de FROM) e 
repetir a mesma expressão que utilizamos em CASE WHEN:
*/

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
ORDER BY
(CASE
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
END);

/*
Se rodamos a consulta completa, o resultado exibirá primeiro todos os produtos baratos, 
depois todos os caros e por útlimo todos os produtos em conta.

Porém, não precisamos repetir a grande expressão no ORDER BY. Pois,
a nossa expressão do CASE WHEN já tem o alias CLASSIFICACAO.

Desse modo, podemos usar o alias como critério de ordem: ORDER BY CLASSIFICACAO.
*/

SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE
    WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
ORDER BY CLASSIFICACAO;

/*
Também podemos usar a classificação para o critério de GROUP BY, depois usá-lo com o HAVING.

Inclusive, tudo que mostramos nessas aulas é acumulativo. São cláusulas e funções que utilizamos dentro do comando SELECT.

Assim, todos os filtros e ordenações podemos usar em conjunto.

É a experiência do profissional de SQL que vai ajudar a saber o que utilizar perante um problema a ser resolvido.
*/


------------------------------------------------------------------------------------------------------------------------

/*
Para cada cliente, temos seus limites de crédito mensais. Liste somente os nomes dos clientes e os classifique por:

Acima ou igual a 150.000 de limite de crédito - Clientes grandes
Entre 150.000 e 110.000 de limite de crédito - Clientes médios
Menores que 110.000 de limite de crédito - Clientes pequenos
*/

SELECT NOME,
(CASE WHEN LIMITE_DE_CREDITO >= 150000 THEN 'Clientes grandes'
    WHEN LIMITE_DE_CREDITO < 150000 AND LIMITE_DE_CREDITO >= 110000 THEN 'Clientes medios'
    ELSE 'Clientes pequenos'
END) 
FROM TABELA_DE_CLIENTES