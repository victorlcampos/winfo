class Article < ActiveRecord::Base
  scope :most_read, order("views DESC")
  scope :most_liked, order("likes_count DESC")

  validates :title, :body, presence: true
  validates :permalink, uniqueness: true
  attr_accessible :title, :body

  has_many :likes
  belongs_to :user
  delegate :name, to: :user

  after_create :generate_permalink, if: 'title?'

  def summary_body
    my_body = body
    "#{my_body[0...500]}..." if my_body
  end

  def posted_at
   	created_at.strftime("Postado em %d %b %Y")
  end

  def posted_entry
   	created_at.strftime("%d %b %Y")
  end

  def to_param
    permalink
  end

  def generate_permalink
    my_permalink = title.urlize
    my_permalink += "-#{self.id}" if Article.find_by_permalink(my_permalink)

    self.permalink = my_permalink
    self.save!
  end
end
