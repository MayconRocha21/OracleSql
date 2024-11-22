-- Sintaxe GROUP BY

-- O agrupamento é feito pela cláusula GROUP BY, que deve ficar depois do filtro e antes do ORDER BY, caso exista.

-- SELECT (DISTINCT)
-- <Lista de campos> ou *
-- FROM
-- <Nome da Tabela>
-- WHERE
-- <Filtro>
-- AND ROWNUM <= <VALOR>
-- GROUP BY <CAMPOS>
-- ORDER BY <CAMPOS> (ASC,DESC)

/*
Após GROUP BY, colocamos a lista de campos que não são numéricos para usar como critério de agrupamento.

Porém, quando você utilizar o GROUP BY, você precisa especificar após o comando SELECT 
a fórmula matemática na lista de campos numéricos que você está escolhendo para agrupar, sendo:

SUM: soma
AVG: média
MIN: mínimo
MAX: máximo
*/

SELECT CIDADE, IDADE
FROM TABELA_DE_CLIENTES
ORDER BY CIDADE, IDADE;

/*
No mesmo comando, se aplicamos a cláusula DISTINCT após o SELECT, estaríamos juntando 
o que é igual e visualizando os dados distintos, como já aprendemos.
*/
SELECT DISTINCT CIDADE, IDADE
FROM TABELA_DE_CLIENTES
ORDER BY CIDADE, IDADE;


--Assim, aqueles dois clientes de 22 anos do Rio de Janeiro viraram uma linha só. Esse é o resultado utilizando DISTINCT.

--Já o GROUP BY não funciona do mesmo modo. O GROUP BY retornaria somente duas linhas da consulta de agrupamento por CIDADE e IDADE.
/*
Uma linha para o Rio de Janeiro, agregando todas as idades por uma fórmula específica. A segunda linha seria para São Paulo também aplicando sobre as idades o mesmo critério de agregação.

Lembre-se que os critérios de agregação são soma, média, valor mínimo ou valor máximo.

Para isso, fazemos a mesma consulta, sem o DISTINCT. Mas, depois do FROM e antes do ORDER BY, escrevemos GROUP BY seguido do critério específico não-numérico. Nesse caso, o campo CIDADE.

Isso significa que o outro campo, IDADE, tem que ser numérico. Pois, os campos que estão no critério de agregação devem ser numéricos.

Aplicamos um critério de agregação em SELECT CIDADE, IDADE, no campo numérico CIDADE. Vamos aplicar a soma, assim teremos SUM(IDADE).
*/

/*
Observação: quando se usa o GROUP BY como critério de agregação, não pode ter o campo 
que está sendo usado como critério de agregação no ORDER BY. Logo, vamos tirar IDADE do ORDER BY.
*/
SELECT CIDADE, SUM(IDADE)
FROM TABELA_DE_CLIENTES
GROUP BY CIDADE
ORDER BY CIDADE;

/*
Quando executamos o comando, teremos o resultado com a soma das idades de todos os 
clientes do Rio de Janeiro, que é 196, e a soma das idades de todos os clientes de São Paulo, que é 162.

Também podemos aplicar o critério de agregação para outros campos da tabela de clientes.

Por exemplo, podemos aplicar uma soma para os campos de limite de crédito e idade, 
agrupados por CIDADE. Assim, colocamos as funções de soma separadas por vírgula (,).

Neste caso, não queremos que o resultado venha ordenado. Por isso, não colocaremos ORDER BY.
*/
SELECT CIDADE, SUM(LIMITE_DE_CREDITO), SUM(IDADE)
FROM TABELA_DE_CLIENTES
GROUP BY CIDADE;

