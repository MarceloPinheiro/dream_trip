(Rails.env.production? ? 
REDIS_CLIENT = Redis.new(url: ENV["REDIS_URL"])
: 
REDIS_CLIENT = Redis.new(host: "localhost"))