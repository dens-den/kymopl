/* 
 * My humble endeavor to systematize the Kyrgyz morphology via Prolog.
 */

% Kyrgyz vowels
vowel(а). vowel(е). vowel(ё). vowel(и). vowel(о). vowel(ө).
vowel(у). vowel(ү). vowel(ы). vowel(э). vowel(ю). vowel(я).

% Kyrgyz consonants and other non-vowels
cons(б). cons(в). cons(г). cons(д). cons(ж). cons(з).
cons(й). cons(к). cons(л). cons(м). cons(н). cons(ң).
cons(п). cons(р). cons(с). cons(т). cons(ф). cons(х).
cons(ц). cons(ч). cons(ш). cons(щ). cons(ь). cons(ъ).

% Tracking down all vowels in a word via vowels/2: vowels(?Word, -Vowels)
vowels([], []).
vowels([V|T], [V|X]) :- vowel(V), vowels(T, X), !.
vowels([C|T], X) :- cons(C), vowels(T, X).

% Finding the last vowel in word via last_vowel/2: last_vowel(?Vowels, ?Vowel)
last_vowel(L, X) :- vowels(L, V), last(V, X), !.
