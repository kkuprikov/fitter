# frozen_string_literal: true

ROM::SQL.migration do
  change do
    alter_table :exercise_types do
      add_column :current_step_id, Integer
      add_column :workout_days, 'json'
    end
  end
end
