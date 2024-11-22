-- TIPOS DE JOINS (AULA TEORICA, AS TABELAS SÃO FICTÍCIAS, NÃO EXIXTEM)

--INNER JOIN

-- Primeiramente, vamos relembrar o INNER JOIN. Para rodar o INNER JOIN fizemos a seguinte consulta:

SELECT TE.NOME, TD.HOBBY
FROM TABELA_ESQUERDA TE
INNER JOIN TABELA_DIREITA TD
ON TE.IDENTIFICADOR = TD.IDENTIFICADOR

/*
Queremos visualizar como resultado apenas o campo NOME da tabela da esquerda com o 
campo HOBBY da tabela da direita, usando como critério de junção os campos IDENTIFICADOR das duas tabelas.

Para isso, colocamos SELECT com os campos NOME e HOBBY com o alias e um ponto na frente do campo. 
Depois FROM, seguido da tabela da esquerda, a qual apelidamos de TE. Logo, 
o INNER JOIN da tabela da direita, a qual apelidamos de TD. Por fim, ON e o critério de junção, 
que é o campo IDENTIFICADOR de uma tabela com o da outra.

O INNER JOIN vai pegar somente quem existe nas duas tabelas. Ou seja, o resultado
exibirá somente as duas primeiras linhas de cada tabela.

As duas últimas linhas da TABELA_ESQUERDA e da TABELA_DIREITA estarão fora dessa seleção,
porque não há como juntá-las. Podemos fazer a junção apenas dos identificadores 1 e 3, 
pois são hobbies tanto na tabela da esquerda como também existem na tabela da direita.

É como se fosse uma teoria de conjuntos. Temos um conjunto de um lado, um conjunto 
de outro lado e o INNER JOIN é a interseção, isto é, o que existe em comum.

*/


--LEFT JOIN

/*
Vamos trabalhar ainda com o mesmo exemplo da tabela da esquerda e tabela da direita. 
Dessa vez, usaremos LEFT JOIN que é outro tipo de JOIN. A palavra left em inglês significa "esquerda".
*/

SELECT TE.NOME, TD.HOBBY
FROM TABELA_ESQUERDA TE
LEFT JOIN TABELA_DIREITA TD
ON TE.IDENTIFICADOR = TD.IDENTIFICADOR

--Imagine que a cláusula FROM TABELA_ESQUERDA TE LEFT JOIN TABELA_DIREITA TD estivesse numa única linha.

FROM TABELA_ESQUERDA TE LEFT JOIN TABELA_DIREITA TD

/*
Tendo em perspectiva a cláusula JOIN, existe uma tabela que fica à esquerda e uma tabela que fica à direita.
Tanto faz se eu escrever LEFT JOIN ou INNER JOIN. Tem uma tabela que vem antes e uma que vem depois da cláusula JOIN.

Quando escrevemos LEFT JOIN, damos ênfase à tabela que vem antes da cláusula JOIN - no nosso caso, a TABELA_ESQUERDA.

O LEFT JOIN trará todos os dados da tabela da esquerda e somente os dados em comum da tabela da direita.
Ou seja, trará todo mundo da tabela da esquerda e somente os registros que contém os identificadores 1 e o 3 da tabela da direita, 
porque são os únicos que têm identificação em comum.

Em termos de teoria de conjunto, é como se selecionássemos todo mundo do lado esquerdo e também a interseção de ambos.
----------------------------------------------------------------------------------------------------------------------------
Notem uma curiosidade: quando o software for listar os nomes PEDRO e CLÁUDIA no resultado final, 
deve buscar os identificadores 6 e 4 na tabela da direita. 
Só que os identificadores 6 e 4 não existem em TABELA_DIREITA. Então, o programa escreve NULL (nulo) no campo HOBBY.

Quando você fizer uma seleção e aparecer no resultado a palavra "NULL", significa que aquele campo é vazio.

Isso significa que o Oracle não conseguiu achar nenhum hobby do lado direito, pois escreveu a palavra "NULL".
*/


--RIGHT JOIN

/*
Existe também o RIGHT JOIN com o mesmo princípio. A diferença é que esse comando
vai trazer todo mundo da tabela à direita da cláusula JOIN e somente os dados em comum da tabela à esquerda.
*/

SELECT TE.NOME, TD.HOBBY
FROM TABELA_ESQUERDA TE
RIGHT JOIN TABELA_DIREITA TD
ON TE.IDENTIFICADOR = TD.IDENTIFICADOR

/*
Em teoria de conjuntos, teríamos realçado todo mundo do lado direito, 
mas somente as interseções do lado esquerdo.
-------------------------------------------------------------------------------
Logo, o null estaria do lado esquerdo, porque não é possível achar nenhum nome 
de cliente que tenha como hobby fotografia ou artesanato.
*/


--FULL JOIN

/*
Além disso, existem outros tipos de JOIN, como o FULL JOIN. O FULL JOIN fará a 
combinação do que tem em comum e do que não tem em comum. Ou seja, trará todos os dados.
*/

SELECT TE.NOME, TD.HOBBY
FROM TABELA_ESQUERDA TE
FULL JOIN TABELA_DIREITA TD
ON TE.IDENTIFICADOR = TD.IDENTIFICADOR

/*
Na teoria de conjuntos, será selecionado o que tem na esquerda e não tem na direita,
o que tem na direita e não tem na esquerda e o que ambos têm em comum.
--------------------------------------------------------------------------------
Note que resultado final o que existe em comum é trazido primeiro. 
O que só tem na esquerda e não tem na direita é trazido com o NULL sendo destacado na segunda coluna. 
E o que tem na direita e não tem na esquerda vem com o NULL destacado na coluna da esquerda.

É assim que funciona o FULL JOIN.
*/

--CROSS JOIN

--Por último, temos mais um tipo diferente de JOIN, o CROSS JOIN.

--Contudo, o CROSS JOIN não é executado dessa forma:

SELECT TE.NOME, TD.HOBBY
FROM TABELA_ESQUERDA TE
CROSS JOIN TABELA_DIREITA TD
ON TE.IDENTIFICADOR = TD.IDENTIFICADOR

--Esse tipo de JOIN não respeita essa sintaxe.

/*
O CROSS JOIN é feito da seguinte forma: selecionamos os campos que queremos, 
depois colocamos FROM seguido da tabela da esquerda, uma vírgula e a tabela da direita. Nada mais.
*/

SELECT TE.NOME, TD.HOBBY
FROM TABELA_ESQUERDA TE, TABELA_DIREITA TD

/*
O que é o CROSS JOIN? Na verdade, o CROSS JOIN não fará nenhuma junção. 
E, sim, fará uma análise combinatória de todos os dados contidos na tabela da 
esquerda com todos os dados contidos na tabela da direita.

O resultado seria: pegar o João e cruzar com praia, futebol, fotografia e artesanato. 
Depois, pegar a Maria e combinar com praia, futebol, fotografia e artesanato. 
Depois, pegar o Pedro e combinar com praia, futebol, fotografia e artesanato. 
E assim por diante.
--------------------------------------------------------------------------------

Isto é, vai fazer toda a análise combinatória. Inclusive, essa tabela terá uma 
resposta que não está representada inteiramente, por isso que colocamos reticências.

Em suma, temos INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL JOIN e CROSS JOIN
*/
