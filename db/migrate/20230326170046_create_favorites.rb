class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.string :campsite_name
      t.string :image
      t.string :campsite_details
      t.string :campsite_id

      t.timestamps
    end
  end
end
