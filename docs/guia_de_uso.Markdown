Guia de Uso do Sistema de Recomendação de Filmes em Prolog
=========================================================

Este guia explica como utilizar o sistema de recomendação de filmes implementado no arquivo prototipo.pl. Aqui você encontrará exemplos de consultas e dicas para explorar as funcionalidades do programa.

1. Carregar o Programa
----------------------
Abra seu interpretador Prolog (ex: SWI-Prolog) e carregue o arquivo:
?- [prototipo].

2. Consultar Filmes por Gênero e Idade
--------------------------------------
Para encontrar filmes de um determinado gênero e para uma idade específica:
?- recomendar(Filme, Genero, IdadeUsuario).
Exemplo:
?- recomendar(F, acao, 18).

3. Consultar se um Filme pertence a um Gênero
---------------------------------------------
?- filme_genero('Matrix', acao).

4. Consultar se um Ator está em um Filme
----------------------------------------
?- filme_ator('Matrix', 'Keanu Reeves').

5. Consultar se um Usuário não assistiu a um Filme
--------------------------------------------------
?- filme_nao_assistido(eva, 'Shrek').

6. Recomendações Personalizadas para Usuários
---------------------------------------------
Para obter recomendações de filmes para um usuário, considerando suas preferências, idade e filmes já assistidos:
?- recomenda_filme(Usuario, Filme).
Exemplo:
?- recomenda_filme(eva, F).

7. Consultar Preferências de Usuários
-------------------------------------
Para ver as preferências de um usuário:
?- usuario(Nome, Idade, Generos, Diretores, Atores, Assistidos).
Exemplo:
?- usuario(maria, Idade, Generos, Diretores, Atores, Assistidos).

8. Dicas Gerais
---------------
- Use a tecla ";" para ver mais resultados nas consultas.
- As listas de gêneros, diretores, atores e assistidos podem ser consultadas diretamente nos fatos.
- Para adicionar novos filmes ou usuários, siga o formato dos fatos já existentes.

9. Exemplos de Consultas Avançadas
----------------------------------
- Encontrar todos os filmes de um diretor:
  ?- filme(Titulo, _, _, 'Christopher Nolan', _, _, _).
- Listar todos os filmes que um ator participou:
  ?- filme_ator(Titulo, 'Leonardo Dicaprio').
- Ver todos os filmes recomendados para um usuário maior de 15 anos:
  ?- recomenda_filme(ana, F).

10. Observações
---------------
- O sistema considera apenas filmes com avaliação igual ou superior a 7.
- A idade do usuário deve ser igual ou superior à classificação etária do filme.
- O filme não pode estar na lista de assistidos do usuário para ser recomendado.