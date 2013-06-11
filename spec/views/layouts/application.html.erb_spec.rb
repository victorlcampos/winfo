require 'spec_helper'

describe 'layouts/application.html.erb' do
  context 'head' do
    it 'should render title with Winfo' do
      render
      assert_select  'title', text: 'Winfo'
    end
  end

  context 'header' do
    it 'should render logo' do
      render
      assert_select 'a[href=?]', root_path, text: 'Winfo'
    end

    it 'should render footer' do
      render
      assert_select 'div.footer', text: 'Winfo.me - Copyright 2013'
    end
  end
end