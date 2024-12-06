/*Facts về giới tính*/
male(philip).
male(charles).
male(mark).
male(andrew).
male(edward).

male(timothy).

male(edoardo).
male(peter).

male(jack).
male(august).

male(james).

male(mike_tindall).
male(lucas).
male(lena).

male(harry).
male(archie_harrison).

male(william).
male(louis).
male(george).


female(elizabeth_ii).
female(diana).
female(anne).
female(sarah).
female(sophie).

female(camilla).

female(beatrice).
female(sienna).

female(eugenie).

female(lady_louise).

female(kate).

female(catherine_duchess).
female(charlotte).

female(meghan).
female(lilibet_diana).

female(autumn).
female(isla).
female(savannah).

female(zara_tindall).
female(mia).


/* Facts về mối quan hệ cha mẹ - con cái*/
parent(elizabeth_ii, charles).
parent(elizabeth_ii, anne).
parent(elizabeth_ii, andrew).
parent(elizabeth_ii, edward).
parent(philip, charles).
parent(philip, anne).
parent(philip, andrew).
parent(philip, edward).

parent(charles, william).
parent(charles, harry).
parent(diana, william).
parent(diana, harry).
parent(william, george).
parent(william, charlotte).
parent(william, louis).
parent(mark, peter).
parent(mark, zara).
parent(anne, peter).
parent(anne, zara).
parent(adrew, beatrice).
parent(adrew, eugenie).
parent(sarah, beatrice).
parent(sarah, eugenie).
parent(adward, lady_louise).
parent(sophie, lady_louise).

parent(lady_louise,james).
parent(jack, august).
parent(eugenie, august).
parent(beatrice, sienna).
parent(edoardo, sienna).

parent(william, george).
parent(william, charlotte).
parent(william, louis).
parent(catherine_duchess, george).
parent(catherine_duchess, charlotte).
parent(catherine_duchess, louis).
parent(harry, archie_harison).
parent(harry, lilibet_diana).
parent(meghan, archie_harrison).
parent(meghan, lilibet_diana).
parent(peter,savannah).
parent(peter, savannah).
parent(autumn,savannah).
parent(autumn, savannah).
parent(zara_tindall, mia).
parent(zara_tindall, lena).
parent(zara_tindall, lucas).
parent(mike_tindall, mia).
parent(mike_tindall, lena).
parent(mike_tindall, lucas).



/*Facts về mối quan hệ vợ/chồng*/
married(elizabeth_ii, philip).
married(charles, diana).
married(charles, camilla).
married(anne, timothy).
married(anne, mark).
married(andrew,sarah).
married(edward,sophie).

married(william, catherine_duchess).
married(harry, meghan).
married(peter,autumn).
married(mike_tindall,zara_tindall).
married(edoardo,beatrice).
married(jack,eugenie).

/*Facts về các mối quan hệ đã ly hôn*/
divorced(charles, diana).
divorced(mark,anne).
divorced(andrew,sarah).

/*Facts về người đã qua đời*/
deceased(philip).
deceased(elizabeth_ii).
deceased(diana).

/* Rule cho vợ/chồng*/
husband(Person, Wife) :- male(Person), married(Person, Wife).
wife(Person, Husband) :- female(Person), married(Husband, Person).

/* Rule cho ông bà*/
grandparent(GP, GC) :- parent(GP, P), parent(P, GC).
grandfather(GF, GC) :- male(GF), grandparent(GF, GC).
grandmother(GM, GC) :- female(GM), grandparent(GM, GC).

/*  Rule cho anh/chị em*/
sibling(Person1, Person2) :- parent(P, Person1), parent(P, Person2), Person1 \= Person2.
brother(Person, Sibling) :- male(Person), sibling(Person, Sibling).
sister(Person, Sibling) :- female(Person), sibling(Person, Sibling).

/* Rule cho con trai, con gái*/
father(Parent, Child) :- male(Parent), parent(Parent, Child).
mother(Parent, Child) :- female(Parent), parent(Parent, Child).
son(Child, Parent) :- male(Child), parent(Parent, Child).
daughter(Child, Parent) :- female(Child), parent(Parent, Child).

/* Rule cho cháu, cháu trai, cháu gái*/
grandchild(GC, GP) :- grandparent(GP, GC).
grandson(GS, GP) :- male(GS), grandchild(GS, GP).
granddaughter(GD, GP) :- female(GD), grandchild(GD, GP).

/* Rule cho dì, cậu, bác*/
aunt(Person, NieceNephew) :- female(Person), sibling(Person, Parent), parent(Parent, NieceNephew).
uncle(Person, NieceNephew) :- male(Person), sibling(Person, Parent), parent(Parent, NieceNephew).
niece(Person, AuntUncle) :- female(Person), (aunt(AuntUncle, Person); uncle(AuntUncle, Person)).
nephew(Person, AuntUncle) :- male(Person), (aunt(AuntUncle, Person); uncle(AuntUncle, Person)).

