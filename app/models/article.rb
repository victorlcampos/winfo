class Article < ActiveRecord::Base
  attr_accessible :title, :body

  def summary_body
    "#{body[0...500]}..."
  end
end
