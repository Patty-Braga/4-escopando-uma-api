const express = require('express');
const usuarios = require('./controladores/usuarios')
const login = require('./controladores/login')
const verificaLogin = require('./filtros/verificaLogin');
const postagem = require('./controladores/postagens');

const rotas = express();

//cadastra usuários
rotas.post('/cadastro', usuarios.cadastrarUsuario);

//login
rotas.post('/login', login.login);

//filtro para verificar usuário
rotas.use(verificaLogin);

//obter e atualizar perfil de usuário logado
rotas.get('/perfil', usuarios.obterPerfil);
rotas.put('/perfil', usuarios.atualizarPerfil);

//postagens
rotas.post('/postagens', postagem.novaPostagem);
rotas.get('/postagens', postagem.feed);
rotas.post('/postagens/:postagemId/curtir', postagem.curtir);
rotas.post('/postagens/:postagemId/comentar', postagem.comentar);

module.exports = rotas;