-- INNER JOIN

--Vamos visualizar duas tabelas: a tabela de vendedores e a tabela de notas fiscais.

--Começamos pela seleção de todos os campos da tabela denominada TABELA_DE_VENDEDORES.
SELECT * FROM TABELA_DE_VENDEDORES;

-- Também vamos selecionar a tabela de NOTAS_FICAIS com o comando SELECT.
SELECT * FROM NOTAS_FISCAIS;

-- Agrupando e juntando tabelas

/*
Antes de juntar essas duas tabelas, vamos trabalhar só com a tabela de notas fiscais, por enquanto.

Digamos que queiramos saber quantas notas fiscais cada vendedor vendeu. 
Já aprendemos que esse agrupamento é através da cláusula GROUP BY.

Assim, vamos selecionar o campo MATRICULA e adicionar uma vírgula.

Lembra que a função COUNT() contará o número de linhas. Vamos apelidá-la como NUMERO_DE_NOTAS, 
pois cada linha da tabela de notas fiscais representa uma nota fiscal única.

Assim, após a vírgula, escrevemos COUNT(*) para contar todos os campos e depois o prefixo AS para adicionar o alias NUMERO_DE_NOTAS.

Em seguida, colocados FROM e o nome da tabela NOTAS_FISCAIS. Ao fim, agrupamos por MATRICULA, utilizando o GROUP BY.
*/

SELECT MATRICULA, COUNT(*) AS NUMERO_DE_NOTAS
FROM NOTAS_FISCAIS
GROUP BY MATRICULA;

/*
Com o resultado analisamos que os vendedores 00235, 00237 e 00236 estão com um número de notas parecido, 
pois todos fizeram 29 mil vendas. Já o vendedor 00238 fez poucas vendas, só 23.

Entretanto, não queríamos ter o número da matrícula nesse resultado. Preferiríamos saber o nome do vendedor.

Então, poderíamos somente acrescentar o campo NOME na seleção, acrescentando após 
a vírgula de MATRICULA e antes de COUNT(*). Lembre-se de acrescentar uma vírgula depois de NOME.

E claro, o GROUP BY também deveria ter esse segundo critério de agrupamento, 
acrescentando o campo NOME após a vírgula de MATRICULA.
*/

SELECT MATRICULA, NOME, COUNT(*) AS NUMERO_DE_NOTAS
FROM NOTAS_FISCAIS
GROUP BY MATRICULA, NOME;

/*
Nesse caso, devemos fazer a junção das tabelas com INNER JOIN.

Logo, no mesmo código, adicionaremos o INNER JOIN da TABELA_DE_VENDEDORES, após FROM NOTAS_FISCAIS.

Como adicionamos outra tabela, vamos especificar na seleção qual o nome da tabela para cada campo. Por exemplo,
a matrícula vem da tabela de notas fiscais e o nome vem da tabela de vendedores. 
Ou seja, NOTAS_FISCAIS.MATRICULA e TABELA_DE_VENDEDORES.NOME.

No COUNT não preciso especificar nenhuma tabela.

Agora, que colocamos o INNER JOIN, precisamos usar o critério que junta a tabela de notas fiscais à tabela de vendedores.

Como analisamos no esquema do banco de dados, o critério é o campo MATRICULA,
que existe tanto na tabela de vendedores quanto na tabela de notas fiscais.

Assim, digitamos ON e colocamos que NOTAS_FISCAIS.MATRICULA é igual à TABELA_DE_VENDEDORES.MATRICULA.

Lembre-se de colocar o nome das tabelas seguido de ponto também em GROUP BY, antes dos nomes dos campos.
*/

SELECT NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME, COUNT(*) AS NUMERO_DE_NOTAS
FROM NOTAS_FISCAIS
INNER JOIN TABELA_DE_VENDEDORES
ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA
GROUP BY NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME;

/*
Nossa consulta ficou assim: selecionamos os campos, depois colocamos FROM da primeira tabela e INNER JOIN na segunda tabela. 
Em seguida, informamos o critério de junção. Por último, agrupamos com GROUP BY, porque usamos COUNT que é uma agregação.
*/


/*
Após rodar essa seleção, teremos o resultado desejado: exibimos o número de notas fiscais 
vendidas enquanto vemos também o nome do vendedor.

Assim, não visualizamos apenas a matrícula de forma isolada e consiguimos saber qual 
foi o total de notas vendidas para cada vendedor.

Se seguimos a regra de colocar na frente da seleção sempre a tabela de menor valor, 
seria melhor executar primeiro a TABELA_DE_VENDEDORES e depois o INNER JOIN da tabela de NOTAS_FISCAIS.

O resultado seria o mesmo.
*/

SELECT NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME, COUNT(*) AS NUMERO_DE_NOTAS
FROM TABELA_DE_VENDEDORES
INNER JOIN NOTAS_FISCAIS
ON NOTAS_FISCAIS.MATRICULA = TABELA_DE_VENDEDORES.MATRICULA
GROUP BY NOTAS_FISCAIS.MATRICULA, TABELA_DE_VENDEDORES.NOME;

/*
Ao invés disso, poderíamos criar um alias para as tabelas.

Por exemplo, TV para a tabela de vendedores e NF para a tabela de notas fiscais.

Com isso, substituímos o nome inteiro da tabela NOTAS_FISCAIS pelo seu apelido NF 
e onde temos TABELA_DE_VENDEDORES substituímos pelo apelido TV:
*/

SELECT NF.MATRICULA, TV.NOME, COUNT(*) AS NUMERO_DE_NOTAS
FROM TABELA_DE_VENDEDORES TV
INNER JOIN NOTAS_FISCAIS NF
ON NF.MATRICULA = TV.MATRICULA
GROUP BY NF.MATRICULA, TV.NOME;