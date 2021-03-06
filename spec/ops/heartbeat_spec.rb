require 'spec_helper'

describe Ops::Heartbeat do
  describe '#add' do
    it 'accepts new heartbeats' do
      @heartbeat = Ops::Heartbeat.new
      @heartbeat.add(:test){ true }
      @heartbeat.heartbeats.should have(1).items
    end
  end

  describe '#check' do
    before do
      @heartbeat = Ops::Heartbeat.new
      @heartbeat.add(:test){ true }
    end

    it 'returns true for valid heartbeats' do
      @heartbeat.check(:test).should eq(true)
    end

    it 'returns false for invalid heartbeats' do
      @heartbeat.check(:invalid_test).should eq(false)
    end
  end

  describe '#heartbeats' do
    it 'returns a hash of heartbeats' do
      Ops::Heartbeat.new.heartbeats.should be_a Hash
    end
  end

  it "offers a singleton" do
    @heartbeat = Ops::Heartbeat.instance
    @heartbeat.object_id.should be Ops::Heartbeat.instance.object_id
  end

  it "checks singleton's heartbeats" do
    Ops::Heartbeat.instance.add(:test){ true }
    Ops::Heartbeat.check(:test).should be true
  end
end

describe Ops do
  it "provides convenience method to add heartbeats" do
    Ops.add_heartbeat(:convenience){ true }
    Ops::Heartbeat.check(:convenience).should be true
  end
end
