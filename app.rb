require 'sinatra'
require 'redis'
require 'socket'

redis = Redis.new(host: 'redis', db: 0, 
                  password: ENV['REDIS_ENV_REDIS_PASS'])
set :bind, '0.0.0.0'
set :port, 80


get '/' do
  begin
    @visits = redis.incr('counter')
  rescue
    @visits = '<i>cannot connect to Redis, counter disabled</i>'
  end

  "#{@visits}"
end

