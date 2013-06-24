class Like < ActiveRecord::Base
  belongs_to :article, counter_cache: :likes_count
  attr_accessible :remote_ip, :article_id
end
