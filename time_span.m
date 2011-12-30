:- module time_span.

:- interface.

:- type time_span --->
    days(int);
    not_many_days;
    many_days.

:- implementation.

