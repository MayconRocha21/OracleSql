-- Sintaxe DISTINCT
/*
Usamos a palavra DISTINCT depois do comando SELECT e antes da lista de campos que 
queremos visualizar ou do asterisco (*).
*/

-- SELECT DISTINCT
-- <Lista de campos> ou *
-- FROM
-- <Nome da Tabela>
-- WHERE
-- <Filtro>

/*
vamos fazer uma seleção para visualizar apenas a coluna de cidade e a coluna de 
estado dessa nova tabela de exemplo.
*/

SELECT CIDADE, ESTADO FROM TABELA_DE_CLIENTES;

/*
Se rodamos o mesmo código acrescentando o DISTINCT após o SELECT, o resultado 
terá apenas quatro linhas, mostrando apenas as combinações que não se repetem.
*/

SELECT DISTINCT CIDADE, ESTADO FROM TABELA_DE_CLIENTES;

/*
Treinando a cláusula DISTINCT dentro do SQL Developer
Vamos entrar no SQL Developer para treinar um pouco com a cláusula DISTINCT.

No script vazio, vamos consultar o campo EMBALAGEM da tabela de produtos.
*/

SELECT EMBALAGEM FROM TABELA_DE_PRODUTOS;

/*
Podemos executar o mesmo código anterior, acrescentando DISTINCT após o SELECT. 
Assim, o resultado será um pouco diferente.
*/

SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS;

-- Usando DISTINCT com filtro

/*
Adicione a cláusula WHERE, seguido do campo SABOR igual à (=) string Laranja, 
entre aspas simples.
*/

SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja';

-- Usando DISTINCT em mais de um campo

/*
Também podemos aplicar a cláusula DISTINCT utilizando mais de um campo.

Com SELECT DISTINCT, vamos ver as combinações entre SABOR e EMBALAGEM da tabela de produtos.
*/

SELECT DISTINCT EMBALAGEM, SABOR FROM TABELA_DE_PRODUTOS;

/*
Temos 23 combinações diferentes entre embalagens e sabores como resultado.

Quando havíamos executado a tabela completa anteriormente, tínhamos uma lista de 31 produtos.

Se de 31 produtos, 23 têm combinações distintas de embalagem com sabor, é porque
alguns produtos possuem embalagens e sabores iguais.
*/

