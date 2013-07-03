:- module events.

:- interface.
:- import_module list.
:- import_module scripture, people, locations, chronology, objects.
:- import_module time_span.

% unique identifiers for each event
:- type event_id --->
    jerusalem_before_it_all;
    lehi_leaves_jerusalem;
    brothers_return_to_jerusalem;
    brothers_cast_lots;
    laman_returns_to_brothers;
    nephi_creeps_into_jerusalem;
    nephi_visits_labans_treasury;
    nephi_returns_to_brothers;
    brothers_return_to_valley_of_lemuel;
    brothers_send_for_ishmael;
    ishmael_departs_jerusalem;
    ishmael_arrives_in_valley_of_lemuel;
    lehi_finds_liahona;
    pitch_tents_in_shazer;
    pitched_tents_for_a_time;
    lehi_resumes_journey;
    lehi_arrives_in_nahom;
    lehi_travels_eastward;
    lehi_arrives_in_bountiful;
    lehi_sets_sail;
    arrive_in_promised_land;
    lehi_dies;
    limhi_arrives_in_zarahemla;
    nephi_leaves_laman;
    city_of_nephi_founded;
    first_lamanite_nephite_wars;
    mosiah_leaves_land_of_nephi;
    mosiah_arrives_in_zarahemla;
    siege_of_jerusalem;
    mulekites_depart_jerusalem;
    mulekites_found_zarahemla;
    mulekites_discover_coriantumr;
    ammon_leaves_zarahemla;
    ammon_arrives_in_lehi_nephi;
    zeniff_leaves_zarahemla;
    zeniff_arrives_in_lehi_nephi.

% possible details about an event
:- type detail --->
    citation(passage);
    duration(time_span);
    who(person);
    what(string);
    where(location);
    why(string);
    how(string);
    object(object_id);
    time(year).

:- pred is_person(detail::in) is semidet.

:- pred is_person(detail::in, person::out) is semidet.

:- pred event( event_id, list(detail)).
:- mode event(       in,          out) is det.
:- mode event(      out,          out) is multi.

:- pred and_then(event_id::out, event_id::out,list(detail)::out) is multi.


:- implementation.

is_person(who(_)).

is_person(who(X), X).

event( jerusalem_before_it_all, [
    what("Jerusalem before BoM starts")
]).

and_then( jerusalem_before_it_all, lehi_leaves_jerusalem, [
]).
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
    time(circa(600,bc))   % See 1Ne 19:8
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
    what("Lehi's sons cast lots"),
    citation(verse(first_nephi,3,11)),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    where(outside_jerusalem),
    time(circa(600,bc))
]).
and_then( brothers_return_to_jerusalem, brothers_cast_lots, [
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1)
]).

event( laman_returns_to_brothers, [
    what("Laman returns to his brothers"),
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
    what("Nephi creeps into Jerusalem"),
    citation(verse(first_nephi,4,5)),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    where(outside_jerusalem),
    time(circa(600,bc))
]).

event( nephi_visits_labans_treasury, [
    what("Nephi visits Laban's treasury"),
    citation(verse(first_nephi,4,20)),
    who(nephi_1),
    who(zoram),
    object(brass_plates),
    object(sword_of_laban),  % actually appeared first in verse 9
    where(jerusalem),
    time(circa(600,bc))
]).
event( nephi_returns_to_brothers, [
    what("Nephi returns to his brothers with the brass plates"),
    citation(verse(first_nephi,4,28)),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(zoram),
    object(brass_plates),
    object(sword_of_laban),
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
    object(sword_of_laban),
    where(valley_of_lemuel),
    time(circa(600,bc))
]).
and_then( brothers_return_to_jerusalem, brothers_return_to_valley_of_lemuel, [
    who(lehi_1),
    who(sariah_1),
    where(valley_of_lemuel)
]).
and_then( nephi_returns_to_brothers, brothers_return_to_valley_of_lemuel, [
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1)
]).

event( brothers_send_for_ishmael, [
    what("Lehi's sons return to Jerusalem to get Ishmael"),
    citation(verse(first_nephi,7,3)),
    who(lehi_1),
    who(sariah_1),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(zoram),
    object(brass_plates),
    object(sword_of_laban),
    where(valley_of_lemuel),
    time(between(600,bc, 592,bc))
]).
and_then( brothers_return_to_valley_of_lemuel, brothers_send_for_ishmael, [
]).

