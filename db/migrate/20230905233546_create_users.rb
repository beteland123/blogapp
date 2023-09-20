class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.text :bio
      t.integer :postcounter

      t.timestamps
    end
    change_column_default :users, :photo, from: nil, to: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9c69t7bKGjfMTG3PTQ9PFMvIU6xO1tFlzqg&usqp=CAU'
  end
end
