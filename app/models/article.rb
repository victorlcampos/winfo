class Article < ActiveRecord::Base
  attr_accessible :title, :body

  def summary_body
    my_body = body
    "#{my_body[0...500]}..." if my_body
  end
end
