% Tipos de grupos musculares
grupoMuscular(superiores).
grupoMuscular(inferiores).
grupoMuscular(costas).
grupoMuscular(peito).
grupoMuscular(abdomen).

% Níveis de dificuldade
nivel(iniciante).
nivel(intermediario).
nivel(avancado).

% Relaciona cada exercício com seu grupo muscular e nível de dificuldade
exercicio("flexao de bracos", peito, iniciante).
exercicio("supino reto", peito, iniciante).
exercicio("supino reto", peito, intermediario).
exercicio("supino reto", peito, avancado).
exercicio("flexao plantar", inferiores, iniciante).
exercicio("agachamento", inferiores, iniciante).
exercicio("stiff", inferiores, iniciante).
exercicio("cadeira extensora", inferiores, iniciante).
exercicio("cadeira extensora", inferiores, intermediario).
exercicio("panturrilha sentado", inferiores, iniciante).
exercicio("panturrilha sentado", inferiores, avancado).
exercicio("leg press", inferiores, iniciante).
exercicio("leg press", inferiores, intermediario).
exercicio("leg press", inferiores, avancado).
exercicio("agachamento na barra", inferiores, intermediario).
exercicio("flexora deitado", inferiores, intermediario).
exercicio("flexora deitado", inferiores, avancado).
exercicio("elevacao pelvica", inferiores, intermediario).
exercicio("elevacao pelvica", inferiores, avancado).
exercicio("elevacao de panturrilha", inferiores, intermediario).
exercicio("agachamento livre na barra", inferiores, avancado).
exercicio("bulgaro", inferiores, avancado).
exercicio("rosca direta", superiores, iniciante).
exercicio("rosca direta", superiores, intermediario).
exercicio("rosca direta", superiores, avancado).
exercicio("rosca martelo", superiores, iniciante).
exercicio("scott", superiores, intermediario).
exercicio("scott", superiores, avancado).
exercicio("21 na barra w", superiores, avancado).
exercicio("triceps corda", superiores, iniciante).
exercicio("triceps corda", superiores, intermediario).
exercicio("triceps corda", superiores, avancado).
exercicio("triceps na barra", superiores, iniciante).
exercicio("triceps no banco", superiores, intermediario).
exercicio("triceps na barra w", superiores, avancado).
exercicio("triceps nas paralelas", superiores, avancado).
exercicio("elevacao lateral", superiores, iniciante).
exercicio("desenvolvimento", superiores, intermediario).
exercicio("remada alta", superiores, avancado).
exercicio("supino vertical", peito, iniciante).
exercicio("supino vertical", peito, intermediario).
exercicio("fly", peito, intermediario).
exercicio("supino inclinado", peito, intermediario).
exercicio("crossover baixo", peito, intermediario).
exercicio("crossover", peito, avancado).
exercicio("supino declinado", peito, avancado).
exercicio("crucifixo reto", peito, avancado).
exercicio("remada articulada", costas, iniciante).
exercicio("puxada frontal", costas, iniciante).
exercicio("puxada frontal", costas, intermediario).
exercicio("puxada frontal", costas, avancado).
exercicio("pull down", costas, iniciante).
exercicio("barra fixa", costas, intermediario).
exercicio("serrote", costas, intermediario).
exercicio("serrote", costas, avancado).
exercicio("remada baixa", costas, intermediario).
exercicio("fly invertido", costas, intermediario).
exercicio("meio terra", costas, avancado).
exercicio("remada na maquina", costas, avancado).
exercicio("remada cavalinho", costas, avancado).
exercicio("prancha", abdomen, intermediario).
exercicio("abdominal na roda", abdomen, avancado).

% Define o número de séries pra cada nível de dificuldade
series(3, iniciante).
series(3-4, intermediario).
series(3-4, avancado).

% Define o número de repetições pra cada nível de dificuldade
repeticoes(10-12, iniciante).
repeticoes(8-12, intermediario).
repeticoes(10-15, avancado).
repeticoes(6-8, avancado).

% Predicado para recomendar exercícios com base no grupo muscular e nível de dificuldade informados
recomendaExercicios(Nivel, GrupoMuscular) :-
    nivel(Nivel),
    grupoMuscular(GrupoMuscular),
    series(Series, Nivel),
    repeticoes(Repeticoes, Nivel),
    findall(Exercicio, exercicio(Exercicio, GrupoMuscular, Nivel), Exercicios),
    nl, write("-------------------------------------------------------------------------------"), nl, nl,
    write("Exercícios de nível "), write(Nivel), write(" para o grupo muscular "), write(GrupoMuscular), nl,
    write("Fazer "), write(Series), write(" séries de "), write(Repeticoes), write(" repetições."), nl,
    write("Exercícios: "), nl,
    writeList(Exercicios).

% Predicado auxiliar para printar a lista de exercícios
writeList([]).
writeList([H|T]) :-
    write('* '), write(H), nl,
    writeList(T).

% Predicado principal para interação com o usuário
main :-
    write("Qual é o seu nível? (iniciante, intermediario, avancado): "), nl,
    read(Nivel),
    write("Qual grupo muscular deseja trabalhar? (superiores, inferiores, costas, peito, abdomen): "), nl,
    read(GrupoMuscular),
    recomendaExercicios(Nivel, GrupoMuscular).
