class WelcomeController < ApplicationController
  def index
    render text: "Welcome aboard! Redis uptime: #{redis.info['uptime_in_seconds']}s. Postgresql: #{postgresql.tables.join}"
  end

  private

  def postgresql
    ActiveRecord::Base.connection
  end

  def redis
    @redis ||= Redis.new(host: 'herokuRedis', port: 6379)
  end
end