event( ishmael_departs_jerusalem, [
    what("Ishmael and his household leave Jerusalem"),
    citation(verse(first_nephi,7,5)),
    where(jerusalem),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmael_1),
    who(ishmaels_children)
]).
and_then( brothers_send_for_ishmael, ishmael_departs_jerusalem, [
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1)
]).

event( ishmael_arrives_in_valley_of_lemuel, [
    what("Lehi's sons and Ishmael's family arrive at Lehi's tent"),
    citation(verse(first_nephi,7,22)),
    where(valley_of_lemuel),
    who(lehi_1),
    who(sariah_1),
    who(zoram),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmael_1),
    who(ishmaels_children),
    object(sword_of_laban),
    object(brass_plates)
]).
and_then( ishmael_departs_jerusalem, ishmael_arrives_in_valley_of_lemuel, [
    citation(verses(first_nephi,7,6,21)),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmael_1),
    who(ishmaels_children)
]).
and_then( brothers_send_for_ishmael, ishmael_arrives_in_valley_of_lemuel, [
    who(lehi_1),
    who(sariah_1),
    who(zoram),
    object(sword_of_laban),
    object(brass_plates)
]).

event( lehi_finds_liahona, [
    what("Lehi finds the Liahona"),
    citation(verse(first_nephi,16,10)),
    where(valley_of_lemuel),
    who(lehi_1),
    who(sariah_1),
    who(zoram),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmael_1),
    who(ishmaels_children),
    time(between(600,bc, 592,bc)),
    object(brass_plates),
    object(sword_of_laban),
    object(liahona)
]).
and_then( ishmael_arrives_in_valley_of_lemuel, lehi_finds_liahona, [
    citation(chapters(first_nephi,8,15)),
    citation(verses(first_nephi,16,1,6)),
    where(valley_of_lemuel)   % see 1Ne 16:6
]).

event( pitch_tents_in_shazer, [
    what("Lehi's group arrives at Shazer"),
    citation(verse(first_nephi,16,13)),
    where(shazer),
    who(lehi_1),
    who(sariah_1),
    who(zoram),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmael_1),
    who(ishmaels_children),
    time(between(600,bc, 592,bc)),
    object(brass_plates),
    object(sword_of_laban),
    object(liahona)
]).
and_then( lehi_finds_liahona, pitch_tents_in_shazer, [
    citation(verses(first_nephi,16,12,13)),
    duration(days(4))  % see 1Ne 16:13
]).

event( pitched_tents_for_a_time, [
    what("Lehi's group pitches tents for a time"),
    citation(verse(first_nephi,16,17)),
    who(lehi_1),
    who(sariah_1),
    who(zoram),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmael_1),
    who(ishmaels_children),
    time(between(600,bc, 592,bc)),
    object(brass_plates),
    object(sword_of_laban),
    object(liahona)
]).
and_then( pitch_tents_in_shazer, pitched_tents_for_a_time, [
    citation(verses(first_nephi,16,14,16)),
    duration(many_days)   % see 1Ne 16:15,17
]).

event( lehi_resumes_journey, [
    what("Lehi's group resumes journey"),
    citation(verse(first_nephi,16,33)),
    who(lehi_1),
    who(sariah_1),
    who(zoram),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmael_1),
    who(ishmaels_children),
    time(between(600,bc, 592,bc)),
    object(brass_plates),
    object(sword_of_laban),
    object(liahona)
]).
and_then( pitched_tents_for_a_time, lehi_resumes_journey, [
    citation(verses(first_nephi,16,18,32))
]).

and_then( lehi_resumes_journey, lehi_arrives_in_nahom, [
    citation(verse(first_nephi,16,33)),
    duration(many_days)
]).
event( lehi_arrives_in_nahom, [
    what("Lehi's group arrives in Nahom"),
    citation(verses(first_nephi,16,33,34)),
    who(lehi_1),
    who(sariah_1),
    who(zoram),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmael_1),       % he's buried shortly after this event
    who(ishmaels_children),
    where(nahom),
    time(between(600,bc, 592,bc)),
    object(brass_plates),
    object(sword_of_laban),
    object(liahona)
]).

