require 'spec_helper'

describe ArticlesHelper do
  describe 'markdown(text)' do
    it 'should transform markdown to html' do
      text = '# Title'
      helper.markdown(text).should match '<h1>Title</h1>'
    end
  end
end
