class AddUsersToFavorites < ActiveRecord::Migration[5.2]
  def change
    add_reference :favorites, :user, foreign_key: true
  end
end
