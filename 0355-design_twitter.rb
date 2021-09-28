class Twitter
  def initialize
    @user_ids_to_tweets = Hash.new() { [] }
    @user_ids_to_follows = Hash.new() { [] }
    @timestamp = 0
  end

  def post_tweet(user_id, tweet_id)
    @user_ids_to_tweets[user_id] += [[tweet_id, next_timestamp]]
  end

  def get_news_feed(user_id)
    possible_feeds = []
    possible_feeds += @user_ids_to_tweets[user_id]
    @user_ids_to_follows[user_id].uniq.each do |folowee|
      possible_feeds += @user_ids_to_tweets[folowee]
    end

    possible_feeds.sort_by{|a| a[1]}.reverse.map{|a| a[0]}.first(10)
  end

  def follow(follower_id, followee_id)
    @user_ids_to_follows[follower_id] += [followee_id]
  end

  def unfollow(follower_id, followee_id)
    @user_ids_to_follows[follower_id].delete(followee_id)
  end

  private

  def next_timestamp
    timestamp = @timestamp
    @timestamp += 1

    timestamp
  end
end