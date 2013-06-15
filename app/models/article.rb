class Article < ActiveRecord::Base
  attr_accessible :title, :body, :name, :email

  def summary_body
    my_body = body
    "#{my_body[0...500]}..." if my_body
  end

  def posted_at
   	created_at.strftime("Postado em %d %b %Y")
  end

end
