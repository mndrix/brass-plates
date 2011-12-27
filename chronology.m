:- module chronology.

:- interface.

:- type era ---> bc; ad.

:- type year --->
    circa( int, era );
    exactly( int, era ).


:- implementation.
