require 'spec_helper'

describe Article do
  context 'general methods' do
    describe '#summary_body' do
      context 'with body' do
        subject { FactoryGirl.create(:article, body: 'a'*5000) }
        it 'should cut body in 500 and add ...' do
          subject.summary_body.should == 'a'*500+'...'
        end
      end

      context 'with body' do
        subject { FactoryGirl.create(:article, body: nil) }
        it 'should cut body in 500 and add ...' do
          subject.summary_body.should == nil
        end
      end
    end
  end
end
