# frozen_string_literal: true

# This migration creates the likes table in the database.
class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :posts, foreign_key: { to_table: :posts }
      t.timestamps
    end
  end
end