and_then( lehi_arrives_in_nahom, lehi_travels_eastward, [
    citation(verses(first_nephi,16,33,39))
]).
event( lehi_travels_eastward, [
    what("Lehi resumes his journey, headed eastward"),
    citation(verse(first_nephi,17,1)),
    who(lehi_1),
    who(sariah_1),
    who(zoram),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmaels_children),
    where(nahom),
    time(between(600,bc, 592,bc)),
    object(brass_plates),
    object(sword_of_laban),
    object(liahona)
]).

and_then( lehi_travels_eastward, lehi_arrives_in_bountiful, [
    citation(verses(first_nephi,17,1,4))
]).
event( lehi_arrives_in_bountiful, [
    what("Lehi's group arrives in Bountiful"),
    citation(verse(first_nephi,17,5)),
    who(lehi_1),
    who(sariah_1),
    who(zoram),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmaels_children),
    where(bountiful_1),
    time(circa(592,bc)),   % See 1Ne 17:4
    object(brass_plates),
    object(sword_of_laban),
    object(liahona)
]).

and_then( lehi_arrives_in_bountiful, lehi_sets_sail, [
    citation(verses(first_nephi,17,6,55)),
    citation(verses(first_nephi,18,1,7))
]).
event( lehi_sets_sail, [
    what("Lehi's group sets sail"),
    citation(verse(first_nephi,18,8)),
    who(lehi_1),
    who(sariah_1),
    who(zoram),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmaels_children),
    who(jacob_2),
    who(joseph_2),
    where(bountiful_1),
    object(brass_plates),
    object(sword_of_laban),
    object(liahona)
]).

and_then( lehi_sets_sail, arrive_in_promised_land, [
    duration(many_days)   % See 1Ne 18:23
]).
event( arrive_in_promised_land, [
    what("Lehi's group arrives in the promised land"),
    citation(verse(first_nephi,18,23)),
    who(lehi_1),
    who(sariah_1),
    who(zoram),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmaels_children),
    who(jacob_2),
    who(joseph_2),
    object(brass_plates),
    object(sword_of_laban),
    object(liahona)
]).

and_then( arrive_in_promised_land, lehi_dies, [
    citation(verses(first_nephi,18,24,25)),
    citation(chapters(first_nephi,19,22)),
    citation(chapter(second_nephi,1)),
    citation(chapters(second_nephi,2,3)),
    citation(verses(second_nephi,4,1,11))
]).
event( lehi_dies, [
    what("Lehi dies"),
    citation(verse(second_nephi,4,12)),
    who(lehi_1),
    who(sariah_1),
    who(zoram),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmaels_children),
    who(jacob_2),
    who(joseph_2),
    object(brass_plates),
    object(sword_of_laban),
    object(liahona)
]).

and_then( lehi_dies, nephi_leaves_laman, [
    citation(verses(second_nephi,4,13,35)),
    citation(verses(second_nephi,5,1,5)),
    duration(not_many_days)   % See 2Ne 4:13
]).
event( nephi_leaves_laman, [
    what("Nephi's people separate from Laman's people"),
    citation(verses(second_nephi,5,6,7)),
    who(sariah_1),
    who(zoram),
    who(laman_1),
    who(lemuel_1),
    who(nephi_1),
    who(sam_1),
    who(ishmaels_children),
    who(jacob_2),
    who(joseph_2),
    object(brass_plates),
    object(sword_of_laban),
    object(liahona)
]).

and_then( nephi_leaves_laman, city_of_nephi_founded, [
    who(nephi_1),
    who(zoram),
    who(sam_1),
    who(jacob_2),
    who(joseph_2),
    who(lehi_1_daughters),
    duration(many_days)   % See 2Ne 5:7
]).
and_then( nephi_leaves_laman, first_lamanite_nephite_wars, [
    who(laman_1),
    who(lemuel_1)
]).
event( city_of_nephi_founded, [
    what("Nephites establish the city of Nephi"),
    citation(verses(second_nephi,5,7,8)),
    who(nephi_1),
    who(zoram),
    who(sam_1),
    who(jacob_2),
    who(joseph_2),
    who(lehi_1_daughters),
    where(city_of_nephi),
    object(brass_plates),    % See 2Ne 5:12
    object(sword_of_laban),  % See 2Ne 5:14
    object(liahona)          % See 2Ne 5:12
]).

