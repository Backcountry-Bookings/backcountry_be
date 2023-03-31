class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :campsite_id
      t.string :description
      t.float :rating
      t.string :site_name

      t.timestamps
    end
  end
end
