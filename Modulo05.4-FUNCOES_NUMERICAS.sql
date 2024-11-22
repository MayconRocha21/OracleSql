-- Funções numéricas


--Vamos conhecer algumas funções numéricas analisando as páginas de Ajuda do Oracle.

/*
ROUND (number)
O ROUND faz o arredondamento dos números. Se a casa decimal for maior que cinco o 
arredondamento é feito para cima, se for menor, para baixo.

Por exemplo, se tivermos o número 5,4 e utilizarmos o ROUND o resultado será 5. Já, se o número for 5,7 teremos o resultado 6.

ROUND(n [, integer ])
TRUNC (number)
A função TRUNC sempre faz o arredondamento para baixo. Sendo assim, se tivermos o número 5,2 ou 5,9 o resultado será 5.

TRUNC(date [, fmt ])
CEIL
Já o CEIL é o oposto, o arredondamento sempre é feito para cima. Sendo assim, se o número for 5,2 ou 5,8 o resultado será 6.

CEIL(n)
FLOOR
O FLOOR pega o primeiro número inteiro antes da casa decimal, ou seja, funciona assim como o TRUNC.

FLOOR(n)
POWER
O POWER retorna o valor da expressão especificada para a potência indicada. Sendo assim, se tivermos POWER (10, 2) teremos 10².

POWER(n2, n1)
EXP
A função EXP retorna e elevado à enésima potência, de forma com que e = 2,71828183... .
A função retorna um valor do mesmo tipo do argumento.

EXP(n)
SQRT
O SQRT retorna a raiz quadrada de n.

SQRT(n)
SIGN
O SIGN retorna três valores diferente. Se o número for negativo ele devolve -1, 
se for núlo devolve 0 e se o número for positivo devolve 1.

SIGN(n)
ABS
A função ABS sempre deixa o número positivo. Isso significa que o valor absoluto de 10 é 10 e o valor absoluto de -10 também é 10.

ABS(n)
MOD
O MOD retorna o restante de n2 dividido por n1 e se n1 for 0 retorna n2.

MOD(n2, n1)
Além dessas também existem outras funções matemáticas, como:

LOG(M,N) - Logaritmo de base m de n;

SIN(n) - Seno de n;

SINH(n) - Seno hiperbólico de n;

TAN(n) - Tangente de n;

COS(n) - Cosseno de n;

COSH(n) - Cosseno hiberbólico de n;
*/