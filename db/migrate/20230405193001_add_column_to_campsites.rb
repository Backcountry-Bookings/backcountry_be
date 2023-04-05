class AddColumnToCampsites < ActiveRecord::Migration[5.2]
  def change
    add_column :campsites, :nps_id, :string
  end
end
