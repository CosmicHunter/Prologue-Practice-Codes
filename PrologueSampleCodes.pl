del(Y,[Y],[]).
del(X,[X|L],L).
del(X,[Y|L],[Y|Res]):-
    del(X,L,Res).

/* divide list into 2 sublists */
dividelist([],[],[]).
dividelist([X],[X],[]).
dividelist([X,Y|List],[X|List1],[Y|List2]):-
       dividelist(List,List1,List2).	

/* to find the intersection of the 2 lists */


intersection([X|L1],M,[X|Res]):-
      member(X,M),intersection(L1,M,Res).
intersection([X|L1],M,Res):-
    not(member(X,M)),intersection(L1,M,Res).
intersection([],M,[]).

member(X,[X|_]).
member(X,[_|List]):-
         member(X,List).

/* to find union of the two lists */
union([X|L1],L2,Res):-
    member(X,L2),union(L1,L2,Res).
union([X|L1],L2,[X|Res]):-
    not(member(X,L2)),union(L1,L2,Res).
union([],Z,Z).

/* to find the final element of list*/

lastelement([X],X).
lastelement([_|T],Res):-
    lastelement(T,Res).
/* to reverse a list */

revop([],[]).
revop([H|T],List):-
    revop(T,Res),append(Res,[H],List).

/* to sort a list */

sorted([X]).
sorted([X,Y|List]):-
      X<=Y,
      sorted([Y|List]).   



       qsort([H|T],Sorted):-
    partition(H,T,Less,Greater),
    qsort(Less,Sortedless),
    qsort(Greater,SortedGreater),
    append(Sortedless,[H|SortedGreater],Sorted).

partition(P,[H|T],[H|Less],Greater):-
        H =< P,
        partition(P,T,Less,Greater).
partition(P,[H|T],Less,[H|Greater]):-
        H > P,
        partition(P,T,Less,Greater).
partition(_,[],[],[]).

append([], List, List).
append([Head], List,  [Head | List]).
append([Head | Tail], List2, Ans) :- append(Tail, List2, RestAns), append([Head], RestAns, Ans).

/* tower of Hanoi in Prolog */
move(1,X,Y,_):-
  write(' Move top disk from '),
  write(X),
  write(' to '),
  write(Y),
  nl.
move(N,X,Y,Z):-
  N>1,
  M is N-1,
  move(M,X,Z,Y),
  move(1,X,Y,_),
  move(M,Z,Y,X).
