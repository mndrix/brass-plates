#!/usr/bin/perl
use strict;
use warnings;
use GraphViz;

# different label styles
my %person_label = (
    fontcolor => 'blue',
    fontsize  => 10,
);
my %place_label = (
    fontcolor => 'darkgreen',
    fontsize  => 10,
);

my $g = GraphViz->new;
$g->add_edge( 'Creation' => 'Babel' );
$g->add_edge( 'Babel'    => 'Abraham leaves Egypt' );
$g->add_edge( 'Babel'    => 'Limhites return to Zarahemla',
    label     => "Jaredite record\n(discovered by Limhites)",
    %person_label,
);
$g->add_edge( 'Abraham leaves Egypt' => 'Israel to Assyria' ); # 2 Kgs 17:6
$g->add_edge(
    'Israel to Assyria' => 'Israel arrives in Assyria',
    label               => 'Ten Tribes',
    %person_label,
);
$g->add_edge(
    'Israel to Assyria' => 'Lehi leaves Jerusalem',
    label               => 'Jerusalem',
    %place_label,
);
$g->add_edge(
    'Abraham leaves Egypt' => "Book of Abraham\ntranslated",
    label                  => 'Egypt',
    %place_label,
);
$g->add_edge(
    'Zedekiah to Babylon' => 'Mosiah finds Zarahemla',
    label => "Mulekites\n(no records)",
    style => 'dashed',
    %person_label,
);
$g->add_edge(
    'Lehi leaves Jerusalem' => 'Zedekiah to Babylon',
    label                   => 'Jerusalem',
    %place_label,
);
$g->add_edge(
    'Lehi leaves Jerusalem' => 'Nephi leaves Laman',
    label                   => 'Lehi, &co',
    %person_label,
);
$g->add_edge(
    'Zedekiah to Babylon' => 'Zedekiah arrives in Babylon',
    label                 => 'Judah',
    %person_label,
);
$g->add_edge( 'Nephi leaves Laman'       => 'Mosiah leaves Lehi-Nephi' );
$g->add_edge(
    'Mosiah leaves Lehi-Nephi' => 'Mosiah finds Zarahemla',
    label                      => 'Mosiah',
    %person_label,
);
$g->add_edge(
    'Mosiah leaves Lehi-Nephi' => 'Alma leaves Lehi-Nephi',
    label                      => 'Lehi-Nephi',
    %place_label,
);
# Zeniff departs Zarahemla: Mosiah 9:3
$g->add_edge(
    'Mosiah finds Zarahemla' => 'Zeniff departs Zarahemla',
    label                    => 'Zarahemla',
    %place_label,
);
$g->add_edge(
    'Zeniff departs Zarahemla' => 'Ammon leaves Zarahemla',
    label                      => 'Zarahemla',
    %place_label,
);
$g->add_edge(
    'Zeniff departs Zarahemla' => 'Ammon finds the Limhites',
    label                      => 'Zeniff',
    %person_label,
);
$g->add_edge(
    'Ammon leaves Zarahemla' => 'Ammon finds the Limhites',
    label                    => 'Ammon',
    %person_label,
);
$g->add_edge(
    'Ammon leaves Zarahemla'   => 'Limhites return to Zarahemla',
    label                      => 'Zarahemla',
    %place_label,
);
$g->add_edge( 'Ammon finds the Limhites' => 'Limhites return to Zarahemla' );
$g->add_edge(
    'Limhites return to Zarahemla' => 'Alma arrives in Zarahemla',
    label                      => 'Zarahemla',
    %place_label,
);
$g->add_edge(
    'Alma leaves Lehi-Nephi' => 'Alma arrives in Zarahemla',
    label                    => 'Alma',
    %person_label,
);

# TODO integrate this sequence into the graph:
#       * Anti-Nephi-Lehites depart Land of Nephi (Alma 27:1-2)
#       * Ammon and Alma meet (Alma 27:16)
#       * Zarahemla votes (Alma 27:22)
#       * Alma leaves Zarahemla/Jershon for Antionum (Alma 31:6)
#       * Alma and Amulek return to Jershon (Alma 35:1-2)
#       * Believers cast out of Antionum into Jershon (Alma 35:6)

# TODO Suggestion for better encoding:
#       Maybe each event could be encoded in Prolog something like
#           event(What,Who,Where,When,Why,How) or
#           event(What, [who(Who),where(Where),when(When),why(Why),how(How)])
#       Then I could attach lots of information to a particular event
#       along with relevant scripture references and query the graph to
#       find information like "who was present at the time Alma left Jershon"
#       'What' is a canonical name for the event.
#       from(Origin) and to(Destination) could also be good attributes
#       alowing sanity checks to make sure graph edges agree on the physical
#       location of an event.  With these attributes, where(Where) can be
#       derived.


# TODO add scriptural references for each node in the graph
# TODO there are probably more nodes along these edges
# TODO add Christ dictating the words of Malachi to the Nephites
$g->add_edge( "Alma arrives in Zarahemla"   => 'Standard Works' );
$g->add_edge( 'Zedekiah arrives in Babylon' => "Judah returns\nto Jerusalem" );
$g->add_edge( "Judah returns\nto Jerusalem" => 'Standard Works' );

$g->add_edge( "Book of Abraham\ntranslated" => 'Standard Works' );


$g->as_png('graph.png');
