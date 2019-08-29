class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :job
      t.text :profile
      t.string :password
      t.string :user_name
      t.string :image_name

      t.timestamps
    end
  end
end
