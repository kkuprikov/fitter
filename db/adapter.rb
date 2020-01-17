# frozen_string_literal: true

require 'active_record'
require_relative './migrate/create_exercises'

module Fitter
  class Adapter
    def initialize(host: 'localhost', 
                   adapter: 'postgresql',
                   database:, 
                   username:, 
                   password:)
      @connection_options = { host: host,
                              adapter: adapter,
                              database: database,
                              username: username,
                              password: password }
    end

    def connect
      ActiveRecord::Base.establish_connection(**@connection_options)
      self
    end

    def create
      self
    end

    def migrate
      CreateExercises.migrate(:up)
      self
    end

    def drop_tables
      CreateExercises.migrate(:down)
      self
    end
  end
end
