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

last_letter(S, X) :-
    last(S, S1),
    string_chars(S1, L),
    last(L, X).

start_with(S, X) :-
    last(S, S1),
    string_chars(S1, L),
    nth0(0, L, X).

replace([_|T], 0, X, [X|T]).
replace([H|T], I, X, [H|R]) :-
    I1 is I - 1,
    replace(T, I1, X, R).

generate_inflection(S1, S3, Word) :-
    noun(S1, Suffix), % S1 = [баш, тын], Suffix = [тын]
    suffix(Suffix, S3), % S3 = []
    append(Noun, Suffix, S1), % Noun = [баш]
    last_vowel(Noun, NounLastVowel), % NounLastVowel = а
    last_vowel(Suffix, SuffixLastVowel), % SuffixLastVowel = ы
    harmony(NounLastVowel, SuffixLastVowel), % true
    last_letter(Noun, NountLastLetter), % NountLastLetter = ш
    start_with(Suffix, SuffixFirstLetter), % SuffixFirstLetter = т
    agreement(NountLastLetter, SuffixFirstLetter),
    atomic_list_concat(S1, '', Word).

generate_form(W, R) :-
    convert_word_to_list(W, LW),
    append(LW, _, X),
    generate_inflection(X, [], R),
    !.

convert_word_to_list(W, L) :-
    last(L, W),
    !.

noun --> ['кеме'].
%noun --> ['аба'].
%noun --> ['челек'].
%noun --> ['кол'].
%noun --> ['баш'].
%noun --> ['туз'].
%noun --> ['көз'].

%noun --> ['кой'].
%noun --> ['мерген'].
%noun --> ['балык'].
%noun --> ['сүрөт'].

% generate_inflection(_, [], W).
