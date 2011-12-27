:- module bp.

:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is cc_multi.

:- implementation.

:- import_module list, solutions, string.
:- import_module events, people.
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
