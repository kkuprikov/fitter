class StepRepository < Hanami::Repository
  def by_exercise(exercise)
    steps.where(exercise_id: exercise.id).order(:index)
  end

  def by_exercise_and_index(exercise, index: 1)
    steps.where(exercise_id: exercise.id, index: index).one!
  end
end
