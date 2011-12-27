:- module events.

:- interface.
:- import_module io.
:- pred main(io::di,io::uo) is cc_multi.

:- implementation.
:- import_module list, int, string.

% ------------- Types ------------

% a passage of scripture containing one or more verses
:- type passage --->
    verse( book, int, int );        % a single verse
    verses( book, int, int, int ).  % start and end verses in one chapter
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

% Persons participating in the scriptural record.  A constructor consists of a
% name and a number.  This matches the convention used in the Book of Mormon
% Reference Companion and various Bible dictionaries.
:- type person --->
    laman_1;
    lehi_1;
    lemuel_1;
    nephi_1;
    sam_1;
    sariah_1;
    zoram.

% locations where events occurred
:- type location --->
    jerusalem;
    valley_of_lemuel;
    outside_jerusalem.

:- type era ---> bc; ad.

:- type year --->
    circa( int, era );
    exactly( int, era ).

% unique identifiers for each event
:- type event_id --->
    lehi_leaves_jerusalem;
    brothers_return_to_jerusalem;
    brothers_cast_lots;
    laman_returns_to_brothers;
    nephi_creeps_into_jerusalem;
    nephi_visits_labans_treasury;
    nephi_returns_to_brothers;
    brothers_return_to_valley_of_lemuel.

% identifiers for physical objects
:- type object_id --->
    brass_plates.

% possible details about an event
:- type detail --->
    citation(passage);
    who(person);
    what(string);
    where(location);
    why(string);
    how(string);
    object(object_id);
    time(year).


% ------------- Events ------------

:- pred event( event_id, list(detail)).
:- mode event(       in,          out) is det.
:- mode event(      out,          out) is multi.
:- pred and_then(event_id::out, event_id::out,list(detail)::out) is multi.

event( lehi_leaves_jerusalem, [
    what("Lehi and his family depart Jerusalem"),
    citation(verses(first_nephi, 2, 4, 5)),
    who(lehi_1),
    who(sariah_1),
    who(laman_1),
    who(lemuel_1),
    who(sam_1),
    who(nephi_1),
    where(jerusalem),
    time(circa(600,bc))
]).
event( brothers_return_to_jerusalem, [
    what("Lehi's sons return to Jerusalem for the brass plates"),
    citation(verse(first_nephi,3,9)),
    who(lehi_1),
    who(sariah_1),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    where(valley_of_lemuel),
    time(circa(600,bc))
]).
and_then( lehi_leaves_jerusalem, brothers_return_to_jerusalem, [
]).

event( brothers_cast_lots, [
    what("Lehi's sons cast lots about entering Jerusalem"),
    citation(verse(first_nephi,3,11)),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    where(outside_jerusalem),
    time(circa(600,bc))
]).
event( laman_returns_to_brothers, [
    what("Laman returns to his brothers after Laban casts him out"),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    where(outside_jerusalem),
    time(circa(600,bc))
]).
and_then( brothers_cast_lots, laman_returns_to_brothers, [
    who(laman_1),
    citation(verses(first_nephi,3,11,14))
]).
and_then( brothers_cast_lots, laman_returns_to_brothers, [
    who(lemuel_1),
    who(nephi_1),
    who(sam_1)
]).

event( nephi_creeps_into_jerusalem, [
    what("Nephi creeps into Jerusalem to get the brass plates"),
    citation(verse(first_nephi,4,5)),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    where(outside_jerusalem),
    time(circa(600,bc))
]).
event( nephi_visits_labans_treasury, [
    what("Nephi visits Laban's treasury to get the brass plates"),
    citation(verse(first_nephi,4,20)),
    who(nephi_1),
    who(zoram),
    object(brass_plates),
    where(jerusalem),
    time(circa(600,bc))
]).
event( nephi_returns_to_brothers, [
    what("Nephi returns to his brothers after getting the brass plates"),
    citation(verse(first_nephi,4,28)),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(zoram),
    object(brass_plates),
    where(outside_jerusalem),
    time(circa(600,bc))
]).
and_then( laman_returns_to_brothers, nephi_creeps_into_jerusalem, [
]).
and_then( nephi_creeps_into_jerusalem, nephi_visits_labans_treasury, [
    who(nephi_1)
]).
and_then( nephi_visits_labans_treasury, nephi_returns_to_brothers, [
    who(nephi_1),
    who(zoram)
]).
and_then( nephi_creeps_into_jerusalem, nephi_returns_to_brothers, [
    who(laman_1),
    who(lemuel_1),
    who(sam_1)
]).

event( brothers_return_to_valley_of_lemuel, [
    what("Lehi's sons return to him in the wilderness"),
    citation(verse(first_nephi,5,1)),
    who(lehi_1),
    who(sariah_1),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(zoram),
    object(brass_plates),
    where(valley_of_lemuel),
    time(circa(600,bc))
]).
and_then( brothers_return_to_jerusalem, brothers_return_to_valley_of_lemuel, [
    who(lehi_1),
    who(sariah_1),
    where(valley_of_lemuel)
]).
and_then( brothers_return_to_jerusalem, brothers_cast_lots, [
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1)
]).

and_then( nephi_returns_to_brothers, brothers_return_to_valley_of_lemuel, [
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1)
]).


% -------------------- Main and Helpers --------------- %
:- import_module solutions.
main(!IO) :-
    % output dot file header
    tell("graph.dot", _, !IO),
    print("digraph events {\n", !IO),

    % output dot file nodes
    unsorted_solutions( event_description, Nodes ),
    print_nodes(Nodes, !IO),

    % output dot file edges
    unsorted_solutions( event_edges, Edges ),
    print_edges(Edges, !IO),

    % output dot file footer
    print("}\n", !IO),
    told(!IO).

:- pred event_description(string::out) is nondet.
event_description(Desc) :-
    event(_,Details),
    member(who(lehi_1),Details),
    (
    if   member(what(D),Details)
    then Desc = D
    else Desc = "(unknown)"
    ).

:- pred print_nodes(list(string)::in, io::di, io::uo) is det.
print_nodes([], !IO).
print_nodes([S|Ss], !IO) :-
    format("    \"%s\";\n", [s(S)], !IO),
    print_nodes(Ss, !IO).

:- pred event_edges({string,string}::out) is nondet.
event_edges({From,To}) :-
    and_then(FromNode,ToNode,_),
    event( FromNode, FromDetails ), member(what(From),FromDetails),
    event( ToNode,   ToDetails ),   member(what(To),  ToDetails).

:- pred print_edges(list({string,string})::in, io::di, io::uo) is det.
print_edges([],!IO).
print_edges([{From,To}|Es], !IO) :-
    format("    \"%s\" -> \"%s\";\n", [s(From),s(To)], !IO ),
    print_edges(Es, !IO).
