require 'rails_helper'

describe Topic do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:author) }

  describe '#state' do
    it 'should have open state by default' do
      expect(Topic.new.open?).to be_truthy
    end
  end
end
