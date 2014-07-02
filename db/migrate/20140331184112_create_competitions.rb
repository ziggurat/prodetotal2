class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.integer :exact_match_points, :default => 6
      t.integer :result_match_points, :default => 3
      t.integer :no_match_points, :default => 0
      t.integer :no_forecast_points, :default => 0
      t.string :logo
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :archive

      t.timestamps
    end
  end
end
