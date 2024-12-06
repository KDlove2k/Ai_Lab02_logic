% Facts
animal(lion).
animal(tiger).
animal(elephant).
animal(cow).
animal(dog).
animal(cat).
animal(crocodile).
animal(snake).
animal(sparrow).
animal(eagle).
animal(shark).
animal(dolphin).
animal(whale).
animal(buffalo).
animal(frog).
/***sâu***/
animal(caterpillar).

/*Phân loại động vật*/
/*Động vật có vú*/
mammal(lion).
mammal(tiger).
mammal(elephant).
mammal(cow).
mammal(dog).
mamal(cat).
mammal(dolphin).
mammal(whale).
mammal(buffalo).

/*loài bò sát*/
reptile(crocodile).
reptile(snake).

/*Loài chim*/
bird(sparrow).
bird(eagle).

/*Loài cá*/
fish(shark).
fish(dolphin).
fish(whale).

/*Côn trùng*/
insect(caterpillar).

/*Lưỡng cư*/
amphibian(frog).

/* Tính chất động vật*/
/*động vật ăn thịt*/
is_predator(lion).
is_predator(tiger).
is_predator(shark).
is_predator(eagle).
is_predator(crocodile).

/*động vật ăn cỏ*/
is_herbivore(elephant).
is_herbivore(cow).
is_herbivore(buffalo).

/*Động vật sống dưới nước*/
is_aquatic(dolphin).
is_aquatic(shark).
is_aquatic(whale).

/*có cánh*/
has_wings(sparrow).
has_wings(eagle).

/*có chân*/
has_legs(lion, 4).
has_legs(tiger, 4).
has_legs(elephant, 4).
has_legs(cow, 4).
has_legs(dog, 4).
has_legs(cat, 4).
has_legs(crocodile, 4).
has_legs(snake, 0).
has_legs(frog, 4).
has_legs(buffalo, 4).

/*vật nuôi*/
is_domestic(dog).
is_domestic(cow).
is_domestic(buffalo).
is_domestic(cat).

% Rules
is_mammal(X) :- mammal(X).
is_reptile(X) :- reptile(X).
is_bird(X) :- bird(X).
is_fish(X) :- fish(X).
is_insect(X) :- insect(X).
is_amphibian(X) :- amphibian(X).

is_predator(X) :- is_predator(X).
is_herbivore(X) :- is_herbivore(X).
is_aquatic(X) :- is_aquatic(X).
has_wings(X) :- has_wings(X).
has_legs(X, L) :- has_legs(X, L).

/****Quy tắc cho các động vật có vú****/
/*động vật có vú ăn thịt*/
is_a_mammal_predator(X) :- is_mammal(X), is_predator(X).
/*động vật có vú ăn cỏ*/
is_a_mammal_herbivore(X) :- is_mammal(X), is_herbivore(X).

/*Các mối quan hệ phân cấp*/
is_animal(X) :- animal(X).
/*động vật có xương sống*/
is_vertebrate(X) :- is_mammal(X).
is_vertebrate(X) :- is_reptile(X).
is_vertebrate(X) :- is_bird(X).
is_vertebrate(X) :- is_fish(X).
is_vertebrate(X) :- is_amphibian(X).
is_invertebrate(X) :- is_insect(X).

/*Các loại động vật theo môi trường sống*/
is_land_animal(X) :- is_vertebrate(X), \+ is_aquatic(X).
is_water_animal(X) :- is_aquatic(X).
is_flying_animal(X) :- has_wings(X).
is_land_water_animal(X):- amphibian(X).
?- has_legs(cow,3).
