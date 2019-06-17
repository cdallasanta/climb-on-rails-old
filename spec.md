# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Site has_many Users, for example)
- [x] Include at least one belongs_to relationship (PreuseInspection belongs_to Element, for example)
- [x] Include at least two has_many through relationships
  - PreuseInspection has_many :ropes, through: :element
  - Ropes has_many :preuse_inspections, through: :element
- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
  - PreuseInspection has_many :ropes, through: :element
  - Ropes has_many :preuse_inspections, through: :element
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user
  - Element has plenty other attributes an admin would change
  - Climb is a quasi-join table with a user-submitted attribute
- [x] Include reasonable validations for simple model objects (User, PreuseInspection, PeriodicInspection, Element, Rope, Site)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - PreUse find today's inspection
- [x] Include signup (/signup)
- [x] Include login (/login)
- [x] Include logout (/logout)
- [ ] Include third party signup/login (how e.g. Devise/OmniAuth)
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
  - /sites/1/elements
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  - /elements/1/preuse_inspections/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [ ] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
