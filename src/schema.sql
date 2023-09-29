--CREATE DATABASE mini_insta;

DROP TABLE IF EXISTS usuarios;

DROP TABLE IF EXISTS postagens;

DROP TABLE IF EXISTS postagem_fotos;

DROP TABLE IF EXISTS postagem_comentarios;

DROP TABLE IF EXISTS postagem_curtidas;

CREATE TABLE usuarios (
	id SERIAL PRIMARY KEY,
  nome TEXT,
  username TEXT NOT NULL UNIQUE,
  email TEXT UNIQUE,
  site TEXT,
  bio TEXT,
  genero TEXT,
  senha TEXT NOT NULL,
  perfil_oficial boolean DEFAULT FALSE
);

CREATE TABLE postagens (
	id SERIAL PRIMARY KEY,
  usuario_id INT NOT NULL,
  data TIMESTAMPTZ DEFAULT NOW(),
  texto TEXT, 
  FOREIGN KEY (usuario_id) REFERENCES usuarios (id)
);

CREATE TABLE postagem_fotos (
	id SERIAL PRIMARY KEY,
  postagem_id INT NOT NULL,
  imagem TEXT NOT NULL, 
  FOREIGN KEY (postagem_id) REFERENCES postagens (id)
);

CREATE TABLE postagem_comentarios (
	id SERIAL PRIMARY KEY,
  texto TEXT NOT NULL,
  data TIMESTAMPTZ DEFAULT NOW(),
  usuario_id INT NOT NULL,
  postagem_id INT NOT NULL,
  FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
  FOREIGN KEY (postagem_id) REFERENCES postagens (id)  
);


CREATE TABLE postagem_curtidas (
  usuario_id INT NOT NULL,
  postagem_id INT NOT NULL,
  data TIMESTAMPTZ DEFAULT NOW(),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
  FOREIGN KEY (postagem_id) REFERENCES postagens (id)
);