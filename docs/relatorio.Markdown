RELATÓRIO DO PROJETO: SISTEMA DE RECOMENDAÇÃO DE FILMES EM PROLOG
================================================================

1. INTRODUÇÃO
-------------
Este relatório apresenta o desenvolvimento de um sistema de recomendação de filmes implementado em Prolog. O projeto visa demonstrar a aplicação prática de conceitos de programação lógica para criar um sistema inteligente de sugestões de filmes baseado nas preferências dos usuários.

2. OBJETIVOS DO PROJETO
-----------------------
2.1 Objetivo Principal:
- Desenvolver um sistema de recomendação de filmes que considere múltiplos critérios para sugerir filmes adequados aos usuários.

2.2 Objetivos Específicos:
- Implementar uma base de dados de filmes com informações detalhadas
- Criar perfis de usuários com preferências personalizadas
- Desenvolver regras de recomendação baseadas em gêneros, diretores e atores
- Considerar critérios de idade e avaliação dos filmes
- Evitar recomendações de filmes já assistidos (opcional)

3. ESTRUTURA DO SISTEMA
-----------------------
3.1 Base de Dados de Filmes:
- 15 filmes inseridos na base de dados com informações completas.
- Cada filme contém: título, gênero (um ou mais), ano, diretor, atores, avaliação e classificação etária.
- Gêneros implementados: ação, aventura, animação, comédia, crime, drama, fantasia, ficção, família, romance, suspense, terror.

3.2 Perfis de Usuários:
- 6 usuários com perfis diferentes ou diversificados.
- Cada usuário possui: nome, idade, gêneros favoritos, diretores preferidos, atores admirados e lista de filmes assistidos.
- Faixa etária dos usuários: 15 a 30 anos.

3.3 Regras de Recomendação:
- Recomendação por gênero.
- Recomendação por diretor.
- Recomendação por ator.
- Filtros de idade e avaliação mínima (≥7.0).
- Verificação de filmes não assistidos.

4. IMPLEMENTAÇÃO TÉCNICA
------------------------
4.1 Linguagem e Paradigma:
- Linguagem: Prolog.
- Paradigma: Programação Lógica.
- Interpretador: SWI-Prolog.

4.2 Estrutura de Dados:
- Fatos: filme, usuario
- Regras: recomenda_filme, filme_genero, filme_ator, e outras.
- Predicados auxiliares: membro

4.3 Operadores e Conceitos Utilizados:
- Negação por falha: \+
- Disjunção: ;
- Conjunção: ,
- Recursão: membro
- Unificação de variáveis

5. FUNCIONALIDADES IMPLEMENTADAS
--------------------------------
5.1 Consultas Básicas:

- Listagem de filmes por gênero e idade.
- Verificação de gêneros de filmes.
- Verificação de atores em filmes.
- Consulta de filmes não assistidos.

5.2 Recomendações Personalizadas:

- Sistema principal de recomendação (recomenda_filme).
- Consideração de múltiplos critérios simultaneamente.
- Filtros automáticos de adequação.

5.3 Gestão de Usuários:

- Perfis personalizados.
- Histórico de filmes assistidos.
- Preferências múltiplas.

6. ANÁLISE DOS RESULTADOS
-------------------------
6.1 Pontos Fortes:

- Sistema flexível com múltiplos critérios.
- Estrutura de dados bem organizada.
- Regras lógicas claras e eficientes.
- Fácil expansão para novos filmes e usuários.

6.2 Limitações Identificadas:
- Base de dados limitada (15 filmes)
- Número reduzido de usuários (6)
- Dependência de dados manuais
- Ausência de interface gráfica

6.3 Correções Realizadas:
- Remoção de fatos desnecessários
- Correção da regra recomendar
- Padronização de nomes de filmes
- Eliminação de regras incompletas

7. EXEMPLOS DE USO
------------------
7.1 Consultas Básicas:
?- recomenda_filme(eva, Filme).
?- filme_genero('Matrix', acao).
?- filme_ator('Titanic', 'Leonardo Dicaprio').

7.2 Consultas Avançadas:
?- recomendar(F, acao, 18).
?- usuario(maria, Idade, Generos, Diretores, Atores, Assistidos).

8. CONCLUSÕES
-------------
8.1 Objetivos Alcançados:
- Sistema funcional de recomendação implementado
- Múltiplos critérios de recomendação funcionando
- Base de dados estruturada e consistente

8.2 Aprendizados:
- Aplicação prática de conceitos de Prolog
- Necessidade de documentação clara

8.3 Possíveis Melhorias:
- Interface gráfica de usuário
- Base de dados expandida

10. REFERÊNCIAS TÉCNICAS
------------------------
- SWI-Prolog Documentation
- Slides de E.D
- Slago-Prolog
- Recursos online de programação lógica

================================================================
Relatório elaborado em: 24/06/2025
Versão do Projeto: ...
Arquivo Principal: prototipo_filmes.pl
================================================================ 
