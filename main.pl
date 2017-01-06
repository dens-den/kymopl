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
    

agreement(г, т, к).
agreement(г, с, к).
agreement(г, к, к).
agreement(г, п, к).
agreement(г, ч, к).
agreement(г, ш, к).
agreement(г, х, к).
agreement(г, ф, к).
agreement(г, щ, к).

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
suffix --> dative.
%noun --> [кой].
%noun --> [мерген].
%noun --> [балык].
%noun --> [сүрөт].
%noun --> [аба].
noun --> [баш].
%noun --> [кеме].
noun --> [кол].
%noun --> [көз].
%noun --> [туз].
%noun --> [челек].

% generate_inflection(_, [], W).
