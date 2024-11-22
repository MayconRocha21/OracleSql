-- SELECT
-- <Lista de campos> ou *
-- FROM
-- <Nome da Tabela>
-- WHERE
--<Filtro>

/*
A condição filtro é uma expressão lógica que retorna dois valores: verdadeiro ou falso.
Se for verdadeiro aparece o resultado da consulta e se for falso não.
*/

SELECT * FROM TABELA_DE_PRODUTOS

SELECT * FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '290478';

SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja';

SELECT * FROM TABELA_DE_PRODUTOS WHERE EMBALAGEM = 'PET';


-- Filtros quantitativos

/*
podemos aplicar na expressão lógica comandos como MAIOR (>), MENOR ()< MAIOR ou IGUAL >= MENOR ou IGUAL <= DIFERENTE <> e 
ENTRE (Between), que é quando queremos algo que está entre dois valores.
*/

--Vamos testar a segmentação dos clientes com a idade maior de 20 anos.
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE > 20;

--Podemos ver os clientes com menos de 20 anos.
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE < 20;

--Se aplicarmos <> 18 no código veremos todos menos quem 18 anos.
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE <> 18;

--Também podemos aplicar filtros nas datas, como abaixo.
--Temos como resultado 3 clientes que nasceram depois de 14 de novembro.
SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO >= '14/11/95'

SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO >= '14/11/1995';

--Também podemos definir esse formato colocando >=TO DATE ('14/11/1995', 'DD/MM/YY');.
SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO >=TO DATE ('14/11/1995', 'DD/MM/YY');

--Se fosse uma notação americana seria >= TO DATE ('11/14/1995', 'MM/DD/YY'); e teria o mesmo resultado.
SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO >= TO DATE ('11/14/1995', 'MM/DD/YY')

--Também podemos usar o ENTRE (Between), que mostra um dado entre um limite.
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE BETWEEN 19 AND 22;

--Também podemos usar um código para segmentar os bairros por meio da ordem alfabética.
SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO >= 'Lapa'


-- Expressões lógicas

/*
O OR será considerado verdadeiro quando uma das expressões lógicas primárias for verdadeira.
Portanto, ele só será falso quando as duas expressões foram falsas.
*/

SELECT * FROM CLIENTE WHERE X = A OR Y = B

/*
O AND será considerado verdadeiro quando as duas expressões lógicas primárias forem verdadeiras.
Se uma ou as duas forem falsas, a expressão toda é considerada falsa.
*/

SELECT * FROM CLIENTE WHERE X = A AND Y = B

SELECT * FROM TABELA_DE_PRODUTOS;

SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga';

SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' OR TAMANHO = '470ML'

SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' AND TAMANHO = '470ML';

-- Usando o NOT

SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' AND TAMANHO = '470ML');

-- Se aplicarmos o NOT sobre o OR ele trará todos os itens, menos os que forem manga ou 470 ml.
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' OR TAMANHO = '470ML');

-- Usando o IN

--vamos testar outra expressão adicionando SABOR = "Manga" OR SABOR = "Laranja" OR SABOR = "Melancia".
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = "Manga" OR SABOR = "Laranja" OR SABOR = "Melancia";

/*
Quando temos uma expressão com vários comandos de OR no mesmo campo podemos utilizar a expressão IN no lugar de =,
separando as opções por uma vírgula.
*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ("Manga","Laranja","Melancia");

SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ("Manga","Laranja","Melancia") AND TAMANHO = '1 Litro';

-- Outras expressões

/*
Conhecendo tudo isso podemos criar expressões maiores. 
Vamos utilizar a tabela de clientes SELECT * FROM TABELA_DE_CLIENTES para criá-las.

Se quisermos visualizar apenas as pessoas que nasceram no Rio de Janeiro e 
em São Paulo, escrevemos WHERE CIDADE IN ('Rio de Janeiro','Sao Paulo').
*/

SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro','Sao Paulo');

-- Para visualizarmos apenas quem mora nessas cidades e possuem mais de 20 anos, escrevemos AND IDADE >= 20.

SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro','Sao Paulo') AND IDADE >= 20;

/*
Como estamos usando uma expressão lógica composta, também podemos limitar ainda mais essa segmentação, 
utilizando AND (IDADE >= 20 AND IDADE <= 25).
*/

SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro','Sao Paulo') AND (IDADE >= 20 AND IDADE <= 25);

/*
Outra forma de criarmos essa 
expressão é substituindo (IDADE >= 20 AND IDADE <= 25) pelo BETWEEN.
*/
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro','Sao Paulo') AND (IDADE BETWEEN 20 AND 25);

