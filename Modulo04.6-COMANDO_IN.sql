-- Subconsultas no comando IN

--vamos fazer daquela forma mais rebuscada, com hard code. Será um SELECT DISTINCT do campo BAIRRO da tabela de vendedores.
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

--Vamos pegar esse resultado com os nomes dos bairros, copiar e colar logo abaixo do código.

/*
Desse modo, podemos aplicar uma nova seleção de todos os campos (*) da TABELA_DE_CLIENTES 
que tem o nome do bairro igual a esse resultado. Ou seja, depois do nome da tabela, 
usamos WHERE seguido do campo BAIRRO e o comando IN.

Vamos abrir e fechar parênteses entre os nomes dos bairros.
E lembre-se de colocar vírgulas para separar cada bairro e aspas simples limitando as opções. 
Termine com o ponto e vírgula.
*/
SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO IN (
'Tijuca',
'Jardins',
'Copacabana',
'Santo Amaro');

--poderíamos rodar a primeira consulta (sem o ponto e vírgula e entre parênteses) dentro do IN:

SELECT * FROM TABELA_DE_CLIENTES WHERE BAIRRO IN
(SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES);