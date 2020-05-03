
h3(List) :-
    nth1(I1,List,(_,green,_,_,_)),
    nth1(I2,List,(_,white,_,_,_)),
    I is I2 - 1,
    I1 = I.

next(A,B,List) :-
    nth1(I1,List,A),
    nth1(I2,List,B),
    X is I2 - 1,
    Y is I2 + 1,
    (
       I1 = X;
       I1 = Y
    ).

fill_list(List) :-
    nth1(1,List,(norwegian,_,_,_,_)),
    member((english,red,_,_,_),List),
    h3(List),
    member((danish,_,tea,_,_), List),
    next((_,_,_,light,_),(_,_,_,_,cats),List),
    member((_,yellow,_,cigar,_),List),
    member((german,_,_,pipe,_),List),
    nth1(3,List,(_,_,milk,_,_)),
    next((_,_,_,light,_),(_,_,water,_,_),List),
    member((_,_,_,nofilter,birds),List),
    member((swedish,_,_,_,dogs),List),
    next((norwegian,_,_,_,_),(_,blue,_,_,_),List),
    next((_,_,_,_,horses),(_,yellow,_,_,_),List),
    member((_,_,beer,mentol,_),List),
    member((_,green,coffee,_,_),List).

fish(Who) :-
    Len is 5,
    length(List,Len),
    fill_list(List),
    member((Who,_,_,_,fish),List),!.



