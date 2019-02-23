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






%PROBLEM 3

%get-min-list function is a helper function which gives the minimum number in the list
%number-list function is a helper function that takes the list and returns the list with only numbers
%min-above-min-helper is a helper function that returns a list with all numbers less than the min element in L2.
%min-above-min returns the min value that the function min-above-min-helper returns.

%get-min-list

%base case
get-min-list([A], A).

get-min-list([A|B], M):-
	%if first element not number, recursively call the function with rest of the elements in the list
	not(number(A)),
	get-min-list(B, M).

get-min-list([A,B|Z], M):-
	%if second element is not number, recursively call the function with first and rest of the elements in the list
	not(number(B)),
	get-min-list([A|Z], M).

get-min-list([A,B|Z], M):-
	%if first and second number are numbers, and first element is less than or equal to second
	%remove second element and call the function recursively with first and rest of the elements in the list
	number(A),
	number(B),
	A =< B,
	get-min-list([A|Z], M).

get-min-list([A,B|Z], M):-
	%if first and second number are numbers, and first element is less than or equal to second
	%removes first element and call the function with rest of the elements in the list
	number(A),
	number(B),
	A > B,
	get-min-list([B|Z], M).

%number-list : Function that adds only numeric values to list

%base case
number-list([],[]).

number-list(L, LIST) :-
	%if the first element is not number, recursively call the function with rest of the elements in the list
	[A | B] = L,
	not(number(A)),
	number-list(B, LIST).

number-list([A|B], [A|LIST]):- 
	%if first element is number-list, add the first element to the LIST and recursively call the function with rest of the elements
	%[A|LIST] adds the A to lists.
	number(A),
	number-list(B, LIST).


%min-above-min-helper: Adds values less than min of L2 to a list.

%base case
min-above-min-helper([],_,[]). 

min-above-min-helper(L, M2, Z):- 
	%if number in L1 is less than min of L2, recursively call the function with rest of the elements
	[A | B] = L,
	A =< M2,
	min-above-min-helper(B, M2, Z).

min-above-min-helper([A|B], M2, [A|Z]):-  
	%if L1 is greater than min of L2, recursively call the function with rest of the elements
	%[A | Z] adds A to Z
	min-above-min-helper(B, M2, Z).


%min-above-min: 

min-above-min(L1, _, N):- 
	%if there is no number in list L1
	get-min-list(L1, M1),
	not(number(M1)),
	get-min-list(L1,N).

min-above-min(L1, _, N):-  
	%if the list1 is empty
	length(L1,0),
	get-min-list(L1,N).

min-above-min(L1, L2, N):-   
	%if the list2 is empty
	length(L2,0),
	get-min-list(L1, N).

min-above-min(L1, L2, N):- 
	%if there is no number in list l2, return the min element of L1.
	get-min-list(L2, M2),
	not(number(M2)),
	get-min-list(L1,N).


min-above-min(L1, L2, N):-
	%Get all numeric value in list 1.
	%Get the minimum value in list 2.
	%Store all values greater than min of L2 in list Z.
	%return min of Z.
	number-list(L1, List1),
	get-min-list(L2, M2),
	min-above-min-helper(List1, M2, Z),
	get-min-list(Z, N).





% PROBLEM 4

%make-nested-list-simple-helper function is a helper function that makes nested list into a simple list
%common-unique-elements-helper is a helper function that uses member function to see if the first element of L1 is a member of L2. If yes, append it to a new list and the new list with N.
%common-unique-elements uses helper functions to see if N is an element of L1 and L2

%make-nested-list-simple-helper

%base case
make-nested-list-simple-helper([],[]).

%makes nested list simple: condition,
make-nested-list-simple-helper(L, Lists):-
	%if the first element of L1 is a list, make lists2 having the elements from the list 
	% and list1 having the elements from the remamining part, and append both lists2 and lists1.
	[X1 | Y1] = L,
	is_list(X1),
	make-nested-list-simple-helper(X1, Lists2),
	make-nested-list-simple-helper(Y1, Lists1),
	append(Lists2, Lists1, Lists). %append both lists2 and list1

make-nested-list-simple-helper(L, Lists):-
	%if the first element of L1 is not a list, add the element to Lists and recursively call the function with rest of the elements
	[X1 | Y1] = L,
	not(is_list(X1)),
	make-nested-list-simple-helper(Y1, Lists1),
	append([X1], Lists1, Lists).  %add the element to Lists


%common-unique-elements-helper

%base case
common-unique-elements-helper([],_,[]).

common-unique-elements-helper(Lists1, Lists2, N):-
    %if the first element of L1 is a member of L1, add it to X1 and call function again.
	[X1 | Y1] = Lists1,
	member(X1, Lists2),
	common-unique-elements-helper(Y1, Lists2, N1),
	append([X1], N1, N ).

common-unique-elements-helper(Lists1, Lists2, N):-
    %if not a member of L1, call the function recursively with rest of the elements of Lists1
	[X1 | Y1] = Lists1,
	not(member(X1, Lists2)),
	common-unique-elements-helper(Y1, Lists2, N).


%common-unique-elements

common-unique-elements([],_,[]).

common-unique-elements(L1, L2, N):-
    %make list1 and list2 simple and then call the helper function.
	make-nested-list-simple-helper(L1, Lists1),
	make-nested-list-simple-helper(L2, Lists2),
	common-unique-elements-helper(Lists1, Lists2, N).



