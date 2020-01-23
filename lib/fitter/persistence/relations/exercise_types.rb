module Fitter
  module Persistence
    module Relations
      class ExerciseTypes < ROM::Relation[:sql]
        schema(:exercise_types, infer: true) do
          associations do
            has_many   :exercise_records
            belongs_to :users, as: :user
          end
        end
      end
    end
  end
end