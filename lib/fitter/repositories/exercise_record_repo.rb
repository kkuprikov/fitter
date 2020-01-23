require_relative 'repository'

module Fitter
  module Repositories
    class ExerciseRecordRepo < Repository[:exercise_records]
      commands :create

      def all_by_user(user)
        exercise_records.where(user_id: user.id).
          order(:created_at)
      end

      def recent_by_user(user, limit: 10)
        exercise_records.where(user_id: user.id).
          order(:created_at).
          limit(limit)
      end

      def last_by_user_and_type(user, exercise_type_id: type_id)
        exercise_records.where(user_id: user.id, exercise_type_id: type_id).
          order(:created_at).
          one!
      end
    end
  end
end
