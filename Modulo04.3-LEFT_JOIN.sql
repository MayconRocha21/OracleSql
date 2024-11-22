-- LEFT JOIN
/*
Quem já comprou na empresa
Agora, queremos saber quais clientes efetuaram pelo menos uma compra.

Como queremos juntar a tabela de clientes com a tabela de notas fiscais, 
vamos escrever TABELA_DE_CLIENTES e alias TC após FROM. Depois, vamos juntá-la com a 
tabela NOTAS_FISCAIS com alias NF após INNER JOIN.
*/

SELECT
TC.CPF AS CPF_DO_CADASTRO,
TC.NOME AS NOME_DO_CLIENTE,
NF.CPF AS CPF_NOTAS_FISCAIS
FROM TABELA_DE_CLIENTES TC
INNER JOIN NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF;

/*
Podemos aplicar o comando DISTINCT após SELECT e antes de TC.CPF. 
Assim, serão exibidas só as combinações existentes.
*/

SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO,
TC.NOME AS NOME_DO_CLIENTE,
NF.CPF AS CPF_NOTAS_FISCAIS
FROM TABELA_DE_CLIENTES TC
INNER JOIN NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF;

/*
Agora, quantos clientes temos no cadastro?
Vamos fazer um SELECT seguido de COUNT(*) para contar todos os campos da TABELA_DE_CLIENTES.

Quando colocamos COUNT sem especificar nenhum campo de agrupamento, não é preciso colocar o GROUP BY.
*/

SELECT COUNT(*) FROM TABELA_DE_CLIENTES;

--Quem nunca comprou na empresa

-- COMANDO INSERT INSERE MAIS UM DADO NA TABELA SELECIONADA

INSERT INTO TABELA_DE_CLIENTES 
(CPF, NOME, ENDERECO_1, ENDERECO_2, BAIRRO, CIDADE, ESTADO, CEP, DATA_DE_NASCIMENTO, IDADE, 
GENERO, LIMITE_DE_CREDITO, VOLUME_DE_COMPRA, PRIMEIRA_COMPRA) 
VALUES ('23412632331', 'Juliana Silva', 'R. Tramandai', '', 'Bangu', 'Rio de Janeiro', 
'RJ', '23400000', TO_DATE('1989-02-04','YYYY-MM-DD'), 28, 'F', 180000.0000, 24500, 0);

/*
Copiamos a consulta que fizemos com SELECT DISTINCT. E, ao invés do INNER JOIN,
usamos LEFT JOIN. O LEFT JOIN vai trazer todo mundo da tabela de clientes e 
só quem existe na tabela de notas fiscais.
*/

SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO,
TC.NOME AS NOME_DO_CLIENTE,
NF.CPF AS CPF_NOTAS_FISCAIS
FROM TABELA_DE_CLIENTES TC
LEFT JOIN NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF;


/*
Se rodamos o comando com o LEFT JOIN, teremos 16 clientes. Contudo, a Juliana Silva
tem o campo CPF_NOTAS_FISCAIS nulo, porque ela não fez nenhuma compra. 
Então, o CPF cadastrado da Juliana não aparece em nenhuma nota fiscal.

Como só queremos saber quem são os clientes que nunca compraram, podemos aplicar o filtro WHERE.

Após a linha ON, adicionamos WHERE seguido do campo NF.CPF e depois acrescentamos IS NULL.
Com isso, exibiremos somente quem tem o campo CPF da tabela de notas fiscais como nulo (IS NULL).
*/

SELECT DISTINCT
TC.CPF AS CPF_DO_CADASTRO,
TC.NOME AS NOME_DO_CLIENTE,
NF.CPF AS CPF_NOTAS_FISCAIS
FROM TABELA_DE_CLIENTES TC
LEFT JOIN NOTAS_FISCAIS NF
ON TC.CPF = NF.CPF
WHERE NF.CPF IS NULL;