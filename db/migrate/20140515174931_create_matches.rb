class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.references :competition, index: true
      t.references :local, index: true
      t.references :visitor, index: true
      t.datetime :date
      t.integer :local_score
      t.integer :visitor_score

      t.timestamps
    end
  end
end
