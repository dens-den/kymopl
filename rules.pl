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
cons('б').
cons('в').
cons('г').
cons('д').
cons('ж').
cons('з').
cons('й').
cons('к').
cons('л').
cons('м').
cons('н').
cons('ң').
cons('п').
cons('р').
cons('с').
cons('т').
cons('ф').
cons('х').
cons('ц').
cons('ч').
cons('ш').
cons('щ').
cons('ь').
cons('ъ').

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
