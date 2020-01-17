# frozen_string_literal: true

class Exercise < ActiveRecord::Base
  belongs_to :user
  belongs_to :exercise_type
end