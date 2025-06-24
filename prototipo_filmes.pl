%Filmes(titulo, Generos, Ano, Diretor, Atores, Avaliacao, Clas_Et)

filme('Pulp Fiction', [crime, drama], 1994, 'Quentin Tarantinom', ['John Travolta', 'Uma Thurman', 'Samuel L. Jackson'], 8.9, 18).
filme('O rei leao', [aventura, animacao, familia], 1994, 'Roger Ellers', ['matthew broderick', 'jeremy irons', 'james earl jones'], 8.5, 0).
filme('Interestelar', [ficcao, drama, aventura], 2014, 'Christopher Nolan', ['Matthew macConaughey', 'Anne Hathaway', 'jessica Chastain'], 8.6, 12).
filme('Parasitas', [suspense, drama], 2019, 'Bong Joon-ho', ['Song Kang-ho', 'Choi Woo-shik'], 8.5, 16).
filme('Toy Story', [animacao, aventura, familia], 1995, 'John Lasseter', ['Tom Hanks', 'Tim Allen', 'Don Rickles'], 8.3,0).
filme('Gladiador', [acao, aventura, drama], 2000, 'Ridley Scott', ['Russell Crowe', 'Joaquin Phoenix', 'Connie Nielsen'], 8.5, 25).
filme('Um lugar silencioso', [terror, suspense, drama], 2018, 'John Krasinski', ['Emily Blunt', 'John Krasinsk', 'Millicent Simmonds'], 7.5, 22).
filme('A origem', [ficcao, acao, suspense], 2010, 'Christopher Nolan', ['Leonardo Dicaprio', 'Joseph Gordon-levitt'], 9, 14).
filme('Titanic', [romance, drama], 1997, 'James Cameron', ['Leonardo Dicaprio', 'Kate Winslet'], 9, 12).
filme('Vingadores: ultimato', [acao, aventura, ficcao], 2019, 'Anthony Russo', ['Robert Downey Jr', 'Chris Evans'], 8, 12).
filme('Shrek', [animacao, comedia, aventura], 2001, 'Andrew Adamson', ['Mike Mayers', 'Edmar Marphy'], 8, 0).
filme('Homem-aranha', [acao, aventura], 2002, 'Sam Raimi', ['Tobey Maguire'], 7, 10).
filme('A bela e a fera', [fantasia, romance, animacao], 1991, 'Gary Trousdale', ['Paige Ohara'], 8, 0).
filme('Os incriveis', [animacao, acao, aventura], 2004, 'Brad Bird', ['Craig T. Nelson'], 8, 0).
filme('Matrix', [acao, ficcao, suspense], 1999, 'Lana Wachowski', ['Keanu Reeves', 'Laurence Fishburne'], 9, 24).

%fim de filmes

%***********************************
%inicio de usuarios

usuario(eva, 20, [acao, ficcao, suspense], ['Quentin Tarantinom', 'Christopher Nolan'], ['Leonardo Dicaprio', 'Uma Thurman', 'Samuel L. Jackson'], ['Matrix', 'Titanic']).
usuario(joao, 25, [aventura, animacao, comedia], ['John Lasseter', 'Andrew Adamson'], ['Tom Hanks', 'Mike Mayers'], ['Toy Story', 'Shrek']).
usuario(maria, 30, [drama, romance, suspense], ['James Cameron', 'Bong Joon-ho'], ['Kate Winslet', 'Song Kang-ho'], ['Titanic', 'Parasitas']).
usuario(pedro, 18, [ficcao, acao, aventura], ['Christopher Nolan', 'Anthony Russo'], ['Robert Downey Jr', 'Laurence Fishburne'], ['Matrix', 'Vingadores: ultimato']).
usuario(ana, 15, [animacao, fantasia, familia], ['Gary Trousdale', 'Brad Bird'], ['Paige Ohara', 'Craig T. Nelson'], ['A bela e a fera', 'Os incriveis']).
usuario(lucas, 22, [terror, suspense, drama], ['John Krasinski', 'Ridley Scott'], ['Emily Blunt', 'Russell Crowe'], ['Um lugar silencioso', 'Gladiador']).

%recomendar(Filme, Genero, Idade).
recomendar(Filme, Genero, IdadeUsuario) :- 
    filme(Filme, Generos, _, _, _, _, Classificacao),
    membro(Genero, Generos),
    IdadeUsuario >= Classificacao.

% Regra auxiliar
membro(X, [X|_]).
membro(X, [_|T]) :- membro(X, T).

% Verifica se um filme pertence a um genero
filme_genero(Titulo, Genero) :-
    filme(Titulo, Generos, _, _, _, _, _),
    membro(Genero, Generos).

% Verifica se um ator esta no elenco principal de um filme
filme_ator(Titulo, Ator) :-
    filme(Titulo, _, _, _, Atores, _, _),
    membro(Ator, Atores).

% Verifica se o usuario nao assistiu ao filme
filme_nao_assistido(Usuario, Titulo) :-
    usuario(Usuario, _, _, _, _, Assistidos),
    \+ membro(Titulo, Assistidos).

% Regras de recomendacao baseadas em criterios especificos
recomenda_por_genero(Usuario, Titulo) :-
    usuario(Usuario, _, GenerosFav, _, _, _),
    membro(Genero, GenerosFav),
    filme_genero(Titulo, Genero).

recomenda_por_diretor(Usuario, Titulo) :-
    usuario(Usuario, _, _, DiretoresFav, _, _),
    filme(Titulo, _, _, Diretor, _, _, _),
    membro(Diretor, DiretoresFav).

recomenda_por_ator(Usuario, Titulo) :-
    usuario(Usuario, _, _, _, AtoresFav, _),
    membro(Ator, AtoresFav),
    filme_ator(Titulo, Ator).

% Regra Principal de Recomendacao
recomenda_filme(Usuario, Titulo) :-
    % Garante que o filme e o usuario existem
    filme(Titulo, _, _, _, _, Avaliacao, Classificacao),
    usuario(Usuario, Idade, _, _, _, _),

    % Filtros basicos
    filme_nao_assistido(Usuario, Titulo),
    Avaliacao >= 7.0, % Avaliacao minima de 7.0
    Idade >= Classificacao, % Adequado para a idade

    % O filme deve corresponder a PELO MENOS UMA das preferencias
    (   recomenda_por_genero(Usuario, Titulo);
        recomenda_por_diretor(Usuario, Titulo);
        recomenda_por_ator(Usuario, Titulo)
    ).