and_then( city_of_nephi_founded, first_lamanite_nephite_wars, [
    citation(verses(second_nephi,5,8,33))
]).
event( first_lamanite_nephite_wars, [
    what("First wars between Lamanites and Nephites"),
    citation(verse(second_nephi,5,34)),
    time(circa(560,bc))
]).

and_then( city_of_nephi_founded, mosiah_leaves_land_of_nephi, [
    citation(verse(omni,1,13))
]).
event( mosiah_leaves_land_of_nephi, [
    what("Mosiah and his people flee out of the land of Nephi"),
    citation(verse(omni,1,13)),
    time(circa(324,bc))
]).

and_then( mosiah_leaves_land_of_nephi, mosiah_arrives_in_zarahemla, [
    citation(verse(omni,1,14))
]).
event( mosiah_arrives_in_zarahemla, [
    what("Mosiah and his people discover Zarahemla"),
    citation(verse(omni,1,14)),
    time(circa(324,bc))
]).

and_then( jerusalem_before_it_all, siege_of_jerusalem, [
]).
event( siege_of_jerusalem, [
    what("Jerusalem captured by Babylonians"),
    time(circa(587,bc))
]).

and_then( siege_of_jerusalem, mulekites_depart_jerusalem, [
    citation(verse(omni,1,15))
]).
event( mulekites_depart_jerusalem, [
    what("People of Zarahemla leave Jerusalem"),
    citation(verse(omni,1,15)),
    time(circa(587,bc))
]).

and_then( mulekites_depart_jerusalem, mulekites_found_zarahemla, [
    citation(verse(omni,1,16))
]).
event( mulekites_found_zarahemla, [
    what("Mulekites arrive in the New World"),
    where(zarahemla),
    citation(verse(omni,1,16))
]).

and_then( mulekites_found_zarahemla, mulekites_discover_coriantumr, [
    citation(verse(omni,1,21))
]).
and_then(mulekites_discover_coriantumr, mosiah_arrives_in_zarahemla, [
    citation(verse(omni,1,20))
]).
event( mulekites_discover_coriantumr, [
    what("People of Zarahemla discover Coriantumr"),
    citation(verse(omni,1,21))
]).

and_then( zeniff_leaves_zarahemla, ammon_leaves_zarahemla, [
    % citation: most of the Book of Mosiah
]).
event( ammon_leaves_zarahemla, [
    what("Ammon departs Zarahemla"),
    where(zarahemla),
    time(circa(121,bc)),
    citation(verses(mosiah,7,2,3))
]).

and_then( ammon_leaves_zarahemla, ammon_arrives_in_lehi_nephi, [
    citation(verses(mosiah,7,4,5))
]).
and_then( zeniff_arrives_in_lehi_nephi, ammon_arrives_in_lehi_nephi, [
    % citation: not sure a single passage can be cited for this
]).
event( ammon_arrives_in_lehi_nephi, [
    what("Ammon arrives in Lehi-Nephi"),
    where(lehi_nephi),
    time(circa(121,bc)),
    citation(verse(mosiah,7,6))
]).

and_then( mosiah_arrives_in_zarahemla, zeniff_leaves_zarahemla, [
]).
event( zeniff_leaves_zarahemla, [
    what("Zeniff, et al depart Zarahemla"),
    where(zarahemla),
    time(circa(200,bc)),
    citation(verse(mosiah,9,3))
]).

and_then( zeniff_leaves_zarahemla, zeniff_arrives_in_lehi_nephi, [
    citation(verse(mosiah,9,4))
]).
and_then( mosiah_leaves_land_of_nephi, zeniff_arrives_in_lehi_nephi, []).
event( zeniff_arrives_in_lehi_nephi, [
    what("Zeniff, et al arrives in Lehi-Nephi"),
    where(lehi_nephi),
    time(circa(200,bc)),
    citation(verses(mosiah,9,5,7))
]).

and_then( ammon_leaves_zarahemla, limhi_arrives_in_zarahemla, []).
and_then( ammon_arrives_in_lehi_nephi, limhi_arrives_in_zarahemla, []).
event( limhi_arrives_in_zarahemla, [
    what("Limhi and his people arrive in Zarahemla"),
    where(zarahemla),
    citation(verse(mosiah,22,13))
]).

% TODO continue. starting with Mosiah 24
