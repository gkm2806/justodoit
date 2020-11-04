#language: pt

Funcionalidade: Login 
  Cenário: Usuário autenticado deve ser listas públicas
    Dado que testenildo conecta no app
    E existe uma lista pública
    E uma privada
    Quando entra com as suas credênciais
    Então ele deve ver somente a lista pública

  Cenário: Usuário com credenciais erradas deve receber erro
    Dado que testenildo conecta no app
    Quando ele digita a senha errada
    Então ele ver um erro na tela