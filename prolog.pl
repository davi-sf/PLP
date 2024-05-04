%Gera os primeiros N quadrados perfeitos.

quadrado_perfeito(0,_) :- !.
quadrado_perfeito(N, X) :- Quadrado is X * X, write(Quadrado), nl, NovoX is X+1, NovoN is N-1, quadrado_perfeito(NovoN, NovoX).
main :-
    read(N), quadrado_perfeito(N, 1),
    halt.

% Verifica se um numero é divisor ou ultimo digito de um numero
eh_divisor(N,D) :- Divisor is N mod D, UltimoDig is N mod 10,
    (Divisor =:=0, UltimoDig =:= D ->
        write(D), write(' eh ao mesmo tempo divisor e o ultimo digito de '), write(N);
        Divisor =:= 0 ->
            write(D), write(' eh divisor de '), write(N);
        UltimoDig =:= D ->
            write(D), write(' eh o ultimo digito de '), write(N);
            write(D), write(' nao eh ao mesmo tempo divisor e ultimo digito de '), write(N)).
main :-
    read(N), read(D), 
    ( number(N), N > 0,
    number(D), D > 0 , D < 10 -> 
    eh_divisor(N,D);
    write(' Input invalido.')),
    halt.


% Dado uma lista de numeros e um numero 'mestre' verifica se o numero mestre é compativel com algum da lista, em caso positivo
substitui o numero da lista por -1. Um número é "compatível" com o número mestre, se e somente se, ele é 
divísivel pelo número mestre OU o seu último dígito é igual ao número mestre.


numero_mestre([],_,[]).
numero_mestre([Head | Tail], Mestre, [Head |Resto]):-
    ( Mestre =< 0; Mestre >= 10 ),
    numero_mestre(Tail, Mestre, Resto).

numero_mestre([Head | Tail],Mestre,[NovoHead|Resto]):-
    ( Head mod Mestre =:= 0; Head mod 10 =:= Mestre ),
    NovoHead = -1,
    numero_mestre(Tail, Mestre, Resto).
    
numero_mestre([Head | Tail], Mestre, [Head | Resto]):-
    not((Head mod Mestre =:= 0; Head mod 10 =:= Mestre)),
    numero_mestre(Tail,Mestre,Resto).
    
main :-
    read(Lista),
    read(Mestre),
    numero_mestre(Lista, Mestre, NovaLista),
    write(NovaLista),
    halt.


% Dado uma lista de nomes, conta a quantidade de vogais 'a' em cada nome
conta_vogal_a([], 0).
conta_vogal_a([Head | Tail], QuantidadeVogalA):-
    atom_chars(Head, ListaCaracteres),
    conta_vogal_a_em_lista_caracteres(ListaCaracteres, ContadorAuxiliar),
    conta_vogal_a(Tail, NovoQuantidadeVogalA),
    QuantidadeVogalA is ContadorAuxiliar + NovoQuantidadeVogalA.

conta_vogal_a_em_lista_caracteres([], 0).
conta_vogal_a_em_lista_caracteres(['a'| LetrasRestantes], SomaA):-
    conta_vogal_a_em_lista_caracteres(LetrasRestantes, NovaSomaA),
    SomaA is 1 + NovaSomaA.
    
conta_vogal_a_em_lista_caracteres([_| Resto], SomaA):-
    conta_vogal_a_em_lista_caracteres(Resto, NovaSomaA),
    SomaA is NovaSomaA.

main :-
    read(ListaNomes),
    conta_vogal_a(ListaNomes, QuantidadeVogais),
    write(QuantidadeVogais),
    nl,
    halt.

% Verifica se há elementos negativos em uma lista e retorna uma nova lista com os elementos passados para positovos.
deixa_positivo([],[]).
deixa_positivo([Head|Tail], [Head|NovaLista]):- Head >= 0,  deixa_positivo(Tail, NovaLista).
deixa_positivo([Head|Tail], [AbsHead|NovaLista]):- Head < 0, AbsHead is abs(Head), deixa_positivo(Tail, NovaLista).
main:-
    read(Lista),
    deixa_positivo(Lista, Resposta),
    write(Resposta).

% Soma os numeros positivos de uma lista.
sum_positivos([],0).
sum_positivos([Head|Tail], Soma):- Head > 0, sum_positivos(Tail, Resto), Soma is Head + Resto.
sum_positivos([Head|Tail], Soma):- Head =< 0, sum_positivos(Tail, Soma).
main:-
    read(Lista),
    sum_positivos(Lista, Resposta),
    write(Resposta).

% Soma todos os elementos de uma lista.
soma_nums([],0).
soma_nums([Head|Tail], Soma):- soma_nums(Tail, Rest), Soma is Head + Rest.
main:-
    read(Lista),
    soma_nums(Lista,Resultado),
    write(Resultado),
    halt.

