final createTable = '''
CREATE TABLE dados(
  id INT NOT NULL PRIMARY KEY
  ,raca VARCHAR(20) NOT NULL
  ,telefone CHAR(16) NOT NULL
  ,descricao VARCHAR(100) NOT NULL
  ,valor DECIMAL(6.2) NULL
  ,data_cadastro DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
  ,status CHAR(1) NOT NULL DEFAULT 'A' 
);
''';

final insert = '''
INSERT INTO dados (raca,telefone,descricao, valor,)
VALUES('gata','4422222222,'Castração',20.00,'1')
''';
