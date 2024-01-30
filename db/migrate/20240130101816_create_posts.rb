class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.text :content
      t.string :onetime_password

      t.timestamps
    end
  end
end
