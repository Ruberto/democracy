require 'rails_helper'

describe Ballot do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:ip_address) }
  it { should validate_uniqueness_of(:ip_address) }
  it { should_not allow_value('monkey').for(:ip_address) }
  it { should allow_value('192.168.0.102').for(:ip_address) }
  it { should allow_value('2001:0db8:85a3:0000:0000:8a2e:0370:7334').for(:ip_address) }


  context 'valid topic id count' do
    before do
      @topic = create(:topic)
    end

    it 'dose not allow less votes' do
      should_not allow_value([1,2]).for(:topic_ids)
    end

    it 'dose not allow more votes' do
      should_not allow_value([1,2,3,4]).for(:topic_ids)
    end

    it 'allows exactly three votes' do
      should allow_value([@topic.id, @topic.id, @topic.id]).for(:topic_ids)
    end
  end


end
