require 'spec_helper'

RSpec.describe ToyRobot::CLI do
  subject { ToyRobot::CLI.new }

  context "load_commands" do
    it "loads commands from a file" do
      path = File.dirname(__FILE__) + "/../fixtures/commands.txt"
      commands = subject.load_commands(path)
      expect(commands).to eq([
        [:place, 0, 0, "NORTH"],
        [:move],
        [:turn_right],
        [:move],
        [:turn_left],
        [:move],
        [:move],
        [:turn_left],
        [:move],
        [:turn_right],
        [:turn_right],
        [:move],
        [:move],
        [:move],
        [:report]
      ])
    end
  end

  context "run" do
    let(:simulator) {
      instance_double(ToyRobot::Simulator)
    }

    before do
      allow(subject).to receive(:simulator) { simulator }
    end

    context "place command" do
      it "passes a place command to the simulator" do
        expect(simulator).to receive(:place).with(0, 0, "NORTH")
        subject.run([[:place, 0, 0, "NORTH"]])
      end
    end

    context "move command" do
      it "passes the command to the simulator" do
        expect(simulator).to receive(:move)
        subject.run([[:move]])
      end
    end

    context "left command" do
      it "passes the command to the simulator" do
        expect(simulator).to receive(:turn_left)
        subject.run([[:turn_left]])
      end
    end

    context "right command" do
      it "passes the command to the simulator" do
        expect(simulator).to receive(:report)
        subject.run([[:report]])
      end
    end
  end
end
