require 'spec_helper'

describe Article do
  context 'relationship' do
    it { should have_many(:likes) }
    it { should belong_to(:user) }
  end

  context 'validates' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:body) }
  end
  context 'general methods' do
    describe '#summary_body' do
      context 'with body' do
        subject { FactoryGirl.create(:article, body: 'a' * 5000) }
        it 'should cut body in 500 and add ...' do
          subject.summary_body.should == 'a' * 500 + '...'
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

  describe '#posted_entry' do
      context 'correct date' do
        subject { FactoryGirl.create(:article, created_at: Date.new(2013,06,15)) }
        it 'should write 15 Jun 2013' do
          subject.posted_entry.should == subject.created_at.day.to_s + " Jun " + subject.created_at.year.to_s
        end
      end
    end
  end

  context 'delegated mathods' do
    let!(:user) { FactoryGirl.create(:user) }
    subject { FactoryGirl.create(:article, user: user) }
    describe '#name' do
      it "should return user.name" do
        subject.name.should eq(user.name)
      end
    end
  end
end
