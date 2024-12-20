-- REVISÃO


--1) No Oracle SQL Developer, abra uma nova janela de script.
--2) Clique no ícone da esquerda Novo, escolha a opção Arquivo de Banco de Dados e nomeie como 2580-video2.1.

--3) Digite com o comando abaixo para mostrar todos os campos da tabela TABELA_DE_CLIENTES:
SELECT * FROM TABELA_DE_CLIENTES;

--4) Clique no ícone Executar.
--5) Execute o comando abaixo para mostrar somente os quatro campos.
SELECT CPF, NOME, BAIRRO, CIDADE FROM TABELA_DE_CLIENTES;

--6) Trocando a ordem de visualização dos campos, execute o código:
SELECT NOME, CPF, CIDADE, BAIRRO FROM TABELA_DE_CLIENTES;

--7) Use alias para alterar o nome do campo ao ser mostrado. Execute o código:
SELECT CPF AS IDENTIFICADOR, NOME AS "NOME DE CLIENTE", BAIRRO, CIDADE FROM TABELA_DE_CLIENTES;

--8) Para dar um Alias para a tabela, execute o comando:
SELECT CPF AS IDENTIFICADOR, NOME AS "NOME DE CLIENTE", TDC.BAIRRO, CIDADE FROM TABELA_DE_CLIENTES TDC;

--9) Associe uma tabela para um Alias:
SELECT TDC.* FROM TABELA_DE_CLIENTES TDC;

--10) Clique no ícone da esquerda Novo, escolha a opção Arquivo de Banco de Dados e nomeie o script como 2580-video2.2.
--11) Para ver todas as linhas da tabela, execute o comando:
SELECT * FROM TABELA_DE_PRODUTOS;

--12) Execute o comando com o filtro WHERE 1=1:
SELECT * FROM TABELA_DE_PRODUTOS WHERE 1=1;

--13) Para mostrar a linha com o determinado código, execute o comando:
SELECT * FROM TABELA_DE_PRODUTOS WHERE CODIGO_DO_PRODUTO = '290478';

--14) Para mostrar um conjunto de campos, execute:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Laranja';

--15) Use o filtro no campo EMBALAGEM:
SELECT * FROM TABELA_DE_PRODUTOS WHERE EMBALAGEM = 'PET';

--16) O comando é case sensitive, então não funcionará:
SELECT * FROM TABELA_DE_PRODUTOS WHERE EMBALAGEM = 'pet';

--17) Para exercitar os filtros quantitativos, crie um novo script, chamado 2580-video2.3.
--18) Execute o comando:
SELECT * FROM TABELA_DE_CLIENTES;

--19) Para usar o filtro quantitativo, mostre clientes com mais de 20 anos:
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE > 20;

--20) Execute o comando abaixo para mostrar os clientes com menos de 20 anos:
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE < 20;

--21) Para mostrar os clientes que não tem 18 anos, execute o comando:
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE <> 18;

--22) Use datas para filtrar os registros que serão exibidos:
SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO >= '14/11/95';

--23) Para explicitar a data, execute o comando:
SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO >= TO_DATE('14/11/1995','DD/MM/YYYY');

--24) Usando a notação americana, execute o comando:
SELECT * FROM TABELA_DE_CLIENTES WHERE DATA_DE_NASCIMENTO >= TO_DATE('11/14/1995','MM/DD/YYYY');

--25) Se quiser mostrar dados entre limites, execute BETWEEN:
SELECT * FROM TABELA_DE_CLIENTES WHERE IDADE BETWEEN 17 AND 22;

--26) Execute o comando abaixo para mostrar os registros com letras em ordem alfabética depois de Lapa:
SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO >= 'Lapa';

--27) Para exercitar os filtros com expressões lógicas compostas, crie um novo script, chamado 2580-video2.5. Abra o ícone Planilha SQL e CONEXAO MAQUINA LOCAL.

--28) Entre com os comandos para verificar o uso das expressões lógicas:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' OR TAMANHO = '470 ml';
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' AND TAMANHO = '470 ml';

--29) Use o NOT com as expressões lógicas:
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' AND TAMANHO = '470 ml');
SELECT * FROM TABELA_DE_PRODUTOS WHERE NOT (SABOR = 'Manga' OR TAMANHO = '470 ml');

--30) Os comandos seguintes são equivalentes:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR = 'Manga' OR SABOR = 'Laranja' OR SABOR = 'Melancia';
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('Manga','Laranja','Melancia');

--31) Junte o IN com outra expressão lógica AND:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('Manga','Laranja','Melancia') AND TAMANHO = '1 Litro';

--32) Acompanhe as explicações dos comandos lógicos aplicados à tabela TABELA_DE_CLIENTES:
SELECT * FROM TABELA_DE_CLIENTES;
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro','Sao Paulo') AND IDADE >= 20;
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro','Sao Paulo') AND (IDADE >= 20 AND IDADE <= 25);
SELECT * FROM TABELA_DE_CLIENTES WHERE CIDADE IN ('Rio de Janeiro','Sao Paulo') AND (IDADE BETWEEN 20 AND 25);

--33) Crie um novo script, usando a TABELA_DE_PRODUTOS.
--34) Para ver todos os sabores que tem Lima/Limao ou Morango/Limao, execute o comando:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR IN ('Lima/Limao','Morango/Limao');

--35) Para ver todos os sabores que tem Limao no sabor, execute o comando:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Limao';

--36) Use o % nos comandos para buscar os registros com SABOR de Maca:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Maca%';

--37) Ao usar o % junto com o comando LIKE, podem ser mostrados resultados diferentes:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE 'Morango%';
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Morango';

--38) O AND pode ser usado junto com o LIKE, como no comando:
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE 'Morango%' AND EMBALAGEM = 'PET';



/*
Nessa aula, você aprendeu:

O comando SELECT.
A usar filtros com o comando SELECT.
O que são filtros quantitativos e lógicos e como aplicá-los.
O uso de LIKE e BETWEEN nos comandos SELECT.
*/