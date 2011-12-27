:- module events.

:- interface.
:- import_module list, string.
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
    brothers_return_to_valley_of_lemuel.

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

:- pred event( event_id, list(detail)).
:- mode event(       in,          out) is det.
:- mode event(      out,          out) is multi.

:- pred and_then(event_id::out, event_id::out,list(detail)::out) is multi.


:- implementation.

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

