class ExerciseRecordRepository < Hanami::Repository
  def all_by_user(user)
    exercise_records.where(user_id: user.id).
      order(:created_at)
  end

  def recent_by_user(user, limit: 10)
    exercise_records.where(user_id: user.id).
      order(:created_at).
      limit(limit)
  end
end
