# frozen_string_literal: true

class ExerciseType < ActiveRecord::Base
  has_many :exercises
end