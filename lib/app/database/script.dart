final createTable = '''
CREATE TABLE especies(
  id_especies INT NOT NULL PRIMARY KEY
  ,nome VARHCAR(200)
  ,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
  ,status CHAR(1) NOT NULL DEFAULT 'A'
);

CREATE TABLE veterinario(
  id INT NULL PRIMARY KEY
  ,nome VARCHAR (2OO) NOT NULL
  ,telefone CHAR(16) NOT NULL
  ,email VARCHAR(200) NOT NULL
  ,cpf CHAR(14) NOT NULL
  ,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
  ,status CHAR(1) NOT NULL DEFAULT 'A'
);

CREATE TABLE dados(
  id_dados INT NOT NULL PRIMARY KEY
  ,id_especies INT NOT NULL PRIMARY KEY
  ,telefone CHAR(16) NOT NULL
  ,descricao VARCHAR(100) NOT NULL
  ,valor DECIMAL(6,2) NULL
  ,id_veterinario INT NOT NULL
  ,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
  ,status CHAR(1) NOT NULL DEFAULT 'A' 

  ,CONSTRAINT FK_Dados_veterinario FOREIGN KEY (id_veterinario) REFERENCES veterinarios (id_veterinario)
  ,CONSTRAINT FK_Dados_especies FOREIGN KEY (id_especies) REFERENCES especies (id_especies)
  
);
''';

final insert1 = '''
INSERT INTO especies (nome)
VALUES('Pastor Alemão')
''';

final insert2 = '''
INSERT INTO veterinario (nome,telefone,email,cpf)
VALUES('Redrigo','4411111111','rodrigo@outlook.com','12312312312')
''';

final insert3 = '''
INSERT INTO dados (id_especies,telefone,descricao, valor,id_veterinario)
VALUES('1','4422222222,'Castração',20.00,'1')
''';
