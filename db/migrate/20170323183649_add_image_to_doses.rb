class AddImageToDoses < ActiveRecord::Migration[5.0]
  def change
    add_column :doses, :image, :string
  end
end
