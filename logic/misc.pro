% This file doesn't really belong in this project, but it'll
% provide a decent home for it until I decide if it deserves
% it's own project.
%
% The following are Prolog definitions which try to capture
% some of the logical statements in the Book of Mormon.  The
% idea is that having the logic in Prolog, one can more easily
% search these statements and derive inferences from them.
% 
% I try to follow the rule "verb(subject, object)" where
% possible.

% 1 Nephi 17:13
prepare_way_for( god, One ) :- keep( One, commandments ).

% 1 Nephi 17:40
loves( god, One ) :- has_deity( One, god ).

% 1 Nephi 17:35
favors( god, One ) :- to_be( One, righteous ).
