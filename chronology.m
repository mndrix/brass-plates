:- module chronology.

:- interface.

:- type era ---> bc; ad.

:- type year --->
    circa( int, era );
    between( int, era, int, era ).  % one within a range, inclusive


:- implementation.
