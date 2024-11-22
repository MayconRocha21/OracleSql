-- UNION

/*
A união (UNION) soma o resultado de duas ou mais consultas, desde que respeite algumas regras.
O requisito é que o resultado das duas consultas que fazem parte da união deve trazer:

O mesmo número de campos selecionados;
Os mesmos tipos de campos, além de respeitar a ordem de declaração dos mesmos.
*/


-- vamos rodar SELECT DISTINCT do campo BAIRRO da tabela de clientes.
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES;

--Em seguida, vamos rodar SELECT DISTINCT do campo BAIRRO da tabela de vendedores.
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

/*
vamos pegar essas duas consultas e colocar um UNION entre elas. 
Lembre-se de tirar o ponto e vírgula da primeira consulta.
*/
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;


-- UNION ALL

/*
se colocamos UNION ALL na mesma consulta, o resultado terá 16 bairros, 
que é justamente a soma dos 12 bairros da tabela de clientes com os 4 bairros da tabela de vendedores.
*/
SELECT DISTINCT BAIRRO FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO FROM TABELA_DE_VENDEDORES;

--Vamos repetir esse processo para colocar uma constante 'FORNECEDOR' AS ORIGEM após BAIRRO e vírgula na segunda seleção.
SELECT DISTINCT BAIRRO, 'CLIENTE' AS ORIGEM FROM TABELA_DE_CLIENTES
UNION ALL
SELECT DISTINCT BAIRRO, 'FORNECEDOR' AS ORIGEM FROM TABELA_DE_VENDEDORES;
