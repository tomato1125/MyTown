class AddUserToClips < ActiveRecord::Migration[6.0]
  def change
    add_reference :clips, :user, null: false, foreign_key: true
    add_reference :clips, :post, null: false, foreign_key: true
  end
end
