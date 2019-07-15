CREATE DATABASE recipes_database;

USE recipes_database;

CREATE TABLE recipes (
  recipe_id INT NOT NULL AUTO_INCREMENT,
  recipe_name VARCHAR(30) NOT NULL,
  PRIMARY KEY (recipe_id),
  UNIQUE (recipe_name)
);

CREATE TABLE ingredients (
  ingredient_id INT NOT NULL AUTO_INCREMENT, 
  ingredient_name VARCHAR(30) NOT NULL,
  ingredient_price INT NOT NULL,
  PRIMARY KEY (ingredient_id),  
  UNIQUE (ingredient_name)
);

CREATE TABLE recipe_ingredients (
  recipe_id int NOT NULL, 
  ingredient_id INT NOT NULL, 
  amount INT NOT NULL,
  PRIMARY KEY (recipe_id,ingredient_id)
);

INSERT INTO recipes 
    (recipe_name) 
VALUES 
    ("Tacos"),
    ("Tomato Soup"),
    ("Grilled Cheese");

INSERT INTO ingredients
    (ingredient_name, ingredient_price)
VALUES 
    ("Beef", 5),
    ("Lettuce", 1),
    ("Tomatoes", 2),
    ("Taco Shell", 2),
    ("Cheese", 3),
    ("Milk", 1),
    ("Bread", 2);

INSERT INTO recipe_ingredients 
    (recipe_id, ingredient_id, amount)
VALUES
    (1,1,1),
    (1,2,2),
    (1,3,2),
    (1,4,3),
    (1,5,1),
    (2,3,2),
    (2,6,1),
    (3,5,1),
    (3,7,2);

SELECT * FROM recipes ORDER BY recipe_id;

DELETE FROM recipe_ingredients
Where recipe_id = 2;