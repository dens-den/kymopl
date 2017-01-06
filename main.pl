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

%generate_inflection(S1, S3, Word) :-
%    generate_inflection(S1, S3),
%    atomic_list_concat(S1, '', Word).

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

% Dictionary
genitive --> ['нын'].
genitive --> ['нин'].
genitive --> ['дын'].
genitive --> ['дин'].
genitive --> ['тын'].
genitive --> ['тин'].
genitive --> ['нун'].
genitive --> ['нүн'].
genitive --> ['дун'].
genitive --> ['дүн'].
genitive --> ['тун'].
genitive --> ['түн'].
dative --> ['га'].
dative --> ['ка'].
dative --> ['ге'].
dative --> ['ке'].
dative --> ['го'].
dative --> ['ко'].
dative --> ['гө'].
dative --> ['кө'].
accusative --> ['ны'].
accusative --> ['ни'].
accusative --> ['ды'].
accusative --> ['ди'].
accusative --> ['ты'].
accusative --> ['ти'].
accusative --> ['ну'].
accusative --> ['нү'].
accusative --> ['ду'].
accusative --> ['дү'].
accusative --> ['ту'].
accusative --> ['тү'].
locative --> ['да'].
locative --> ['де'].
locative --> ['та'].
locative --> ['те'].
locative --> ['до'].
locative --> ['дө'].
locative --> ['то'].
locative --> ['тө'].
ablative --> ['дан'].
ablative --> ['ден'].
ablative --> ['тан'].
ablative --> ['тен'].
ablative --> ['дон'].
ablative --> ['дөн'].
ablative --> ['тон'].
ablative --> ['төн'].
case --> genitive.
case --> dative.
case --> accusative.
case --> locative.
case --> ablative.
suffix --> case.

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


% Kyrgyz vowels
vowel('а'). vowel('е'). vowel('ё'). vowel('и'). vowel('о'). vowel('ө').
vowel('у'). vowel('ү'). vowel('ы'). vowel('э'). vowel('ю'). vowel('я').

% Kyrgyz consonants and other non-vowels
cons('б'). cons('в'). cons('г'). cons('д'). cons('ж'). cons('з').
cons('й'). cons('к'). cons('л'). cons('м'). cons('н'). cons('ң').
cons('п'). cons('р'). cons('с'). cons('т'). cons('ф'). cons('х').
cons('ц'). cons('ч'). cons('ш'). cons('щ'). cons('ь'). cons('ъ').

% Rules
% Kyrgyz vowel harmony rules
harmony('а', 'а').
harmony('а', 'ы').
harmony('е', 'е').
harmony('е', 'и').
harmony('и', 'е').
harmony('и', 'и').
harmony('о', 'о').
harmony('о', 'у').
harmony('у', 'а').
harmony('у', 'у').
harmony('ы', 'а').
harmony('ы', 'ы').
harmony('ү', 'ү').
harmony('ү', 'ө').
harmony('ө', 'ү').
harmony('ө', 'ө').

% Kyrgyz consonant harmony rules
agreement('а', 'г').
agreement('а', 'д').
agreement('а', 'л').
agreement('а', 'н').
agreement('б', 'г').
agreement('б', 'д').
agreement('в', 'г').
agreement('в', 'д').
agreement('г', 'г').
agreement('г', 'д').
agreement('д', 'г').
agreement('д', 'д').
agreement('е', 'г').
agreement('е', 'д').
agreement('е', 'л').
agreement('е', 'н').
agreement('ж', 'г').
agreement('ж', 'д').
agreement('з', 'г').
agreement('з', 'д').
agreement('и', 'г').
agreement('и', 'д').
agreement('и', 'л').
agreement('и', 'н').
agreement('й', 'г').
agreement('й', 'д').
agreement('й', 'л').
agreement('к', 'к').
agreement('к', 'т').
agreement('л', 'г').
agreement('л', 'д').
agreement('м', 'г').
agreement('м', 'д').
agreement('н', 'г').
agreement('н', 'д').
agreement('о', 'г').
agreement('о', 'д').
agreement('о', 'л').
agreement('о', 'н').
agreement('п', 'к').
agreement('п', 'т').
agreement('р', 'г').
agreement('р', 'д').
agreement('р', 'л').
agreement('с', 'к').
agreement('с', 'т').
agreement('т', 'к').
agreement('т', 'т').
agreement('у', 'г').
agreement('у', 'д').
agreement('у', 'л').
agreement('у', 'н').
agreement('ф', 'к').
agreement('ф', 'т').
agreement('х', 'к').
agreement('х', 'т').
agreement('ч', 'к').
agreement('ч', 'т').
agreement('ш', 'к').
agreement('ш', 'т').
agreement('щ', 'к').
agreement('щ', 'т').
agreement('ы', 'г').
agreement('ы', 'д').
agreement('ы', 'л').
agreement('ы', 'н').
agreement('э', 'г').
agreement('э', 'д').
agreement('э', 'л').
agreement('э', 'н').
agreement('ю', 'г').
agreement('ю', 'д').
agreement('ю', 'л').
agreement('ю', 'н').
agreement('я', 'г').
agreement('я', 'д').
agreement('я', 'л').
agreement('я', 'н').
agreement('ё', 'г').
agreement('ё', 'д').
agreement('ё', 'л').
agreement('ё', 'н').
agreement('ң', 'г').
agreement('ң', 'д').
agreement('ү', 'г').
agreement('ү', 'д').
agreement('ү', 'л').
agreement('ү', 'н').
agreement('ө', 'г').
agreement('ө', 'д').
agreement('ө', 'л').
agreement('ө', 'н').

% generate_inflection(_, [], W).
