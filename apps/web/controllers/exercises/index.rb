module Web
  module Controllers
    module Exercises
      class Index
        include Web::Action

        USER_ID = 1

        def initialize(records: ExerciseRecordRepository.new, 
                       users: UserRepository.new, 
                       types: ExerciseTypeRepository.new)
          @records = records
          @types = types
          @user = users.find(ENV.fetch('USER_ID'){ USER_ID })
        end

        def call(params)
          # puts @data
          # self.body = JSON.generate(@data.map(&:to_h))
        end
      end
    end
  end
end
