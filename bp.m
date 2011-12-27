:- module bp.

:- interface.
:- import_module io.
:- pred main(io::di, io::uo) is cc_multi.

:- implementation.

:- import_module list, solutions, string.
:- import_module events, people.

% which commands do we allow?
:- type command --->
    dot;
    png;
    view;
    help.
:- pred command_name(command, string).
:- mode command_name(     in,    out) is det.
:- mode command_name(    out,     in) is semidet.
:- mode command_name(    out,    out) is multi.
command_name(dot, "dot").
command_name(help, "help").
command_name(png,  "png").
command_name(view,  "view").
:- pred command_description(command, string).
:- mode command_description(     in,    out) is det.
command_description(dot, "Generate a .dot file for GraphViz").
command_description(png, "Generate an event graph image").
command_description(help, "Display command help").
command_description(view, "Display a graph").

main(!IO) :-
    command_line_arguments(Argv, !IO),
    (
    if   Name = head(Argv), command_name(Cmd,Name)
    then do_command(Cmd, !IO)
    else print("Unknown command\n", !IO),
         do_command(help, !IO)
    ).

% Do the real work for a subcommand
:- pred do_command(command::in, io::di, io::uo) is cc_multi.
do_command(dot, !IO) :-

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

do_command(png, !IO) :-
    do_command(dot, !IO),
    call_system( "dot -Tpng -ograph.png graph.dot", _, !IO ).

do_command(view, !IO) :-
    do_command(png, !IO),
    call_system( "open graph.png", _, !IO ).

do_command(help, !IO) :-
    print("Known commands are:\n", !IO ),
    solutions( all_commands, Commands ),
    print_commands(Commands, !IO).

:- pred all_commands(command::out) is multi.
all_commands(Command) :-
    command_name(Command, _).

:- pred print_commands(list(command)::in, io::di, io::uo) is det.
print_commands([], !IO).
print_commands([C|Cs], !IO) :-
    command_name(C, Name),
    command_description(C, Desc),
    format("   %-9s%s\n", [s(Name), s(Desc)], !IO),
    print_commands(Cs, !IO).


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

:- pred event_edges({string,string,string}::out) is nondet.
event_edges({From,To,Who}) :-
    and_then(FromNode,ToNode,EdgeDetails),
    Who = (if whos_present(EdgeDetails,W) then W else ""),
    event( FromNode, FromDetails ), member(what(From),FromDetails),
    event( ToNode,   ToDetails ),   member(what(To),  ToDetails).

:- pred print_edges(list({string,string,string})::in, io::di, io::uo) is det.
print_edges([],!IO).
print_edges([{From,To,Label}|Es], !IO) :-
    format(
        "    \"%s\" -> \"%s\" [label=\"%s\"];\n",
        [s(From),s(To),s(Label)],
        !IO
    ),
    print_edges(Es, !IO).

:- pred whos_present(list(detail)::in, string::out) is semidet.
whos_present(Details,EtAl) :-
    filter( is_person, Details, PeopleDetails),
    map( is_person, PeopleDetails, People ),
    etal( People, EtAl ).
