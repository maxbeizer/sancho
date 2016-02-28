require 'dotenv'

Dotenv.tap do |de|
  # load contents of file at LITA_ENV, useful for production
  de.load(ENV['LITA_ENV']) if ENV['LITA_ENV']
  # load contents of .env from current directory, useful for development
  de.load
end

Lita.configure do |config|
  # The severity of messages to log. Options are:
  # :debug, :info, :warn, :error, :fatal
  config.robot.log_level = ENV['LOG_LEVEL'].intern

  # How you interact, either shell or slack
  config.robot.adapter = ENV['LITA_ADAPTER'].intern

  # Config for slack adapter
  config.adapters.slack.token = ENV['SLACK_TOKEN']

  # Config for shell adapter
  config.robot.name = ENV['LITA_NAME']

  # Redis
  config.redis[:url]  = ENV['REDIS_URL']
  config.redis[:port] = ENV['REDIS_PORT']

  config.http.port = ENV['PORT']

  config.robot.admins =  %w( U04MYR638 )

  config.handlers.weather.api_key = ENV['WUNDERGROUND_KEY']
end
