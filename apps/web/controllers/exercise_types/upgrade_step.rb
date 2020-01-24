module Web
  module Controllers
    module ExerciseTypes
      class UpgradeStep
        include Web::Action

        EDGE_STEP = 10

        params do
          required(:exercise_type_id)
        end

        def initialize
          @steps_repo = Fitter::Repositories[:Step]
          @types_repo = Fitter::Repositories[:ExerciseType]
        end

        def call(params)
          return self.status = 422 unless params.valid?

          current_step_id = @types_repo.by_id(params[:exercise_type_id]).current_step_id
          @current_step = @steps_repo.by_id(current_step_id)
          
          return self.status = 422 if EDGE_STEP == @current_step.index
          
          @prev_step = @steps_repo.by_exercise_type_id_and_index(params[:exercise_type_id], index: @current_step.index + 1)

          self.body = JSON.generate(@types_repo.update(params[:exercise_type_id], current_step_id: @prev_step.id))
        end
      end
    end
  end
end
