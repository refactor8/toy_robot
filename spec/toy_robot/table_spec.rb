require 'spec_helper'

RSpec.describe ToyRobot::Table do
  subject { ToyRobot::Table.new(5, 5) }

  context "valid location?" do
    it { is_expected.to be_valid_location(0, 0) }
    it { is_expected.to be_valid_location(0, 0) }
    it { is_expected.not_to be_valid_location(5, 5) }
    it { is_expected.not_to be_valid_location(-1, -1) }
  end
end
