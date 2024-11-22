--Para aplicar as funções numéricas criamos um script e definimos o seguinte código:

SELECT 3.4 FROM DUAL;

-- ROUND

--Vamos acrescentar a função ROUND nesse código.
SELECT ROUND(3.4) FROM DUAL;

--Vamos aplicar o ROUND no número 3.6.
SELECT ROUND(3.6) FROM DUAL;

--E se o número for 3.5? A função arredonda para baixo ou para cima?
SELECT ROUND(3.5) FROM DUAL;
--Isso significa que se a casa decimal for igual ou maior que cinco, arredonda-se para cima. Se for menor que cinco, arredonda-se para baixo.

-- TRUNC

--Vamos aplicar essa função no número 3.4.
SELECT TRUNC(3.4) FROM DUAL;

--Vamos mudar o número para 3.6
SELECT TRUNC(3.6) FROM DUAL;


--E se utilizarmos o número 3.5:
SELECT TRUNC(3.5) FROM DUAL;
--Temos essa resolução, pois o TRUNC sempre faz o arredondamento para baixo.

-- CEIL

--Vamos aplicar CEIL para o número 3.4.
SELECT CEIL(3.4) FROM DUAL;

--Aplicando essa função no número 3.6:
SELECT CEIL(3.6) FROM DUAL;

--Se aplicarmos essa função no número 3.5:
SELECT CEIL(3.5) FROM DUAL;

-- FLOOR

--Se aplicarmos FLOOR em todas as funções, dessa forma:
SELECT FLOOR(3.4) FROM DUAL;

SELECT FLOOR(3.6) FROM DUAL;

SELECT FLOOR(3.5) FROM DUAL;

--Como ela é igual a função TRUNC, teremos o mesmo resultado em todas


-- POWER

--Vamos aplicar o POWER no número 10,4.
SELECT POWER(10,4) FROM DUAL;

--Se utilizarmos o número 34, dessa forma:
SELECT POWER(34,4) FROM DUAL;

-- EXP

--Vamos testar o EXP elevando-o para a quarta potência do número exponencial.
SELECT EXP(4) FROM DUAL;

-- SQRT

--Agora, aplicamos a SQRT, a raiz quadrada, no número 144.
SELECT SQRT(144) FROM DUAL;

SELECT SQRT(10) FROM DUAL;


-- ABS

--Se aplicarmos o valor absoluto no número 10:
SELECT ABS(10) FROM DUAL;

SELECT ABS(-10) FROM DUAL;
--O resultado também é o mesmo, afinal, ela transforma o resultado em positivo.


-- MOD

--Se aplicarmos o MOD no 10 ,6:
SELECT MOD(10, 6) FROM DUAL;