/*
Note que temos o 162 anos de idade e o valor total de crédito de 810 mil para São Paulo.

Além disso, podemos usar a agregação para descobrir qual o produto mais caro de cada embalagem.

Para isso, selecionamos os campos de EMBALAGEM e PRECO_DE_LISTA da TABELA_DE_PRODUTOS.

Em seguida, como queremos saber o maior preço de lista de cada embalagem, acrescentamos a função MAX() no campo numérico PRECO_DE_LISTA.
*/

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA)
FROM TABELA_DE_PRODUTOS
GROUP BY EMBALAGEM;

-- Critério de agregação COUNT

/*
Existe uma função chamada COUNT, utilizada em cima de valores agregados.

Primeiro, vamos selecionar os campos EMBALAGEM e NOME_DO_PRODUTO da TABELA_DE_PRODUTOS. 
Em seguida, ordenamos a saída por EMBALAGEM, usando ORDER BY.
*/

SELECT EMBALAGEM, NOME_DO_PRODUTO
FROM TABELA_DE_PRODUTOS
ORDER BY EMBALAGEM;

/*
Observe que temos todos os produtos de garrafa listados. Concluímos que temos 11 produtos de garrafa, 
porque são 11 linhas com o campo embalagem de Garrafa. Também temos 5 produtos de Lata e 
em seguida uma quantidade um pouco maior de produtos em PET.

Mas, queremos saber a quantidade de produtos que temos de garrafa, lata ou PET sem ficar contando um por um.

Para isso, copiamos o comando anterior e acrescentamos um critério de agregação chamado COUNT() para contar todos os campos, 
ou seja, COUNT(*). Essa função vai substituir o segundo campo selecionado no comando, o NOME_DO_PRODUTO.

Como o COUNT é um critério de agregação, vamos colocar um GROUP BY por EMBALAGEM, antes do ORDER BY.
*/

SELECT EMBALAGEM, COUNT(*)
FROM TABELA_DE_PRODUTOS
GROUP BY EMBALAGEM
ORDER BY EMBALAGEM;

/*
Após executar a consulta, o resultado mostra 11 produtos de garrafa, 5 produtos de lata e 15 produtos de PET.

Mas, também poderíamos adicionar um filtro na seleção com WHERE. 
A cláusula fica depois do FROM e antes do GROUP BY no mesmo comando anterior.

Vamos contar os produtos que existem em cada embalagem apenas para produtos com sabor de laranja. 
Ou seja, onde SABOR é igual (=) à string de Laranja.
*/

SELECT EMBALAGEM, COUNT(*)
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Laranja'
GROUP BY EMBALAGEM
ORDER BY EMBALAGEM;

-- Critério de agregação com alias

/*
Além disso, é um costume colocar um alias no critério de agregação de GROUP BY 
para não ter uma coluna escrita "COUNT" ou "SUM" no resultado.

Lembre-se que o alias do campo tem que ter um AS.

Então, vamos colocar o apelido de NUMERO_DE_PRODUTOS para COUNT(*), no último comando escrito:
*/

SELECT EMBALAGEM, COUNT(*) AS NUMERO_DE_PRODUTOS
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Laranja'
GROUP BY EMBALAGEM
ORDER BY EMBALAGEM;

/*
Ao fazer isso, note que a segunda coluna terá um nome mais amigável para "COUNT". 
Agora tem o alias "NUMERO_DE_PRODUTOS"

Também podemos aplicar um alias no SUM ou qualquer outro critério de agregação.

Por exemplo, na seleção escrita anteriormente onde usamos MAX, o seu resultado vem com uma coluna escrita "MAX(PRECO_DE_LISTA)".

Então, poderíamos colocar o apelido de MAIOR_PRECO, usando o AS.
*/

SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO
FROM TABELA_DE_PRODUTOS
GROUP BY EMBALAGEM;

-- Quantas vendas foram feitas com quantidade igual a 99 litros para o produto 1101035?

-- Vamos aplicar um COUNT para contar o número de notas fiscais:

SELECT COUNT(*) FROM ITENS_NOTAS_FISCAIS WHERE codigo_do_produto = '1101035' AND quantidade = 99;