module Web
  module Controllers
    module Exercises
      class Create
        include Web::Action

        USER_ID = 1

        def call(params)
          attrs = params[:record].merge(user_id: ENV.fetch('USER_ID'){ USER_ID })
          @record = Fitter::Repositories[:ExerciseRecord].create(attrs)
        end
      end
    end
  end
end
