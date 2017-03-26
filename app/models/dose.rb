# == Schema Information
#
# Table name: doses
#
#  id            :integer          not null, primary key
#  cocktail_id   :integer
#  ingredient_id :integer
#  description   :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  image         :string
#

class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, :ingredient_id, :cocktail_id, presence: true
  validates :ingredient_id, uniqueness: { scope: :cocktail }

  # image upload with attachinary
  has_attachment :image

end
