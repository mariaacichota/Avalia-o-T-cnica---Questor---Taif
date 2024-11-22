-- 1. Script de criação das tabelas
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(100),
    CPF CHAR(11),
    DataCadastro DATE
);

CREATE TABLE Carros (
    CarroID INT PRIMARY KEY IDENTITY(1,1),
    Modelo NVARCHAR(100),
    DataLancamento DATE
);

CREATE TABLE Vendas (
    VendaID INT PRIMARY KEY IDENTITY(1,1),
    ClienteID INT,
    CarroID INT,
    DataVenda DATE,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (CarroID) REFERENCES Carros(CarroID)
);

-- 2. Quantidade de vendas do carro Marea
SELECT COUNT(*) AS QuantidadeVendasMarea
FROM Vendas v
JOIN Carros c ON v.CarroID = c.CarroID
WHERE c.Modelo = 'Marea';

-- 3. Quantidade de vendas do carro Uno por cliente
SELECT cl.Nome, COUNT(*) AS QuantidadeVendasUno
FROM Vendas v
JOIN Carros c ON v.CarroID = c.CarroID
JOIN Clientes cl ON v.ClienteID = cl.ClienteID
WHERE c.Modelo = 'Uno'
GROUP BY cl.Nome;

-- 4. Quantidade de clientes que não efetuaram venda
SELECT COUNT(*) AS ClientesSemVenda
FROM Clientes cl
LEFT JOIN Vendas v ON cl.ClienteID = v.ClienteID
WHERE v.VendaID IS NULL;

-- 5. Clientes sorteados
SELECT TOP 15 cl.ClienteID, cl.Nome
FROM Vendas v
JOIN Clientes cl ON v.ClienteID = cl.ClienteID
JOIN Carros c ON v.CarroID = c.CarroID
WHERE cl.CPF LIKE '0%' -- CPF começa com 0
  AND YEAR(c.DataLancamento) = 2021 -- Data de lançamento de 2021
  AND (
      SELECT COUNT(*) FROM Vendas v2 WHERE v2.ClienteID = cl.ClienteID AND v2.CarroID = c.CarroID
  ) = 1 -- Cliente não comprou mais de um Marea;

-- 6. Excluir vendas que não sejam dos clientes sorteados
DELETE v
FROM Vendas v
LEFT JOIN (
    SELECT TOP 15 cl.ClienteID
    FROM Vendas v
    JOIN Clientes cl ON v.ClienteID = cl.ClienteID
    JOIN Carros c ON v.CarroID = c.CarroID
    WHERE cl.CPF LIKE '0%'
      AND YEAR(c.DataLancamento) = 2021
      AND (
          SELECT COUNT(*) FROM Vendas v2 WHERE v2.ClienteID = cl.ClienteID AND v2.CarroID = c.CarroID
      ) = 1
) Sorteados ON v.ClienteID = Sorteados.ClienteID
WHERE Sorteados.ClienteID IS NULL;
