class Ingredient < ApplicationRecord

  has_many :doses

  # implement: 'You can't delete an ingredient if it used by at least one cocktail.’


  # standard many to many association:

  # has_many :cocktails, through: :doses
  # destroying an ingredient used by at least a cocktail
  # -> fails because there are joint records in doses:
  # ActiveRecord::InvalidForeignKey: PG::ForeignKeyViolation: ERROR:  update or delete on table "ingredients" violates foreign key constraint "fk_rails_961afcf26a" on table "doses"
  # DETAIL:  Key (id)=(2) is still referenced from table "doses".


  # so we want to deal with this with one of the dependent: options


  # option 1
  # has_many :cocktails, through: :doses, dependent: :destroy
  # -> deals with it by destroying also the doses
  # => not what we want!

  # option 2
  # has_many :cocktails, through: :doses, dependent: :restrict_with_exception
  # destroying an ingredient used by at least a cocktail
  # -> deals with it by raising a specific error instead of the ActiveRecord::InvalidForeignKey error
  # i.e. ActiveRecord::DeleteRestrictionError: Cannot delete record because of dependent cocktails
  # -> then you can rescue this specific error in your controller :)

  # option 3
  has_many :cocktails, through: :doses, dependent: :restrict_with_error
  # destroying an ingredient used by at least a cocktail
  # -> deals with it by not failing but just returning false
  # -> so you can do if ingredient.destroy in your controller :)

  validates :name, presence: true, uniqueness: true
end
