# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [] Include at least one has_many relationship (User has_many Restaurants) 
- [x] Include at least one belongs_to relationship (Restaurant belongs_to RestaurantFoodTypes)
- [x] Include at least two has_many through relationships (Restaurant has_many FoodTypes, through RestaurantFoodTypes, FoodTypes has_many Restaurants through RestaurantFoodTypes)
- [x] Include at least one many-to-many relationship (Restaurant has_many FoodTypes, through RestaurantFoodTypes, FoodTypes has_many Restaurants through RestaurantFoodTypes)
- [ ] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
- [ ] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
- [ ] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
- [ ] Include signup
- [ ] Include login
- [ ] Include logout
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [ ] Limited logic in controllers
- [ ] Views use helper methods if appropriate
- [x] Views use partials if appropriate