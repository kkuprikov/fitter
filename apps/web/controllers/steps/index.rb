module Web
  module Controllers
    module Steps
      class Index
        include Web::Action

        params do
          required(:exercise_type_id) { int? }
        end

        def call(params)
          self.status = 422 unless params.valid?
          
          @data = Fitter::Repositories[:Step]
            .by_exercise_type_id(params[:exercise_type_id].to_i)
            .order(:index)
            .to_a

          
          self.body = JSON.generate(@data)
        end
      end
    end
  end
end
