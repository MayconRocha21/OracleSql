-- Comando LIKE

/*
Para campos em que queremos buscar por apenas uma parte do texto, podemos 
utilizar, ao invés do =, o comando LIKE.

Esse comando nos permite realizar uma comparação não exata, trazendo resultados
como limão. Para isso usamos %Limao.
*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Limao';

/*
Dessa forma, por meio do LIKE, temos como resultado os mesmos produtos que 
apareceram anteriormente nos sabores Lima/Limao e Morango/Limao.

Agora vamos testar utilizando%Maca%. O sinal de porcentagem no início e no fim 
trará todo item com um outro sabor antes e depois da palavra maça.
*/

SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Maca%';

/*
Se utilizarmos o símbolo de porcentagem somente no fim, como morango%, teremos 
resultados com o sabor Morango e Morango/Limao.
*/
SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE 'Morango%';

/*
Se fizermos o oposto e definirmos o símbolo de porcentagem somente no início, %Morango, 
teremos somente o resultado que traz como sabor somente "Morango".
*/

SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE '%Morango';

/* 
Segmentar ainda mais a busca também podemos adicionar outra expressão lógica
como AND EMBALAGEM = 'PET'.
*/

SELECT * FROM TABELA_DE_PRODUTOS WHERE SABOR LIKE 'Morango%' AND EMBALAGEM = 'PET';

/*
Nessa aula, você aprendeu:

O comando SELECT.
A usar filtros com o comando SELECT.
O que são filtros quantitativos e lógicos e como aplicá-los.
O uso de LIKE e BETWEEN nos comandos SELECT.
*/