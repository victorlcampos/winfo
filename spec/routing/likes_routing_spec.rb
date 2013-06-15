require 'spec_helper'

describe LikesController do
  describe 'routing' do
    it 'post "create"' do
      post('/articles/1/likes').should route_to(controller: "likes", action: "create", article_id: "1")
    end
  end
end