require 'spec_helper'

describe ArticlesController do
  describe 'routing' do
    it 'get "new"' do
      get('articles/new').should route_to('articles#new')
    end
    it 'post "create"' do
      post('articles').should route_to('articles#create')
    end
  end
end