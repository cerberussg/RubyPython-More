module SocialTool
  def self.twitter_search
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['YOUR_CONSUMER_KEY']
      config.consumer_secret     = ENV['YOUR_CONSUMER_SECRET']
      config.access_token        = ENV['YOUR_ACCESS_TOKEN']
      config.access_token_secret = ENV['YOUR_ACCESS_SECRET']
    end

    client.search("#python, #rubyonrails", result_type: 'recent').take(6).collect do |tweet|
      "#{tweet.user.screen_name}: #{tweet.text}"
    end
  end
end
