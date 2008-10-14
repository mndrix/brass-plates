#!/usr/bin/perl
use strict;
use warnings;
use GraphViz;

my %label_options = (
    fontcolor => 'blue',
    fontsize  => 10,
);

my $g = GraphViz->new;
$g->add_edge( 'Creation' => 'Babel' );
$g->add_edge( 'Babel'    => 'Abraham leaves Egypt' );
$g->add_edge( 'Babel'    => 'Limhites return to Zarahemla',
    label     => "Jaredite record\n(discovered by Limhites)",
    %label_options,
);
$g->add_edge( 'Abraham leaves Egypt' => 'Lehi leaves Jerusalem' );
$g->add_edge( 'Abraham leaves Egypt' => "Book of Abraham\ntranslated" );
$g->add_edge(
    'Zedekiah to Babylon' => 'Mosiah finds Zarahemla',
    label => "Mulekites\n(no records)",
    style => 'dashed',
    %label_options,
);
$g->add_edge( 'Lehi leaves Jerusalem'    => 'Zedekiah to Babylon' );
$g->add_edge(
    'Lehi leaves Jerusalem' => 'Nephi leaves Laman',
    label                   => 'Lehi, &co',
    %label_options,
);
$g->add_edge( 'Zedekiah to Babylon'      => 'Zedekiah arrives in Babylon' );
$g->add_edge( 'Nephi leaves Laman'       => 'Mosiah leaves Lehi-Nephi' );
$g->add_edge(
    'Mosiah leaves Lehi-Nephi' => 'Mosiah finds Zarahemla',
    label                      => 'Mosiah',
    %label_options,
);
$g->add_edge( 'Mosiah leaves Lehi-Nephi' => 'Alma leaves Lehi-Nephi' );
$g->add_edge( 'Mosiah finds Zarahemla'   => 'Zeniff departs Zarahemla' );
$g->add_edge( 'Zeniff departs Zarahemla' => 'Ammon leaves Zarahemla' );
$g->add_edge(
    'Zeniff departs Zarahemla' => 'Ammon finds the Limhites',
    label                      => 'Zeniff',
    %label_options,
);
$g->add_edge(
    'Ammon leaves Zarahemla' => 'Ammon finds the Limhites',
    label                    => 'Ammon',
    %label_options,
);
$g->add_edge( 'Ammon leaves Zarahemla'   => 'Limhites return to Zarahemla' );
$g->add_edge( 'Ammon finds the Limhites' => 'Limhites return to Zarahemla' );
$g->add_edge( 'Limhites return to Zarahemla' => 'Alma arrives in Zarahemla' );
$g->add_edge(
    'Alma leaves Lehi-Nephi' => 'Alma arrives in Zarahemla',
    label                    => 'Alma',
    %label_options,
);


# TODO there are probably more nodes along these edges
$g->add_edge( "Alma arrives in Zarahemla"   => 'Standard Works' );

$g->add_edge( "Book of Abraham\ntranslated" => 'Standard Works' );


$g->as_png('graph.png');
