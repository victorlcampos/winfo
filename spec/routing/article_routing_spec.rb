require 'spec_helper'

describe ArticleController do
  describe 'routing' do
    it 'get "new"' do
      get(:new).should route_to('article#new')
    end
  end
end