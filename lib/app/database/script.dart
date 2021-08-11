final createTable = '''
CREATE TABLE contact(
  id INTEGER PRIMARY KEY AUTOINCREMENT
  ,raca VARCHAR(20) NOT NULL
  ,telefone CHAR(16) NOT NULL
  ,descricao VARCHAR(100) NOT NULL
  ,valor DECIMAL(6,2) NULL
  ,data_cadastro DATETIME DEFAULT CURRENT_TIMESTAMP
  ,status CHAR(1) DEFAULT 'A' 
);
''';

final insert = '''
INSERT INTO contact (raca,telefone,descricao, valor)
VALUES('gata','4422222222','Castração',20.00);
''';
