--1) No Oracle SQL Developer, crie um novo script, clicando no ícone Planilha SQL e em CONEXAO MAQUINA LOCAL.

--2) Execute o código para ver conteúdo da tabela:
SELECT EMBALAGEM FROM TABELA_DE_PRODUTOS;

--3) Algumas respostas se repetem.

--4) Para evitar a repetição das linhas, use o DISTINCT no comando:
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS;

--5) Aplique um filtro no código:
SELECT DISTINCT EMBALAGEM FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Maca';

--6) Use o DISTINCT com mais de um campo:
SELECT DISTINCT EMBALAGEM, SABOR FROM TABELA_DE_PRODUTOS;

--7) Crie um novo script e execute o código:
SELECT * FROM TABELA_DE_PRODUTOS;

--8) Use o comando ROWNUM no código:
SELECT ROWNUM, TABELA_DE_PRODUTOS.* FROM TABELA_DE_PRODUTOS;

--9) O código abaixo tem a mesma resposta da anterior:
SELECT ROWNUM, TP.* FROM TABELA_DE_PRODUTOS TP;

--10) Limite o resultado para cinco linhas:
SELECT ROWNUM, TP.* FROM TABELA_DE_PRODUTOS TP WHERE ROWNUM <= 5;

--11) Pode usar o código abaixo para o mesmo resultado:
SELECT TP.* FROM TABELA_DE_PRODUTOS TP WHERE ROWNUM <= 5;

--12) O seguinte comando não funciona:
SELECT TP.* FROM TABELA_DE_PRODUTOS TP WHERE ROWNUM >= 2 AND ROWNUM <= 3;

--13) Agora, use o comando ORDER BY para ordenar a visualização.
--14) Usando o comando ORDER BY para ordenar pelo campo PRECO_DE_LISTA:
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA;

--15) Para inverter a visualização, mostrando o valor descendente, execute:
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY PRECO_DE_LISTA DESC;

--16) Para ordenar alfabeticamente pelo nome do produto:
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY NOME_DO_PRODUTO;

--17) Se desejar, você pode criar um ordenamento dentro de um ordenamento:
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM, NOME_DO_PRODUTO;

--18) Use um critério de ordenação diferente:
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO;

--19) Se quiser usar os dois critérios como descendentes:
SELECT * FROM TABELA_DE_PRODUTOS ORDER BY EMBALAGEM DESC, NOME_DO_PRODUTO DESC;

--20) Crie um script novo para trabalhar com o comando GROUP BY.
--21) Execute o código para visualizar a TABELA_DE_CLIENTES:
SELECT * FROM TABELA_DE_CLIENTES;

--22) Execute o código para mostrar as linhas:
SELECT CIDADE, IDADE FROM TABELA_DE_CLIENTES ORDER BY CIDADE, IDADE;

--23) Use o DISTINCT:
SELECT DISTINCT CIDADE, IDADE FROM TABELA_DE_CLIENTES ORDER BY CIDADE, IDADE;

--24) Use o GROUP BY para visualizar dentro de determinado critério de agregação:
SELECT CIDADE, SUM(IDADE) FROM TABELA_DE_CLIENTES GROUP BY CIDADE ORDER BY CIDADE;

--25) Some o critério de agregação em dois campos:
SELECT CIDADE, SUM(LIMITE_DE_CREDITO), SUM(IDADE) FROM TABELA_DE_CLIENTES GROUP BY CIDADE;

--26) Você pode achar o produto mais caro de cada embalagem:
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

--27) Use o comando COUNT para contar a quantidade dos produtos ordenados por embalagem.
SELECT EMBALAGEM, COUNT(*) FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM ORDER BY EMBALAGEM

--28) Você pode incluir o campo SABOR na busca:
SELECT EMBALAGEM, COUNT(*) FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja' 
GROUP BY EMBALAGEM ORDER BY EMBALAGEM;

--29) Use um Alias no GROUP BY:
SELECT EMBALAGEM, COUNT(*) AS NUMERO_DE_PRODUTOS FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja' 
GROUP BY EMBALAGEM ORDER BY EMBALAGEM;

--30) Crie uma nova janela de script e visualiza a TABELA_DE_CLIENTES:
SELECT * FROM TABELA_DE_CLIENTES;

--31) Para olhar o limite de crédito por estado, execute:
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES GROUP BY ESTADO;

--32) Aplique o comando HAVING:
SELECT ESTADO, SUM(LIMITE_DE_CREDITO) FROM TABELA_DE_CLIENTES 
GROUP BY ESTADO
HAVING SUM(LIMITE_DE_CREDITO) >= 900000;

--33) Para mostrar grupos de embalagem:
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS GROUP BY EMBALAGEM;

--34) Se quiser visualizar somente produtos que custem mais do que 10 reais, use o filtro:
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS 
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM;

--35) Use o comando HAVING para filtrar:
SELECT EMBALAGEM, MAX(PRECO_DE_LISTA) AS MAIOR_PRECO, MIN(PRECO_DE_LISTA) AS MENOR_PRECO
FROM TABELA_DE_PRODUTOS 
WHERE PRECO_DE_LISTA >= 10
GROUP BY EMBALAGEM
HAVING MAX(PRECO_DE_LISTA) >= 20;

--36) Crie uma nova janela de script para visualizar a TABELA_DE_PRODUTOS:
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA
FROM TABELA_DE_PRODUTOS;

--37) Use o código para selecionar os registros de acordo com o vídeo:
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
    END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
WHERE SABOR = 'Manga';

--38) Ordenando a visualização, você terá o código:
SELECT NOME_DO_PRODUTO, PRECO_DE_LISTA,
(CASE WHEN PRECO_DE_LISTA >= 12 THEN 'PRODUTO CARO'
    WHEN PRECO_DE_LISTA >= 7 AND PRECO_DE_LISTA < 12 THEN 'PRODUTO EM CONTA'
    ELSE 'PRODUTO BARATO'
    END) AS CLASSIFICACAO
FROM TABELA_DE_PRODUTOS
ORDER BY CLASSIFICACAO;


/*
Nessa aula, você aprendeu:

Como alterar a visualização dos resultados do SELECT.
Os conceitos dos comandos DISTINCT, ROWNUM, ORDER BY, GROUP BY, COUNT e HAVING, e como aplicá-los junto ao SELECT.
*/
