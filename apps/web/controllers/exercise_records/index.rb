module Web
  module Controllers
    module ExerciseRecords
      class Index
        include Web::Action

        params do
          required(:step_id) { int? }
        end

        def call(params)
          self.status = 422 unless params.valid?
          
          @data = Fitter::Persistence.relations[:steps]
            .by_pk(params[:step_id].to_i)
            .combine(:exercise_records)
            .to_a

          
          self.body = JSON.generate(@data)
        end
      end
    end
  end
end
