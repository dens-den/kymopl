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

% Kyrgyz vowel harmony rules
harmony(и, е). harmony(и, и). harmony(ү, ө). harmony(ү, ү).
harmony(е, е). harmony(е, и). harmony(ө, ө). harmony(ө, ү).
harmony(а, а). harmony(а, ы). harmony(о, о). harmony(о, у).
harmony(ы, а). harmony(ы, ы). harmony(у, а). harmony(у, у).

% Tracking down all vowels in a word via vowels/2: vowels(?Word, -Vowels)
vowels([], []).
vowels([V|T], [V|X]) :-
    vowel(V),
    vowels(T, X),
    !.
vowels([C|T], X) :-
    cons(C),
    vowels(T, X).

% Finding the last vowel in [word] via last_vowel/2: last_vowel(?Vowels, ?Vowel)
last_vowel(S, X) :-
    last(S, S1),
    string_chars(S1, L),
    vowels(L, V),
    last(V, X).

generate_inflection(S1, S3, W) :-
    noun(S1, S2),
    suffix(S2, S3),
    append(NV, S2, S1),
    last_vowel(NV, V1),
    last_vowel(S2, V2),
    harmony(V1, V2),
    atomic_list_concat(S1, '', W).

% Tests
suffix --> [чу]. suffix --> [чи]. suffix --> [чы]. suffix --> [чү]. % occupation

noun --> [кой]. % кой-чу
noun --> [мерген]. % мерген-чи
noun --> [балык]. % балык-чы
noun --> [сүрөт]. % сүрөт-чү

% generate_inflection(_, [], W).
