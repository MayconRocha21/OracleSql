--SINTAXE SELECT

-- SELECT
-- <Lista de campos> ou *
-- FROM
-- <Nome da Tabela>

/*
COMENTARIO EM BLOCO
*/

SELECT * FROM TABELA_DE_CLIENTES;

SELECT CPF, NOME, BAIRRO, CIDADE FROM TABELA_DE_CLIENTES;

-- Adicionando o comando Alias AS - funciona como um apelido para alterar o nome da coluna
SELECT CPF AS IDENTIFICADOR, NOME AS, BAIRRO, CIDADE FROM TABELA_DE_CLIENTES
SELECT CPF AS IDENTIFICADOR, NOME AS "NOME DE CLIENTE", BAIRRO, CIDADE FROM TABELA_DE_CLIENTES TDC;

/*
Outra forma de consulta simples é dar um alias para o nome da tabela, 
adicionando TDC após a TABELA_DE_CLIENTES.

Se não colocarmos as áspas duplas e utilizamos os espaços, estamos dizendo que essa tabela se chama TDC.
*/
SELECT CPF AS IDENTIFICADOR, NOME AS "NOME DE CLIENTE", BAIRRO, CIDADE FROM TABELA_DE_CLIENTES TDC;