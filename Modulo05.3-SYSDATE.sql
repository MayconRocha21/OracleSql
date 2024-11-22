-- SYSDATE

--Primeiramente, criaremos um novo script e iremos exibir a data do computador.
SELECT SYSDATE FROM DUAL;

--Em seguida, passamos a data que queremos converter para texto (SYSDATE) e colocamos o formato dela (DD/MM/YYYY HH:MI:SS).
SELECT TO_CHAR(SYSDATE, 'DD/MM/YYYY HH:MI:SS') FROM DUAL;

-- NOME e DATA_DE_NASCIMENTO

/*
Também podemos trazer informações de NOME e DATA_DE_NASCIMENTO da tabela de clientes (TABELA_DE_CLIENTES).
Ao rodar essa função específica, veremos a data de nascimento das nossas pessoas clientes.
*/
SELECT NOME, DATA_DE_NASCIMENTO FROM TABELA_DE_CLIENTES;

/*
Para visualizar a data de nascimento em outro formato, basta utilizar a função TO_CHAR novamente. 
Suponha que queremos ver o dia com dois dígitos, o mês por extenso, o ano em 4 dígitos,
e o dia da semana também por extenso; nesse caso, DD MONTH YYYY, DAY seria o formato.
*/
SELECT NOME, TO_CHAR(DATA_DE_NASCIMENTO, 'DD MONTH YYYY, DAY') FROM TABELA_DE_CLIENTES;


-- Adicionando números à data

/*
Nós podemos adicionar números à nossa data.

Vamos utilizar, por exemplo, a SYSDATE. Suponha que queremos saber, 
a partir de hoje (19/05/2022), qual será o dia daqui a 127 dias. 
Para isso, basta acrescentar um sinal de mais (+) seguido do número desejado.
*/
SELECT SYSDATE + 127 FROM DUAL;


-- Operações entre datas

/*
Podemos fazer também operações entre datas.

Vamos utilizar como exemplo o trecho de código que exibe a data de nascimento no formato DD MONTH YYYY, DAY,
mas em vez de exibir somente esses dados, vamos incluir o campo IDADE.
*/
SELECT NOME, IDADE, TO_CHAR(DATA_DE_NASCIMENTO, 'DD MONTH YYYY, DAY') FROM TABELA_DE_CLIENTES;

/*
No entanto, a idade é fixa na base. O ideal seria que fizéssemos uma conta entre a data de hoje
menos a data de nascimento da pessoa cliente.

Portanto, se colocarmos a operação SYSDATE - DATA_DE_NASCIMENTO e rodarmos a função, teremos
o número aproximado de meses entre o dia de hoje e a data de nascimento.
*/
SELECT NOME, IDADE, SYSDATE - DATA_DE_NASCIMENTO FROM TABELA_DE_CLIENTES;

--Se dividirmos essa operação por 365 dias ((SYSDATE - DATA_DE_NASCIMENTO)/365), teremos o número de anos:
SELECT NOME, IDADE, (SYSDATE - DATA_DE_NASCIMENTO)/365 FROM TABELA_DE_CLIENTES;

/*
Note que o nosso cadastro está errado. A Erica Carvalho, por exemplo, 
teria 27 anos segundo o cadastro, mas na verdade ela tem 31 (considerando as casas decimais,
vemos que ela está perto de fazer 32 anos, com 70% do ano 31 cumpridos).
O Fernando Cavalcante, que teria 18 anos pelo cadastro, na verdade tem 22.

Aplicando a operação, a representação da idade das pessoas clientes se torna dinâmica,
pois sempre utilizamos o SYSDATE diminuindo a DATA_DE_NASCIMENTO real.
*/

-- MONTHS_BETWEEN

/*
Se utilizarmos a função MONTHS_BETWEEN no código, retornaremos o número de meses
entre a data do sistema e a data de nascimento das pessoas clientes.
*/
SELECT MONTHS_BETWEEN(SYSDATE, DATA_DE_NASCIMENTO) FROM TABELA_DE_CLIENTES;

