class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.integer :age
      t.decimal :height
      t.decimal :weight
      t.string :lifestyle

      t.timestamps
    end
  end
end
