class CreateFollowingRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :following_relationships do |t|
      t.integer :follower_id, null: false
      t.integer :followed_users_id, null: false

      t.timestamps
    end

    add_foreign_key :following_relationships, :users, column: :follower_id
    add_foreign_key :following_relationships, :users, column: :followed_users_id

    add_index :following_relationships, [:follower_id, :followed_users_id],
              name: :index_follower_following_relationship,
              unique: true
  end
end
