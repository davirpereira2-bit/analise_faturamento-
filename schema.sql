CREATE TABLE categorias (
id_ SERIAL PRIMARY KEY ,
nome VARCHAR (50) NOT NULL UNIQUE
);


CREATE TABLE produtos (
id_ SERIAL PRIMARY KEY ,
nome VARCHAR (100) NOT NULL , 
categoria_id INTEGER NOT NULL REFERENCES categorias(id_) ON DELETE RESTRICT ,
preco_unitario NUMERIC (10,2) NOT NULL CHECK (preco_unitario > 0)
);

CREATE TABLE clientes ( 
id_ SERIAL PRIMARY KEY , 
nome VARCHAR (50) NOT NULL ,
email VARCHAR (150) NOT NULL UNIQUE , 
cidade VARCHAR (100) NOT NULL ,
estado CHAR (2)  NOT NULL , 
data_cadastro DATE NOT NULL DEFAULT CURRENT_DATE

);



CREATE TABLE pedidos (
id_ SERIAL PRIMARY KEY , 
cliente_id INT NOT NULL REFERENCES clientes(id_) ON DELETE RESTRICT,
data_pedido DATE NOT NULL , 
	status VARCHAR(10) NOT NULL DEFAULT 'pendente' 
	CHECK (status IN ('pago', 'cancelado', 'pendente'))



);
 


CREATE TABLE itens_pedido (
id_ 		SERIAL PRIMARY KEY ,
pedido_id 	INTEGER NOT NULL REFERENCES pedidos(id_) ON DELETE CASCADE ,
produtos_id  INTEGER NOT NULL REFERENCES produtos(id_) ON DELETE RESTRICT ,
quantidade INTEGER NOT NULL CHECK (quantidade > 0),
preco_unitario NUMERIC (10,2) NOT NULL CHECK (preco_unitario > 0)



);



--para correçao de alguns erros 



ALTER TABLE categorias   RENAME COLUMN id_ TO id;
ALTER TABLE produtos     RENAME COLUMN id_ TO id;
ALTER TABLE clientes     RENAME COLUMN id_ TO id;
ALTER TABLE pedidos      RENAME COLUMN id_ TO id;
ALTER TABLE itens_pedido RENAME COLUMN id_ TO id;

ALTER TABLE itens_pedido RENAME COLUMN produtos_id TO produto_id;
ALTER TABLE clientes     ALTER COLUMN nome TYPE VARCHAR(100);