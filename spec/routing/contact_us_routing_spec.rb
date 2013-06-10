require 'spec_helper'

describe ContactUsController do
  describe 'routing' do
    it 'routes to #new' do
      get('contact_us/new').should route_to('contact_us#new')
    end
    it 'routes to #create' do
      post('contact_us').should route_to('contact_us#create')
    end
  end
end