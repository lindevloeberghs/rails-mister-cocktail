# == Schema Information
#
# Table name: cocktails
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  picture    :string
#

class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  # dependent destroy makes sure that all doses belonging to a cocktail are destroyed too when that cocktail is destroyed
  has_many :ingredients, through: :doses #, dependent: :restrict_with_error # or dependent: :restrict_with_exception
  # dependent restrict prevents deletion of an ingredient when it's used by min 1 cocktails

  validates :name, presence: true, uniqueness: true

  # image upload with carrierwave
  mount_uploader :picture, PictureUploader

end
