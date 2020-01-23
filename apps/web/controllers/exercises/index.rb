module Web
  module Controllers
    module Exercises
      class Index
        include Web::Action

        def initialize(repository: ExerciseRecordRepository.new)
          @current_user = 
          @repository = repository
        end

        def call(params)
          @repository.all_by_user(@current_user)
        end
      end
    end
  end
end
