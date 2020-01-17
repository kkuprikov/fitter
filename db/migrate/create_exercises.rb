class CreateExercises < ActiveRecord::Migration[5.0]
  def up
    create_table :users do |t|
      t.string :name
      t.string :email
      t.timestamps
    end

    create_table :exercise_types do |t|
      t.string :name
      t.jsonb :progression
    end

    create_table :exercises do |t|
      t.integer :exercise_type_id
      t.integer :user_id
      t.integer :period
      t.integer :sets
      t.integer :reps
      t.timestamps
    end
  end
end