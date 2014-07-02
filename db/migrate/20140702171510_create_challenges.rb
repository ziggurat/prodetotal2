class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.string :name
      t.string :description
      t.belongs_to :owner, index: true
      t.belongs_to :competition, index: true

      t.timestamps
    end
  end
end
