
sep(X) :-
    member(X, [":",";","+","-","*","/","(",")","<",">","=<",">=",":=","=","/=",",","=:=","=/=","=\\="]).
   %member(Y,[:,;,+,-,*,/,(,),<,>,=<,>=,:=,=,/=])

key(X) :-
    member(X,["read","write","if","then","else","fi","while","do","od","and","or","mod"]).


id(X) :-
    \+ sep(X),
    \+ key(X),
    \+ int(X),
    upcase_atom(X,X).

int(X) :-
    number_string(_,X).
    %integer(X);
    %char_type(X,digit).



parse_all([],R,Result):-
    Result = R.
parse_all([H|T], R, Result):-
    parse_line(H,L),
    append(R,L,New),
    parse_all(T,New,Result).


parse_line([],Curr,Result) :-
    Result = Curr.
parse_line([H|T],Curr, Result) :-
    %term_string(Y,X), H = Y,
    (   key(H) -> (append(Curr,[key(H)],New), parse_line(T,New,Result)));
    (   sep(H) -> (append(Curr,[sep(H)],New), parse_line(T,New,Result)));
    (   int(H) -> (append(Curr,[int(H)],New), parse_line(T,New,Result)));
    (   id(H) -> (append(Curr,[id(H)],New), parse_line(T,New,Result))).
parse_line(Line,Result) :-
    split_string(Line,"\s","\s",W),
    parse_line(W,[],Result).

scanner(X, Y) :-
    read_file(X,[],Lines),
    %split_string(X,"\n","\s",Lines),
    parse_all(Lines,[],Y).



read_file(X,R,Result) :-
    read_string(X,"\n","\s",End,String),
    (
      End > -1 -> (
                    re_replace(";"/g," ; ",String,NewString),
                    re_replace("\t"/g," ",NewString,NewNew),
                    append(R,[NewNew],New),
                    read_file(X,New,Result)
                  );
                  (
                    re_replace(";"/g," ; ",String,NewString),
                    re_replace("\t"/g," ",NewString,NewNew),
                    append(R,[NewNew],New),
                    Result = New
                  )
    ).

