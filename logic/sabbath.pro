% From a study on "sabbath"
%
% Some interesting questions that can be answered:
%
% "Why should one keep the sabbath?"
%       reason( keep( _, sabbath ), Why ).
% "What are capital offenses in the Law of Moses?"
%       clause( kill(_,_), CapitalOffense ).

% Make some procedures dynamic so the program compiles
:- dynamic holy/2, kill/2.

% Exodus 31:13
:-  Keep     = keep( israel, sabbath ), % "sabbaths ye shall keep"
    Sign     = sign_between( sabbath, lord, israel ), % "it is a sign between me and you"
    Sanctify = sanctify( lord, israel ),
    Know     = know( israel, Sanctify ),
    May_know = possibility(Know),
    assert( commands( lord, israel, Keep ) ),   % "my sabbaths ye shall keep"
    assert( reason( Keep, Sign )           ),   % "for it is a sign..."
    assert( reason( Sign, May_know )       ),   % "that ye may know..."
    true.  % to avoid changing a line with a period on it

% Exodus 31:14
:-  Keep    = keep( israel, sabbath ),          % "keep the sabbath"
    Holy    = holy( sabbath, israel ),          % "it is holy unto you"
    assert( commands( lord, israel, Keep ) ),   % "ye shall keep..."
    assert( reason( Keep, Holy )           ),   % "for it is holy"
    true.
:-  Death   = ( kill( _, Man ) :- defile( Man, sabbath ) ),   % one that defileth it shall surely be put to death
    CutOff  = ( cut_off(Man)   :- work( Man, _, sabbath ) ),  % "any work therein ... cut off"
    assert( reason( Death, CutOff ) ),  % "put to death: for ... cut off"
    true.

% Exodus 31:15-16
day_of_week(sabbath, 7).  % "in the seventh is the sabbath of rest"
day_of_week(_, N) :- member( N, [ 1, 2, 3, 4, 5, 6, 7 ] ).
holy( sabbath, lord ).    % "holy to the Lord"
:-  day_of_week( Day, N ), N \= 7,   % "six days"
    Work = work(_, _, Day),          % "six days ... work be done"
    assert( allow( lord, Work ) ),   % "six days may work be done"
    true.
:-  Death = ( kill( _, Man ) :- work( Man, _, sabbath ) ), % "doeth any work ... sabbath ... put to death"
    assert(Death),
    Keep = keep( israel, sabbath ),             % "Israel ... keep the sabbath"
    assert( reason( Keep, Death ) ),            % "... to death. Wherefore ..."
    assert( commands( lord, israel, Keep ) ),   % "Israel shall keep ..."
    Covenant = covenant( _, _, sabbath ),       % "a ... covenant"
    assert( duration( Covenant, perpetual ) ),  % "perpetual covenant"
    true.

% both arguments to reason/2 are facts of their own
% TODO is that true? see Exodus 31:16's "reason(Keep,Death)"
% TODO i'm not sure one can say that Israel keeps the sabbath
% TODO it's more like saying "the reason they should..."
:-  reason( X, Y ),
    assert(X),
    assert(Y),
    fail;   % force backtrack to assert all terms
    true.
