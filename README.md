# Nosso mini instagram

## O que o aplicativo pode fazer
- Fazer Login;
- Fazer Cadastro;
- Ver os dados do perfil;
- Editar o Perfil:
- Ver postagens de outras pessoas;
  - Ver quantidade de curtidas em uma postagem
  - Ver comentários em uma postagem
  - Comentar Postagens de outras pessoas;
- Curtir Postagens de outras pessoas;
- Postar conteúdo;

## O que o aplicativo não pode fazer
- Ver a localização de uma postagem;
- Ver pessoas que curtiram as postagens;
- Curtir um comentário;
- Comentar um outro comentário

---

## Endpoints

---

### POST - Login

#### Dados Enviados
- username
- senha
- token

#### Dados retornados
- sucesso / erro

### Objetivos gerais
- Validar username e a senha
- Buscar o usuário no banco de dados
- Verificar se a senha informada está correta
- Gerar o token de autenticação
- Retornar os dados do usuário e o token

---

## Cadastro

### POST - Cadastro

#### Dados Enviados
- username
- senha

#### Dados retornados
- sucesso / erro

### Objetivos gerais
- Validar username e a senha
- Verificar se o username já existe no banco de dados
- Criptografar a senha
- Cadastrar o usuário no banco de dados
- Retornar sucesso ou erro


---

### GET - Perfil

#### Dados Enviados
- Token (terá id ou username)

#### Dados retornados
- URL da foto
- Nome
- Username
- Site
- Bio
- Email
- Telefone
- Gênero

### Objetivos gerais
- Validar o token do usuário
- Buscar o cadastro do usuário com a informação do token
- Retornar os dados do usuário

___

### PUT - Perfil

#### Dados Enviados
- Token (terá id ou username)
- URL da foto
- Nome
- Username
- Site
- Bio
- Email
- Telefone
- Gênero
- Senha

#### Dados retornados
- sucesso / erro

### Objetivos gerais
- Validar o token do usuário
- Buscar o cadastro do usuário com a informação do token
- Exigir ao menos um campo para ser atualizado:
  - URL da foto
  - Nome
  - Username
  - Site
  - Bio
  - Email
  - Telefone
  - Gênero
  - Senha
- Criptografar a senha, caso for informada
- Verificar se o email e o username são únicos, se for informado
- Atualizar o registro do usuário no banco de dados
- Retornar sucesso ou erro

---

### GET - Postagens

#### Dados Enviados
- Token (terá id ou username)
- offset

#### Dados retornados
- Postagens []
  - id
  - foi curtido por mim
  - texto
  - Usuário
    - URL da foto
    - username
    - é perfil oficial
  - Fotos []
    - URL da foto
  - quantidade de curtidas
  - Comentários []
    - username
    - texto
  - data

### Objetivos gerais
- Validar o token do usuário
- Buscar o cadastro do usuário com a informação do token
- retornar postagens de outras pessoas

---

### POST - Postagens

#### Dados Enviados
- Token (terá id ou username)
- texto
- fotos []

#### Dados retornados
- sucesso ou erro

### Objetivos gerais
- Validar o token do usuário
- Buscar o cadastro do usuário com a informação do token
- Exigir que seja informado, ao menos, uma foto no array
- Cadastrar postagem para o usuário logado
- Cadastro das fotos da postagem
- retornar sucesso ou erro

---


### POST - Curtir

#### Dados Enviados
- Token (terá id ou username do usuário)
- id da postagem

#### Dados retornados
- sucesso ou erro

### Objetivos gerais
- Validar o token do usuário
- Buscar o cadastro do usuário com a informação do token
- Buscar o cadastro da postagem com o id informado
- Verificar se o usuário já curtiu a postagem
- Cadastrar a curtida da postagem no banco de dados
- retornar sucesso ou erro

---

### POST - Comentar

#### Dados Enviados
- Token (terá id ou username do usuário)
- id da postagem
- texto

#### Dados retornados
- sucesso ou erro


### Objetivos gerais
- Validar o token do usuário
- Buscar o cadastro do usuário com a informação do token
- Validar o texto
- Buscar a postagem pelo id informado
- cadastrar comentário
- retornar sucesso ou erro