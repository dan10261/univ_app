class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :username
      t.string :email
      t.integer :address_id
      t.string :gender
    end
  end
end
