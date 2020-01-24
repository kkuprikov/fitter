require_relative 'repository'

module Fitter
  module Repositories
    class UserRepo < Repository[:users]
      def find(id)
        users.by_pk(id).one
      end
    end
  end
end