/*
Se quisermos ver a idade, basta dividir (SYSDATE, DATA_DE_NASCIMENTO) por 12. Acrescentando o NOME e a IDADE, 
teremos um resultado semelhante ao anterior, porém utilizando uma função diferente.
*/
SELECT MONTHS_BETWEEN(SYSDATE, DATA_DE_NASCIMENTO)/12 FROM TABELA_DE_CLIENTES;

-- ADD_MONTHS

/*
Nós também podemos adicionar meses à data, utilizando a função ADD_MONTHS. 
Por exemplo: após a função, trouxemos o SYSDATE e adicionamos 10 meses.
*/
SELECT ADD_MONTHS(SYSDATE, 10) FROM DUAL;

/*
Essa função é muito interessante quando temos um sistema que quer calcular, por exemplo, o vencimento de uma fatura.

Suponha que essa fatura vença daqui a 8 meses; qual é então a data específica de vencimento? Podemos testar isso!
*/


-- NEXT_DAY

/*
Se utilizarmos a função NEXT_DAY com o SYSDATE e escrevermos, por exemplo, SEXTA,
será retornada a primeira sexta-feira após hoje.
*/
SELECT NEXT_DAY(SYSDATE, 'SEXTA') FROM DUAL;

/*
Colocando o SYSDATE antes do resultado da função aplicada, teremos o resultado do dia de hoje 
na primeira coluna e a próxima sexta-feira na segunda coluna.
*/
SELECT SYSDATE, NEXT_DAY(SYSDATE, 'SEXTA') FROM DUAL;

-- LAST_DAY

/*
Se fizermos o mesmo processo, mas utilizando a função LAST_DAY do SYSDATE, será apresentado 
o último dia do mês em que estamos (nesse caso, o mês de maio).
*/
SELECT SYSDATE, LAST_DAY(SYSDATE) FROM DUAL;

-- TRUNC

/*
Utilizando a função matemática "truncate" (TRUNC) no SYSDATE, tendo o ano (YEAR) como parâmetro para truncar,
teremos como resultado sempre o primeiro dia do ano em questão.
*/
SELECT SYSDATE, TRUNC(SYSDATE, 'YEAR') FROM DUAL;

/*
Se somarmos, por exemplo, 200 dias ao SYSDATE, como estamos em maio de 2022, 
chegaremos a uma data próxima ao final do ano,
então a função TRUNC também retornará o primeiro dia de 2022.
*/
SELECT SYSDATE + 200, TRUNC(SYSDATE + 200, 'YEAR') FROM DUAL;

/*
No entanto, se utilizarmos o parâmetro MONTH em vez de YEAR, 
será retornado o primeiro dia do mês da data especificada no SYSDATE.
*/
SELECT SYSDATE + 200, TRUNC(SYSDATE + 200, 'MONTH') FROM DUAL;


-- ROUND

/*
Vamos analisar a diferença entre as funções TRUNC e ROUND?

Como SYSDATE + 200 corresponde a uma data de dezembro, ao aplicar a função ROUND no SYSDATE
com o parâmetro YEAR, será apresentado o primeiro dia do próximo ano.
Isso acontece por já termos passado da metade do ano.
*/
SELECT SYSDATE + 200, ROUND(SYSDATE + 200, 'YEAR') FROM DUAL;

/*
Se utilizarmos o SYSDATE normal, sem a soma de 200 dias, como estamos em maio, 
ainda não teremos ultrapassado a metade do ano.
Sendo assim, ao rodar a função, veremos o primeiro dia do ano atual.
*/
SELECT SYSDATE, ROUND(SYSDATE, 'YEAR') FROM DUAL;

/*
Portanto, a função ROUND irá depender da posição em que estamos no intervalo definido como parâmetro (exemplo:
YEAR, MONTH, DAY). Se tivermos ultrapassado a metade desse parâmetro, será retornada uma data do período seguinte;
caso contrário, será retornada uma data do período atual em que estamos.
*/
