if Rails.env.development? || Rails.env.test?
  REDIS = Redis.new(:port => 6379, :host => 'localhost')
end
 