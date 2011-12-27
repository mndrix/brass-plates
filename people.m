:- module people.

:- interface.

% Persons participating in the scriptural record.  A constructor consists of a
% name and a number.  This matches the convention used in the Book of Mormon
% Reference Companion and various Bible dictionaries.
% If only one person ever has that name, the number is omitted.
:- type person --->
    ishmael_1;
    ishmaels_children;
    laman_1;
    lehi_1;
    lemuel_1;
    nephi_1;
    sam_1;
    sariah_1;
    zoram.

:- implementation.
