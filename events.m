:- module events.

:- interface.
:- import_module list.
:- import_module scripture, people, locations, chronology, objects.
:- import_module time_span.

% unique identifiers for each event
:- type event_id --->
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
    lehi_arrives_in_bountiful.

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

