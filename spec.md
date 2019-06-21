# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Site has_many Users, for example)
- [x] Include at least one belongs_to relationship (PreuseInspection belongs_to Element, for example)
- [x] Include at least two has_many through relationships
  - PreuseInspection has_many :ropes, through: :element
  - Ropes has_many :preuse_inspections, through: :element
- [x] Include at least one many-to-many relationship
  - PreuseInspection has_many :ropes, through: :element
  - Ropes has_many :preuse_inspections, through: :element
- [x] The "through" part of the has_many through includes at least one user submittable attribute
  - Element has plenty other attributes an admin would change
  - Climb is a quasi-join table with a user-submitted attribute
- [x] Include reasonable validations for simple model objects (User, PreuseInspection, PeriodicInspection, Element, Rope, Site)
- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - Element.find_by(id:params[:element_id]), used on most routes
- [x] Include signup (/signup)
- [x] Include login (/login)
- [x] Include logout (/logout)
- [x] Include third party signup/login (Omniauth-facebook)
- [x] Include nested resource show or index
  - /elements/1/preuse_inspections
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
  - /elements/1/preuse_inspections/new
- [x] Include form display of validation errors (form URL e.g. /recipes/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate
