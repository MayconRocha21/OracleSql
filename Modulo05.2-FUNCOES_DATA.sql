-- Funções de datas

/*
Antes de ver as funções principais do Oracle para datas, vamos entender como ele armazena as datas internamente.

Ele armazena uma data como um número, composto por

7 dígitos na sua parte inteira: ANO + MÊS + DIA
6 dígitos na parte decimal: HORAS + MINUTOS + SEGUNDOS
Digamos que queremos armazenar no Oracle o dia 4 de setembro de 2002, especificamente às 19 horas, 30 minutos e 23 segundos. Teremos:

20020904,193023

O fato de armazenar as datas internamente como números decimais nos permite fazer algumas operações aritméticas simples com elas:

Podemos, por exemplo, pegar uma data e somar a um número, adicionando número de dias à data:

DATA + NÚMERO

Também podemos subtrair um número da data, diminuindo os dias:

DATA - NÚMERO

Podemos subtrair uma data de outra, resultando no número de dias entre as duas:

DATA - DATA

Podemos adicionar ou diminuir horas de uma data, bastando pegar esse número e dividi-lo por 24:

DATA +/- (NUMERO/24)

Sabendo como as datas são armazenadas, vamos ver as funções do Oracle específicas para data.

Funções de formato

-- Função TO_CHAR
A TO_CHAR vai pegar aquela data armazenada dentro do Oracle e convertê-la em texto. 
Esse texto será a data exibida num dado formato, determinado por você por meio de alguns símbolos aplicados na função.

Esse formato pode ser "dia/mês/ano", "ano/mês/dia", ano com dois dígitos, com quatro dígitos,
a hora de 0 a 12 ou 0 a 24, e assim por diante.

-- Função TO_DATE
Essa função converte uma data em texto para o formato de data. Ou seja, ela faz o inverso de TO_CHAR.

Precisamos passar para TO_DATE os mesmos símbolos de formato de data que usamos no TO_CHAR. Porém, 
aqui vamos representar a forma com que o texto está exibindo a data.

Ambas as funções utilizam esse tipo de símbolos que representam as datas.

-- Símbolos
Na documentação do Oracle, vemos que o número de símbolos é muito maior do que o que mostraremos a seguir.
Falaremos dos principais por enquanto.

D - Dia da semana
DD - Dia do mês
DDD - Número do dia no ano
DAY - Dia por extenso
MM - Mês do ano
MON - Mês abreviado (jan., feb., mar., ...)
MONTH - Mês por extenso
YYYY - Ano com 4 dígitos
YY - Ano com 2 dígitos
Símbolo separador da data

/ * , ; ou um texto qualquer
HH - Hora com dois dígitos
HH12 - Hora de 0 a 12
HH24 - Hora de 0 a 24
MI - Minuto
SS - Segundo
É com esses símbolos que montamos a representação do formato da data a ser convertida, 
de número para string ou de string para número. Usamos os mesmos critérios na função TO_CHAR e TO_DATE.

-- Função SYSDATE
Essa função nos apresenta a hora e o dia marcados pelo computador onde está o Oracle. Ou seja: 
são a hora e o dia do momento.

O SYSDATE é muito usado, por exemplo, quando queremos gravar dados no banco de dados junto da hora 
e do dia em que aqueles dados foram gravados.

-- Função MONTHS_BETWEEN
Com essa função, pegamos duas datas e apresentamos o número de meses entre elas. 
Esse resultado pode ser positivo ou negativo, a depender se a data inicial for maior ou menor que a data final.

Se representarmos essa data com horas, minutos e segundos, pode ser que esse resultado seja
um número com casas decimais, como "300,99987 meses".

-- Função ADD_MONTHS
Com o ADD_MONTHS, pegamos uma data e inserimos o número de meses que queremos adicionar a essa data. 
Esse número de meses pode ser positivo ou negativo.

-- Função NEXT_DAY
Essa função nos devolve o próximo dia da semana a partir de uma determinada data. Então, 
se colocarmos uma data e escrever o número do dia na semana ou o nome do dia da semana,
ele nos dará a data desse dia a partir da data que especificamos.

Por exemplo: se colocarmos a data "01/01/2000" e escrevermos "sexta-feira" ou o número "6",
essa função nos retornará a data da próxima sexta-feira a partir do dia primeiro de janeiro de 2000.

-- Função LAST_DAY
Essa função nos devolve o último dia do mês da data especificada em seu parâmetro. Então,
se especificarmos "15/01/2000", receberemos "31/01/2000".

-- Função TRUNC (date)
É como se essa função "truncasse" uma data. Ou seja: ele vai, por exemplo, pegar uma data com a hora,
minuto e segundo e converter para apenas data. É como se ele tirasse a parte decimal da representação interna da data.

Quando queremos comparar duas datas que, internamente, são armazenadas com horas, minutos e segundos,
essa função é bastante importante.

-- Função ROUND (date)
Essa função "arredonda" a data. Então, dependendo do período em que queremos aplicar o arredondamento,
a função vai pegar o primeiro ou último dia do intervalo trabalhado. Isso depende da data
estar antes ou depois do dia 15, a metade do mês.

Ou seja: antes do dia 15, devolve-se o primeiro dia do mês; depois do dia 15, devolve-se o último dia do mês.
*/