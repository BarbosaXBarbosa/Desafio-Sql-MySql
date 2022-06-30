# Liste as músicas que possuem a letra "z" no título
SELECT *
FROM cancao
WHERE titulo LIKE '%z%';

# Liste as músicas que têm a letra "a" como segundo caractere e a letra "s" como último caractere.
SELECT *
FROM cancao
WHERE titulo LIKE '_a%s';

# Mostre a lista de reprodução que contém mais músicas, renomeando as colunas, colocando em maiúscula a primeira letra, os acentos 
SELECT *
FROM playlist;

SELECT *
FROM playlistxcancao;

SELECT * 
FROM cancao;


## A playlist que mais tem musicas:
SELECT idPlaylist
FROM playlistxcancao
GROUP BY idPlaylist
ORDER BY COUNT(idPlaylist) DESC
LIMIT 1;


## Eu acho que é isso né kkkk
SELECT 
A.IdPlaylist,
B.titulo
FROM playlistxcancao A INNER JOIN cancao B
ON A.Idcancao = B.Idcancao
WHERE IdPlaylist = (SELECT idPlaylist 
					FROM playlistxcancao 
                    GROUP BY idPlaylist
					ORDER BY COUNT(idPlaylist) DESC
					LIMIT 1);


# Em outro momento, obtenha uma lista com os 5 usuários mais jovens, a partir dos próximos 10 registros.
SELECT *
FROM usuario
ORDER BY Data_nac DESC
LIMIT 5 OFFSET 10;


# Liste as 5 músicas com mais reproduções, em ordem decrescente.
SELECT *
FROM cancao
ORDER BY qtdreproducao DESC
LIMIT 0, 5;

# Gere um relatório de todos os álbuns em ordem alfabética.
SELECT *
FROM album
ORDER BY titulo;

# Liste todos os álbuns que não possuem imagem, organizados em ordem alfabética.
SELECT *
FROM album
WHERE imagemcapa IS NULL
ORDER BY titulo;

# 9. Insira um novo usuário com os seguintes dados (leve em consideração os relacionamentos):
#		a)	nomeusuario: novousuariodespotify@gmail.com
# 		b)	Nome e sobrenome: Elmer Santos
# 		c)	password: S4321m
# 		d)	Data de nacimiento: 15/11/1991
#  		e)	Sexo: Masculino
# 		f)	Código Postal: B4129ATF
# 		g)	País: Brasil


SELECT *
FROM usuario;

INSERT INTO usuario 
(idUsuario, 
Nomeusuario, 
NomeCompleto, 
Data_nac,
sexo,
Cod,
Pais_idPais)
VALUES 
(20,
'novousuariodespotify@gmail.com',
'Elmer Santos',
'1991-11-15',
'M',
'B4129ATF',
9);

# 10. Exclua todas as músicas do gênero "pop" da tabela generoxcancao.
SELECT *
FROM generoxcancao;

DELETE 
FROM generoxcancao
WHERE IdGenero = 9;

# 11. Edite todos os artistas que não possuem uma imagem carregada e carregue para eles o texto "Imagem em falta" na coluna de imagens.
SELECT *
FROM artista;

SET SQL_SAFE_UPDATES=0;
UPDATE

artista
SET imagem ='Imagem em falta'
WHERE imagem IS NULL;
SET SQL_SAFE_UPDATES=1;