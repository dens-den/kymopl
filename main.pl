/* 
 * My humble endeavor to systematize the Kyrgyz morphology via Prolog.
 */

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

generate_inflection(S1, S3) :-
    noun(S1, Suffix),
    suffix(Suffix, S3),
    append(Noun, Suffix, S1),
    last_vowel(Noun, NounLastVowel),
    last_vowel(Suffix, SuffixLastVowel),
    harmony(NounLastVowel, SuffixLastVowel).

generate_inflection(S1, S3, Word) :-
    generate_inflection(S1, S3),
    atomic_list_concat(S1, '', Word).

generate_form(W, R) :-
    convert_word_to_list(W, LW),
    append(LW, _, X),
    generate_inflection(X, [], R),
    !.

convert_word_to_list(W, L) :-
    last(L, W),
    !.

%replace_consonant(LW, R, NLW) :-
%    convert_word_to_list(W, LW),
%    string_chars(W, X),
%    nth0(0, X, L).

% Tests
/*
suffix --> [чу]. suffix --> [чи]. suffix --> [чы]. suffix --> [чү]. % occupation
*/
dative --> [га].
dative --> [ка].
dative --> [ге].
dative --> [ке].
dative --> [го].
dative --> [ко].
dative --> [гө].
dative --> [кө].
case --> dative.
suffix --> case.

noun --> [кой].
noun --> [мерген].
noun --> [балык].
noun --> [сүрөт].
noun --> [аба].
noun --> [баш].
noun --> [кеме].
noun --> [кол].
noun --> [көз].
noun --> [туз].
noun --> [челек].

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

% Kyrgyz consonant harmony rules
agreement(н, а, н).
agreement(н, е, н).
agreement(н, и, н).
agreement(н, о, н).
agreement(н, у, н).
agreement(н, ы, н).
agreement(н, э, н).
agreement(н, ю, н).
agreement(н, я, н).
agreement(н, ё, н).
agreement(н, ү, н).
agreement(н, ө, н).
agreement(н, й, д).
agreement(н, р, д).
agreement(н, л, д).
agreement(н, м, д).
agreement(н, н, д).
agreement(н, ң, д).
agreement(н, з, д).
agreement(н, д, д).
agreement(н, г, д).
agreement(н, ж, д).
agreement(н, б, д).
agreement(н, в, д).
agreement(н, т, т).
agreement(н, с, т).
agreement(н, к, т).
agreement(н, п, т).
agreement(н, ч, т).
agreement(н, ш, т).
agreement(н, х, т).
agreement(н, ф, т).
agreement(н, щ, т).
agreement(л, а, л).
agreement(л, е, л).
agreement(л, и, л).
agreement(л, о, л).
agreement(л, у, л).
agreement(л, ы, л).
agreement(л, э, л).
agreement(л, ю, л).
agreement(л, я, л).
agreement(л, ё, л).
agreement(л, ү, л).
agreement(л, ө, л).
agreement(л, й, л).
agreement(л, р, л).
agreement(л, л, д).
agreement(л, м, д).
agreement(л, н, д).
agreement(л, ң, д).
agreement(л, з, д).
agreement(л, д, д).
agreement(л, г, д).
agreement(л, ж, д).
agreement(л, б, д).
agreement(л, в, д).
agreement(л, т, т).
agreement(л, с, т).
agreement(л, к, т).
agreement(л, п, т).
agreement(л, ч, т).
agreement(л, ш, т).
agreement(л, х, т).
agreement(л, ф, т).
agreement(л, щ, т).
agreement(г, а, г).
agreement(г, е, г).
agreement(г, и, г).
agreement(г, о, г).
agreement(г, у, г).
agreement(г, ы, г).
agreement(г, э, г).
agreement(г, ю, г).
agreement(г, я, г).
agreement(г, ё, г).
agreement(г, ү, г).
agreement(г, ө, г).
agreement(г, й, г).
agreement(г, р, г).
agreement(г, л, г).
agreement(г, м, г).
agreement(г, н, г).
agreement(г, ң, г).
agreement(г, з, г).
agreement(г, д, г).
agreement(г, г, г).
agreement(г, ж, г).
agreement(г, б, г).
agreement(г, в, г).
agreement(г, т, к).
agreement(г, с, к).
agreement(г, к, к).
agreement(г, п, к).
agreement(г, ч, к).
agreement(г, ш, к).
agreement(г, х, к).
agreement(г, ф, к).
agreement(г, щ, к).
agreement(д, а, д).
agreement(д, е, д).
agreement(д, и, д).
agreement(д, о, д).
agreement(д, у, д).
agreement(д, ы, д).
agreement(д, э, д).
agreement(д, ю, д).
agreement(д, я, д).
agreement(д, ё, д).
agreement(д, ү, д).
agreement(д, ө, д).
agreement(д, й, д).
agreement(д, р, д).
agreement(д, л, д).
agreement(д, м, д).
agreement(д, н, д).
agreement(д, ң, д).
agreement(д, з, д).
agreement(д, д, д).
agreement(д, г, д).
agreement(д, ж, д).
agreement(д, б, д).
agreement(д, в, д).
agreement(д, т, т).
agreement(д, с, т).
agreement(д, к, т).
agreement(д, п, т).
agreement(д, ч, т).
agreement(д, ш, т).
agreement(д, х, т).
agreement(д, ф, т).
agreement(д, щ, т).

% generate_inflection(_, [], W).
