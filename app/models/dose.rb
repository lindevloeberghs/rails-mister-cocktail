class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, :ingredient_id, :cocktail_id, presence: true
  validates :ingredient_id, uniqueness: { scope: :cocktail }

  has_attachment :image

end
