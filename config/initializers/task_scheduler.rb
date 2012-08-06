require 'rufus/scheduler'

if Rails.env.production?
  scheduler = Rufus::Scheduler.start_new

  urls = %w[http://google.com http://amazon.com http://facebook.com http://apple.com]

  time = [2, 7, 18, 21]

  scheduler.every "#{time.sample}m" do
     require "net/http"
     require "uri"
     url = urls.shuffle.take(1)
     Net::HTTP.get_response(URI.parse(url))
  end
end
