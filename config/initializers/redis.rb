if Rails.env == "production"
  $redis = Redis.new(url: ENV["REDIS_URL"])
else
  $redis = Redis.new(host: "10.0.1.1", port: 6380, db: 15)
end
