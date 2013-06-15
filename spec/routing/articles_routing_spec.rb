require 'spec_helper'

describe ArticlesController do
  describe 'routing' do
    it 'routes to #show' do
      get('/articles/1').should route_to(:controller => "articles", :action => "show", :id => "1")
    end
  end
end