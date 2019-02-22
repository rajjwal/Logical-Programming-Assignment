%PROBLEM 1

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





%PROBLEM 2

%if the list is empty, return 0.
sum-up-numbers-general([],0).

sum-up-numbers-general([H|T], N):- 
	%if not number or a list, recursively call the function and add zero.
	not(number(H)),
	sum-up-numbers-general(T, SUM), 
	%add zero.
	N is 0 + SUM.

sum-up-numbers-general([H|T], N):-
	%if the element is list, call the function with the first element
	is_list(H),
	sum-up-numbers-general(H, SUM1),
	%call the function with the first element removed
	sum-up-numbers-general(T, SUM),
	%add the sum of the first element and the remamining element
	N is 0 + SUM1 + SUM.

sum-up-numbers-general([H|T], N):- 
	%if number, call the function recursively with rest of the elements in the function and add the first element to sum.
	number(H),
	sum-up-numbers-general(T, SUM),
	%we add the first element
	N is H + SUM.
