require_relative 'repository'

module Fitter
  module Repositories
    class ExerciseTypeRepo < Repository[:exercise_types]
      def ids_by_user(user)
        exercise_types.where(user_id: user.id).
          order(:created_at).
          pluck(:id)
      end
    end
  end
end
