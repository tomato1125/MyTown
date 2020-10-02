class AddPostToSpots < ActiveRecord::Migration[6.0]
  def change
    add_reference :spots, :post, null: false, foreign_key: true
  end
end
