/*****************************************************************************

		Copyright (c) My Company

 Project:  CPCS331_EAR_PROJECT_TOURISMSYSTEM
 FileName: CPCS331_EAR_PROJECT_TOURISMSYSTEM.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
 
  Name                ID
Razan Aljuhani      1806065
Haya Alsheikh       1806208
Wejdan Alzahrani    1708094
Lama Khaled         1805751
******************************************************************************/

include "cpcs331_ear_project_tourismsystem.inc"

domains
city=symbol
attributes=symbol
question=symbol

facts
yes_answer(attributes)
no_answer(attributes)

predicates
nondeterm display
nondeterm loop
nondeterm main
nondeterm city(symbol)
nondeterm attributes(symbol)
nondeterm clear_yes_answer
nondeterm clear_no_answer
check(question,attributes)
store(attributes,symbol)
ask(question,attributes) 

clauses
display:-
write("*************************************************************************************\n"),
write("                       Welcome to Tourism System                                     \n"),
write("*************************************************************************************\n\n\n"),
write("Please answer the following test questions with yes or no (y/n), To determine the expected city. "),loop.

%loop to can repeat the test
loop:-
nl,nl, main,
write("\n*************************************************************************************\n"),
write("\nDo you want to restart the test? (y/n) "),
readchar(Ans), write(Ans),Ans><'n',!,
nl,clear_yes_answer,clear_no_answer,loop.
loop:-
write("\n\nThank you for using Tourism System :) ...\n\n").

% main to start testing
main:-
city(City),!,
write("\nThe test have been finished.. \n"),
write("The best city you can visit in the country  ",City).
% In pre-main when can't determine the city
main:-
write("\nWe could not identify the city").
% check for pre-answer about Attributes
check(_,Attributes):-
yes_answer(Attributes),!.
%check for pre-answer,and ask user
check(Question,Attributes):-
not(no_answer(Attributes)),ask(Question,Attributes).
% ask user and get the answer
ask(Question,Attributes):-
write(Question), readln(Answer),
store(Attributes,Answer),Answer="y".
% store the pre-answers of Attributes
store(Attributes,"y"):-
asserta(yes_answer(Attributes)). %store yes answers
store(Attributes,"n"):-
asserta(no_answer(Attributes)). %store no answers

%clear all the saved answers from system
clear_yes_answer:-retract(yes_answer(_)),fail.
clear_yes_answer.
clear_no_answer:-retract(no_answer(_)),fail.
clear_no_answer.

%_________________________________________________________________________________________________________________
%Attributes
%common Attributes
attributes(have_children):- check("Are there children with you on this trip? (y/n) ",have_children).
attributes(natural_places):- check("Do you prefer to spend time in quiet, natural places? (y/n) ",natural_places).
attributes(shopping):- check("Do you want to spend your time shopping? (y/n) ",shopping).
attributes(traditional_places):- check("Do you prefer visiting traditional places? (y/n) ",traditional_places).
attributes(beaches):- check("Do you like to go to the beaches? (y/n) ",beaches).
attributes(museums):- check("Do you like visiting historical monuments and ancient museums? (y/n) ",museums).
attributes(cold_weather) :- check("Do you like the cold weather? (y/n) ",cold_weather).

%Special attributes for Saudi Arabia
attributes(saudi_arabia):- check("Do you interested to visit Saudi Arabia? (y/n) ",saudi_arabia).
attributes(umrah_hajj):- check("Do you want to perform Umrah or Hajj? (y/n) ",umrah_hajj).
attributes(kaaba) :- check("Do you want to pray in the mosque near the kaaba ? (y/n) ",kaaba).
attributes(prophet_mosque):- check("Do you want to visit the Prophet's Mosque? (y/n) ",prophet_mosque).
attributes(honorable_kindergarten) :- check("Do you want to pray at the honorable kindergarten? (y/n) ",honorable_kindergarten).
attributes(mount_Uhud) :- check("Do you want to visit the Uhud mount ? (y/n) ",mount_Uhud).
attributes(fountain):- check("Do you want to see the largest fountain in the wourld? (y/n) ",fountain).

%Special attributes for Egypt
attributes(egypt):- check("Do you interested to visit Egypt? (y/n) ",egypt).
attributes(pyramids):- check("Do you want to visit the Pyramids ?(y/n) ",pyramids).

%Special attributes for United Arab Emirates
attributes(uae):- check("Do you interested to visit United Arab Emirates(UAE)? (y/n) ",uae).
attributes(ferrari):- check("Do you want to visit Ferrari theme park? (y/n) ",ferrari).
attributes(gardens):- check("Are you interested in gardens? (y/n) ",gardens).

%Special attributes for Turkey
attributes(turkey):- check("Do you interested to visit Turkey? (y/n) ",turkey).
attributes(houses):- check("Do you like simple, wooden houses? (y/n) ",houses).


%Special attributes for East Asia
attributes(east_asia):- check("Do you interested to visit East Asia? (y/n) ",east_asia).
attributes(music):- check("Do you like music? (y/n) ",music).
attributes(parks):- check("Do you like to spend your time in water amusement parks?(y/n) ",parks).
attributes(seafood):- check("Do you like seafood? (y/n) ",seafood).

%____________________________________________________________________________________________________________________
% cities in Saudi Arabia
city(makkah):-
attributes(saudi_arabia),attributes(kaaba),attributes(umrah_hajj).
city(madinah):-
attributes(saudi_arabia),attributes(prophet_mosque),attributes(honorable_kindergarten),attributes(mount_Uhud).
city(abha):-
attributes(saudi_arabia),attributes(natural_places),attributes(cold_weather).
city(jeddah):-
attributes(saudi_arabia),attributes(shopping), attributes(fountain).

% cities in Egypt
city(cairo):-
attributes(egypt),attributes(shopping).
city(giza):-
attributes(egypt),attributes(natural_places),attributes(traditional_places),attributes(pyramids).
city(sharm_elsheikh):-
attributes(egypt),attributes(natural_places),attributes(beaches).

% cities in United Arab Emirates(UAE)
%---------
city(dubai):-
attributes(uae),attributes(beaches),attributes(shopping).
city(abu_dhabi):-
attributes(uae),attributes(beaches),attributes(gardens),attributes(ferrari).
city(ajman):-
attributes(uae),attributes(beaches),attributes(gardens),attributes(traditional_places).

% cities in Turkey 
city(istanbul):-
attributes(turkey),attributes(museums),attributes(shopping).
city(antalya):-
attributes(turkey),attributes(museums),attributes(beaches),attributes(houses).
city(trabzon):-
attributes(turkey),attributes(beaches),attributes(natural_places).

% cities in East Asia 
city(japan):-
attributes(east_asia),attributes(seafood),attributes(museums),attributes(natural_places) .
city(korea):-
attributes(east_asia),attributes(seafood),attributes(have_children),attributes(museums),attributes(music).
city(malaysya):-
attributes(east_asia),attributes(seafood),attributes(have_children),attributes(parks).

goal
display.


