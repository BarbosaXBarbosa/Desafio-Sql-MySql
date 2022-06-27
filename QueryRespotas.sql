
# 1- Lista com nomes e descrição das categorias de produtos vendidos pelo e-market
SELECT CategoriaNome, Descricao
FROM categorias;

--------------------------------------------------------------------------------------------------------------------------------------------------------

# 2- Existem produtos descontinuados
SELECT ProdutoNome, Descontinuado FROM PRODUTOS
Where Descontinuado = 1;

## Resposta: Não.

--------------------------------------------------------------------------------------------------------------------------------------------------------

# 3- Na sexta-feira, você deve se reunir com o fornecedor nr. 8. Quais são os produtos que eles fornecem?
SELECT A.ProdutoNome, 
	   B.CategoriaID,
       B.CategoriaNome,
       A.ProvedorID
FROM PRODUTOS A LEFT JOIN CATEGORIAS B
ON B.CategoriaID = A.CategoriaID
WHERE ProvedorID = 8;

## Resposta: 4 produtos, Teatime Chocolate Biscuits, Sir Rodney's Marmalade, Sir Rodney's Scones, Scottish Longbreads

--------------------------------------------------------------------------------------------------------------------------------------------------------

# 4- Queremos saber todos os produtos cujo preço unitário se encontra entre 10 e 22.
SELECT ProdutoNome,
	   PrecoUnitario
FROM PRODUTOS
WHERE PrecoUnitario >=10 AND PrecoUnitario <=22;

--------------------------------------------------------------------------------------------------------------------------------------------------------

# 4- Fica definido que um produto deve ser solicitado ao fornecedor se suas unidades em estoque forem inferiores ao nível de reabastecimento. Existem produtos a solicitar?
SELECT ProdutoNome,
	   UnidadesEstoque,
       NivelReabastecimento
FROM PRODUTOS
WHERE UnidadesEstoque < NivelReabastecimento;

## Resposta: Sim.

--------------------------------------------------------------------------------------------------------------------------------------------------------

# 5- Você quer saber todos os produtos da lista anterior, mas que as unidades pedidas sejam iguais a zero.
SELECT ProdutoNome,
	   UnidadesEstoque,
       NivelReabastecimento
FROM PRODUTOS
WHERE UnidadesEstoque < NivelReabastecimento AND UnidadesPedidas = 0;

## Resposta: Nord-Ost Matjeshering tem zero unidades pedidas.

--------------------------------------------------------------------------------------------------------------------------------------------------------

# 6- Obtenha uma lista de todos os clientes com contato, empresa, cargo, País. Classifique a lista por país.
SELECT Contato,
		Empresa,
        Titulo,
        Pais
 FROM clientes
 ORDER BY Pais;
 
 --------------------------------------------------------------------------------------------------------------------------------------------------------
 
 # 7- Queremos atender todos os clientes que possuem o título de “Proprietário". Esse título estará em inglês (Owner).
SELECT Contato,
		Empresa,
        Titulo
FROM clientes
WHERE Titulo LIKE '%Owner';

 --------------------------------------------------------------------------------------------------------------------------------------------------------
 
 # 8- A operadora de telefonia atendeu um cliente e não lembra o nome dele. Sabe apenas que começa com "C". Podemos ajudá-lo a obter uma lista com todos os contatos que começam com a letra C?
 SELECT Contato,
		Telefone
 FROM clientes
 WHERE Contato LIKE 'C%';
 
 --------------------------------------------------------------------------------------------------------------------------------------------------------
 
 # 9- Obtenha uma lista de todas as faturas, ordenadas por data da fatura em ordem ascendente.
SELECT *
FROM faturas
ORDER BY DataFatura;

 --------------------------------------------------------------------------------------------------------------------------------------------------------
 
 # 10- Agora é necessário uma lista de faturas com o país de envio "EUA" e que a FormaeEnvio seja diferente de 3.
SELECT *
FROM faturas
WHERE PaisEnvio LIKE 'USA' AND NOT FormaEnvio=3;

 --------------------------------------------------------------------------------------------------------------------------------------------------------
 
 # 11- O cliente 'GOURL' fez um pedido?
 SELECT *
FROM faturas
WHERE ClienteID LIKE 'GOURL';

## Resposta: Sim.

 --------------------------------------------------------------------------------------------------------------------------------------------------------
 
 # 12- Você deseja visualizar todas as faturas dos funcionários 2, 3, 5, 8 e 9.
 SELECT *
FROM faturas
WHERE EmpregadoID IN (2, 3, 5, 8, 9)
ORDER BY EmpregadoID;

 --------------------------------------------------------------------------------------------------------------------------------------------------------

#           Consultas Queries - Parte II

