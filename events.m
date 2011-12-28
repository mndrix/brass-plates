:- module events.

:- interface.
:- import_module list.
:- import_module scripture, people, locations, chronology, objects.

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
    ishmael_arrives_in_valley_of_lemuel.

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
    object(brass_plates)
]).
