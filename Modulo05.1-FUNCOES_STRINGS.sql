-- Funções de String - NA TEORIA


/*
-- LOWER
Começaremos pela função LOWER, que converte todo um texto em letras minúsculas. 
Assim, se aplicarmos o LOWER a um texto escrito com letras maiúsculas e minúsculas, ele será todo convertido para letras minúsculas.

-- UPPER
O UPPER faz o oposto: transforma todo o texto em letras maiúsculas.

-- INITCAP
O INITCAP torna maiúscula só a primeira letra de cada palavra do texto.

Um exemplo prático de uso da INITCAP é quando temos um banco de dados com uma coluna que contém nomes próprios.
Digamos que uma tela de entrada de dados é a fonte que alimenta cada linha da tabela com nomes, que são digitados por pessoas.

Pode ser que a pessoa digite o nome com maiúsculas ou minúsculas iniciais:
algumas preencherão o nome todo com letras maiúsculas, outras, com letras minúsculas.
Outras ainda colocarão letras maiúsculas e minúsculas dentro do próprio texto.

Para padronizar, podemos aplicar o LOWER sobre este campo e, em seguida, aplicamos o 
INITCAP sobre o resultado do LOWER. Assim, colocaremos tudo em minúscula primeiro
para depois deixar as iniciais maiúsculas. Assim, teremos todos os nomes com a primeira letra maiúscula.

É uma forma de ajustar cadastros de clientes ou alguma outra informação descritiva
que precisa ser padronizada com todas as primeiras letras maiúsculas.

-- CONCAT
A CONCAT concatena todas as informações. Podemos ter um campo com o nome de uma pessoa 
cliente e outro campo (coluna da tabela) com o sobrenome.

Com isso, digamos que eu queira criar uma única coluna com o nome e sobrenome juntos.
Neste caso, rodamos a função CONCAT para concatenar o campo do nome, seguido de um espaço em branco e unido ao sobrenome.

O resultado será um campo único com essas três informações concatenadas, ou seja, unidas, dentro do texto final.

-- LPAD
A LPAD acrescenta caracteres na frente do texto.

Digamos que eu passe como parâmetro uma função que aplica espaços de 40 caracteres sobre um determinado texto.

Se, por exemplo, o texto que faz parte do campo tiver apenas 5 caracteres, ele será preenchido
com 35 espaços em branco para que o texto final tenha 40 caracteres ao todo.
Já se o texto tiver 15 caracteres, serão criados 25 espaços em branco.

Porém, não precisamos preencher o texto apenas com espaços em branco por meio do LPAD.
Podemos especificar um caractere específico.

Neste caso, o LPAD repetirá aquele caractere quantas vezes for possível para que o
texto final tenha um tamanho especificado, unindo o caractere escolhido e o restante do texto.

-- RPAD
A função RPAD faz o oposto: em vez de concatenar os strings ou espaços na frente do nome,
ele o faz no fim do nome. Muda apenas a posição onde os caracteres serão inseridos.

-- SUBSTR
A função SUBSTR retira trechos de um texto maior. Por exemplo, quando queremos
retirar o sobrenome do nome completo de uma pessoa.

-- INSTR
O INSTR testa se uma determinada cadeia de caracteres está contida no texto.
Se essa cadeia não existir, a função voltará o valor 0, mas se ela existir, 
a função retornará a posição em que a cadeia de caracteres começa.

Por exemplo, temos uma tabela com nomes e queremos saber se algum nome tem o sobrenome "Silva".
Aplicamos a função INSTR e, se o resultado obtido for 0, isso quer dizer que não existe o nome Silva.
Se o número for diferente de zero, o sobrenome Silva pertence ao nome contido na posição apontada.

-- LTRIM
A função LTRIM retira espaços à esquerda do caractere. Se temos um string alguns
espaços em branco, por exemplo, antes de começar o texto, podemos usar 
o LTRIM para retirar os espaços em branco do início do valor do campo original.

-- RTRIM
O RTRIM retira espaços em branco à direita do campo.

-- TRIM
O TRIM retira espaços em branco da esquerda e da direita do campo.

-- TRANSLATE
A função TRANSLATE traduz determinados caracteres de um nome para outros caracteres. 
Podemos dizer que toda letra "A" de um nome pode ser substituída por um asterisco.

-- REPLACE
A função REPLACE faz algo similar à TRANSLATE, mas em vez de trabalhar com um caractere específico,
ela traduz uma cadeia de caracteres. Podemos, por exemplo, substituir todo sobrenome "Silva"
presente em uma base de dados por "Machado".

Essas são as principais funções do tipo texto, mas existem muitas outras. 
*/