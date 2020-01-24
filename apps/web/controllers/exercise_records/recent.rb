module Web
  module Controllers
    module ExerciseRecords
      class Recent
        include Web::Action

        DEFAULT_LIMIT = 5
        MAX_LIMIT = 10

        params do
          required(:step_id) { int? }
          optional(:limit) { lteq?(MAX_LIMIT) }
        end

        def call(params)
          self.status = 422 unless params.valid?
          
          @data = Fitter::Persistence.relations[:steps]
            .by_pk(params[:step_id].to_i)
            .combine(:exercise_records)
            .node(:exercise_records) do |records|
              records.order(:created_at).limit(params[:limit] || DEFAULT_LIMIT)
            end
            .to_a

          
          self.body = JSON.generate(@data)
        end
      end
    end
  end
end
