require 'spec_helper'

describe Article do
  context 'general methods' do
    describe '#summary_body' do
      context 'with body' do
        subject { FactoryGirl.create(:article, body: 'a' * 5000) }
        it 'should cut body in 500 and add ...' do
          subject.summary_body.should == 'a' * 500 + '...'
        end
      end

      context 'with body' do
        subject { FactoryGirl.create(:article, body: nil) }
        it 'should cut body in 500 and add ...' do
          subject.summary_body.should == nil
        end
      end
    end

    describe '#posted_at' do
      context 'correct date' do
        subject { FactoryGirl.create(:article, created_at: Date.new(2013,06,15)) }
        it 'should write Postado em 15 Jun 2013' do
          subject.posted_at.should == "Postado em " + subject.created_at.day.to_s + " Jun " + subject.created_at.year.to_s
        end
      end
    end

  end
end
