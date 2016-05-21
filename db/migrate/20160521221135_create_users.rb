class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.references :game, index: true, foreign_key: true
      t.integer :team
      t.integer :role
    end
  end
end
