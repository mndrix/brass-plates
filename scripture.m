:- module scripture.

:- interface.

% a passage of scripture containing one or more verses
:- type passage --->
    verse( book, int, int );        % a single verse
    verses( book, int, int, int );  % start and end verses in one chapter
    chapter( book, int );           % a single chapter
    chapters( book, int, int ).     % start and end chapters in one book

% all scripture books
:- type book --->
    % Old Testament  (TODO: finish)

    % New Testament  (TODO: finish)
    revelation;

    % Book of Mormon
    first_nephi;
    second_nephi;
    jacob;
    enos;
    jarom;
    omni;
    words_of_mormon;
    mosiah;
    alma;
    helaman;
    third_nephi;
    fourth_nephi;
    mormon;
    ether;
    moroni.


:- implementation.
