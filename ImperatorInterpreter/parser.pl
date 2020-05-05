% Niekt�re znaki nale�a�o zamieni�
%   IN   OUT
%   =    =:=
%  /=    =\=
%  or     ;
%  and    ,
% IN to wersja dla pliku �r�d�owego.
%
% Nale�y pami�ta� o znaku ';' po warunku i p�tli.
%  while ... do
%  od;
%  if ... then
%  fi;
%
% Plik �r�d�owy nie powinien mie� dodatkowych pustych linii.
% Pomi�dzy poszczeg�lnymi znakami powinny by� spacje:
%    if VAR > 0 then
%        VAR := ( VAR * 2 ) / 3;
%    fi;



% W kolejno�ci z tre�ci zadania

% Program
program([]) -->[].
program([INS | P]) --> ins(INS), program(P).

% Instrukcje
ins(assign(ID,E)) --> [id(ID), sep(":=")], expr(E), [sep(";")].
ins(read(ID)) --> [key("read"), id(ID),sep(";")].
ins(write(E)) --> [key("write")], expr(E),[ sep(";")].
ins(if(Con,P)) --> [key("if")],cond(Con),[key("then")],program(P),[key("fi"),sep(";")].
ins(if(Con,PF,PS)) --> [key("if")],cond(Con),[key("then")],program(PF),[key("else")],program(PS),[key("fi"),sep(";")].
ins(while(Con,P)) --> [key("while")],cond(Con),[key("do")],program(P),[key("od"),sep(";")].

% Wyra�enia
expr(E) --> comp(E).
expr(EF + ES) --> comp(EF), [sep("+")],expr(ES).
expr(EF - ES) --> comp(EF), [sep("-")],expr(ES).

% Sk�adniki
comp(C) --> fact(C).
comp(A * B) --> fact(A), [sep("*")], comp(B).
comp(A / B) --> fact(A), [sep("/")], comp(B).
comp(EF mod ES) --> fact(EF), [key("mod")],comp(ES).

% Czynniki
fact(id(ID)) --> [id(ID)].
fact(int(N)) --> [int(N)].
fact(F) --> [sep("(")], expr(F),[sep(")")].

% Warunki
cond(K) --> conj(K).
cond(K ; C) --> conj(K), [key("or")], cond(C).

% Koniunkcje
conj(S) --> simp(S).
conj(S ',' C) --> simp(S), [key("and")], conj(C).

% Proste
simp(S) --> [sep("(")], expr(S),[sep(")")].
simp(A =:= B) --> expr(A), [sep("=")], expr(B).
simp(A =\= B) --> expr(A), [sep("/=")], expr(B).
simp(A < B) --> expr(A), [sep("<")], expr(B).
simp(A > B) --> expr(A), [sep(">")], expr(B).
simp(A >= B) --> expr(A), [sep(">=")], expr(B).
simp(A =< B) --> expr(A), [sep("=<")], expr(B).
