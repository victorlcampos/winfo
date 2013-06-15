class Article < ActiveRecord::Base
  attr_accessible :title, :body

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

end
