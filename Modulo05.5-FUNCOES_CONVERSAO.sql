-- Funções de conversão

-- EXTRACT

/*
Outra função bem importante é a EXTRACT. Ela extrai um pedaço da data, 
que pode ser o ano, mês, dia, hora, minuto e assim por diante.
*/

EXTRACT( { YEAR
         | MONTH
         | DAY
         | HOUR
         | MINUTE
         | SECOND
         | TIMEZONE_HOUR
         | TIMEZONE_MINUTE
         | TIMEZONE_REGION
         | TIMEZONE_ABBR
         }
         FROM { expr }
       )
--Por exemplo, se aplicarmos o YEAR extraímos o ano da data.


-- TO_NUMBER

--Ele converte um texto string em número.
TO_NUMBER(expr [ DEFAULT return_value ON CONVERSION ERROR ]
  [, fmt [, 'nlsparam' ] ])
  
/*
Além disso, assim como no TO_CHAR, que podemos colocar o formato de saída da conversão, 
podemos fazer o mesmo no TO_NUMBER, ou seja, converter a forma que o número será exibido.

Existem algumas formas de representação de saída do número:

9 - Posição numérica - Ex: 9999 - 1234

0 - Zeros antes do número - Ex: 009999 = 001234

$ - Símbolo de moeda - Ex: $9999 = $1234

. - Usar o ponto como separador - EX: 9999.99 = 1234.12

, - Usar a vígula como separador - Ex: 9999,99 = 1234,12

MI - Símbolo negativo do lado direito do número

PR - Número negativo em parênteses

EEEE - Notação científica
*/


-- NVL

--A função NVL testa se o valor é nulo. Se for, ele converte o resultado em um determinado valor.
NVL(expr1, expr2)


-- GREATEST

--No caso do GREATEST, se tivermos uma série de números separados por vírgula ele vai dizer qual é o número maior.
GREATEST(expr [, expr ]...)


-- Aplicando a função EXTRACT

/*
Agora, vamos colocar em prática essas novas funções que aprendemos, começando pela EXTRACT. Para isso, criamos um novo script.

Prmeiro escrevemos SELECT EXTRACT seguido de MONTH FROM. Usamos a função TO_DATE para 
converter a data, a data '12/11/2019' e especificamos o formato DD/MM/YYY. Por fim escrevemos FROM DUAL.
*/

SELECT EXTRACT(MONTH FROM TO_DATE('12/11/2019','DD/MM/YYYY')) FROM DUAL;

-- Assim, temos o seguinte resultado: 11

--Vamos mudar a conversão da data para MM/DD/YYYY, ou seja, mês/dia/ano.

SELECT EXTRACT(MONTH FROM TO_DATE('12/11/2019','MM/DD/YYYY')) FROM DUAL;

--Feito isso, nosso resultado é: 12

-- Aplicando a função TO_NUMBER

--Se rodarmos o SELECT e o caractere '10' + 10, seguido de FROM DUAL, dessa forma:
SELECT '10' + 10 FROM DUAL;

--Temos como resultado: 20
--Isso, pois o Oracle consegue entender o caractere 10 do número 10, fazendo uma conversão explicita.

--Se aplicarmos o TO_NUMBER ele vai funcionar da mesma forma.
SELECT TO_NUMBER('10') + 10 FROM DUAL;

--Chegando ao mesmo resultado: 20

-- Vamos testar com o TO_CHAR para números, para isso rodamos o seguinte código:
SELECT TO_CHAR(1234.123, '9999') FROM DUAL;
--Isso gera o resultado:1234

-- Mas, se mudarmos esse formato para ''999.999, da seguinte maneira:
SELECT TO_CHAR(1234.123, '9999.999') FROM DUAL;
--Teremos um resultado em formato decimal: 1234.123

-- Se utilizarmos '9999,999', com vírgula:
SELECT TO_CHAR(1234.123, '9999,999') FROM DUAL;
--Nosso resultado é exibido no formato decimal de vírgula. 1,234


-- Aplicando a função NVL

--Vamos aplicar a função NVL aos números 10,0.
SELECT NVL(10,0) FROM DUAL;
--Como não temos um valor nulo, nosso resultado é: 10

--Testaremos essa função com null, 0.
SELECT NVL(null,0) FROM DUAL;
--Como nosso valor é nulo, o resultado é o seguinte: 0

-- NVL e FULL JOIN

/*
Também podemos usar o NVL no FULL JOIN, como fizemos anteriormente.

Primeiro escrevemos SELECT, FROM e FULL JOIN em linhas separadas para montar o comando.

Na linha abaixo de FROM escrevemos TABELA_DE_VENDEDORES TV e abaixo de FULL JOIN digitamos TABELA_DE_CLIENTES TC

Abaixo de SELECT escrevemos quatro linhas de código. Na primeira TV.NOME AS NOME_VENDEDOR,
na segunda TV.BAIRRO AS NOME_BAIRRO_VENDEDOR, seguido de TC.NOME AS NOME_CLIENTE e TV.BAIRRO AS NOME_BAIRRO_CLIENTE.

Por fim, escrevemos ON TV.BAIRRO = TC.BAIRRO abaixo de TABELA_DE_CLIENTES TC.
*/

SELECT
TV.NOME AS NOME_VENDEDOR,
TV.BAIRRO AS NOME_BAIRRO_VENDEDOR,
TC.NOME AS NOME_CLIENTE,
TC.BAIRRO AS NOME_BAIRRO_CLIENTE
FROM
TABELA_DE_VENDEDORES TV
FULL JOIN
TABELA_DE_CLIENTES TC
ON TV.BAIRRO = TC.BAIRRO;


/*
Como utilizamos o FULL JOIN temos resultados nulos. Para corrigir, podemos
aplicar o NVL com a mensagem NÃO ENCONTRADO em todos os campos, da seguinte forma:
*/

SELECT
NVL(TV.NOME,'NÃO ENCONTRADO') AS NOME_VENDEDOR,
NVL(TV.BAIRRO,'NÃO ENCONTRADO') AS NOME_BAIRRO_VENDEDOR,
NVL(TC.NOME,'NÃO ENCONTRADO') AS NOME_CLIENTE,
NVL(TC.BAIRRO,'NÃO ENCONTRADO') AS NOME_BAIRRO_CLIENTE
FROM
TABELA_DE_VENDEDORES TV
FULL JOIN
TABELA_DE_CLIENTES TC
ON TV.BAIRRO = TC.BAIRRO;

--Esse é um exemplo prático do uso do NVL para definirmos uma mensagem ao invés de deixar como nulo.