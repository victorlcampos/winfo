require 'spec_helper'

describe ArticlesController do
  describe 'routing' do
    it 'routes to #show' do
      get('/articles/1').should route_to('articles#show')
    end
  end
end