%if the list is empty, return 0.
sum-up-numbers-simple([],0).

sum-up-numbers-simple([H|T], N):- 
	%if the first element is not a number, recursively call the function and add zero.
    not(number(H)),
	sum-up-numbers-simple(T, SUM),
	%add zero.
    N is 0 + SUM.

sum-up-numbers-simple([H|T], N):- 
	%if the first element is a number, recursively call the functon and add the first element.
    number(H),
	sum-up-numbers-simple(T, SUM),
	%add the first element.
    N is H + SUM.
