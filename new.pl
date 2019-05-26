% Kyrgyz vowels
vowel('а').
vowel('е').
vowel('ё').
vowel('и').
vowel('о').
vowel('ө').
vowel('у').
vowel('ү').
vowel('ы').
vowel('э').
vowel('ю').
vowel('я').

% Kyrgyz consonants and other non-vowels
consonant('б').
consonant('в').
consonant('г').
consonant('д').
consonant('ж').
consonant('з').
consonant('й').
consonant('к').
consonant('л').
consonant('м').
consonant('н').
consonant('ң').
consonant('п').
consonant('р').
consonant('с').
consonant('т').
consonant('ф').
consonant('х').
consonant('ц').
consonant('ч').
consonant('ш').
consonant('щ').

consonant('ь').
consonant('ъ').

is_vowel(Char) :- member(Char, [а,е,ё,и,о,ө,у,ү,ы,э,ю,я,u]), !.
is_consonant(Char) :- member(Char, [б,в,г,д,ж,з,й,к,л,м,н,ң,п,р,с,т,ф,х,ц,ч,ш,щ]), !.

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

% Dictionary
plural --> ['лар'].
plural --> ['дар'].
plural --> ['тар'].
plural --> ['лер'].
plural --> ['дер'].
plural --> ['тер'].
plural --> ['лор'].
plural --> ['дор'].
plural --> ['тор'].
plural --> ['лөр'].
plural --> ['дөр'].
plural --> ['төр'].

nominative --> [].

genitive --> ['нын'].
genitive --> ['нин'].
genitive --> ['нун'].
genitive --> ['нүн'].
genitive --> ['дын'].
genitive --> ['дин'].
genitive --> ['дун'].
genitive --> ['дүн'].
genitive --> ['тын'].
genitive --> ['тин'].
genitive --> ['тун'].
genitive --> ['түн'].
genitive --> ['ын'].
genitive --> ['ин'].
genitive --> ['ун'].
genitive --> ['үн'].

dative --> ['га'].
dative --> ['ге'].
dative --> ['го'].
dative --> ['гө'].
dative --> ['ка'].
dative --> ['ке'].
dative --> ['ко'].
dative --> ['кө'].
dative --> ['а'].
dative --> ['е'].
dative --> ['о'].
dative --> ['ө'].

accusative --> ['ны'].
accusative --> ['ни'].
accusative --> ['ну'].
accusative --> ['нү'].
accusative --> ['ды'].
accusative --> ['ди'].
accusative --> ['ду'].
accusative --> ['дү'].
accusative --> ['ты'].
accusative --> ['ти'].
accusative --> ['ту'].
accusative --> ['тү'].
accusative --> ['ы'].
accusative --> ['и'].
accusative --> ['у'].
accusative --> ['ү'].

locative --> ['да'].
locative --> ['де'].
locative --> ['до'].
locative --> ['дө'].
locative --> ['та'].
locative --> ['те'].
locative --> ['то'].
locative --> ['тө'].

ablative --> ['дан'].
ablative --> ['ден'].
ablative --> ['дон'].
ablative --> ['дөн'].
ablative --> ['тан'].
ablative --> ['тен'].
ablative --> ['тон'].
ablative --> ['төн'].
ablative --> ['ан'].
ablative --> ['ен'].
ablative --> ['он'].
ablative --> ['өн'].

e1 --> plural.

e3 --> nominative.
e3 --> genitive.
e3 --> dative.
e3 --> accusative.
e3 --> locative.
e3 --> ablative.



a2 --> e1, e3.

noun --> ['окучуу'].

final --> noun.
final --> noun, a2.

vowels([], []).
vowels([V|T], [V|X]) :-
    vowel(V),
    vowels(T, X),
    !.
vowels([C|T], X) :-
    consonant(C),
    vowels(T, X).
last_vowel(S, X) :-
    last(S, S1),
    string_chars(S1, L),
    vowels(L, V),
    last(V, X).

last2_2([_,A,_],A,_).


% starts_with_vowel(Word):-
%   Word = [First|_],
%   is_vowel(First).
