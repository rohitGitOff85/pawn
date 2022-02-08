require 'rails_helper'

RSpec.describe Pawn, type: :model do
  describe ".process_comments" do
    let!(:obj) { PawnSimulator.new }

    context "when type is 'place'" do
      let!(:type) { "place" }
      let!(:options) { {:x => 0, :y => 0, :f => "NORTH", :c => "BLACK"} }
      it "Should call PawnSimulator -> place function" do
        expect_any_instance_of(PawnSimulator).to receive(:place).once.with(0,0,"NORTH","BLACK")
        Pawn.process_comments(obj, type, options)
      end
    end

    context "when type is 'move'" do
      let!(:type) { "move" }
      let!(:options) { {:no_of_step => 1} }
      it "Should call PawnSimulator -> move function" do
        expect_any_instance_of(PawnSimulator).to receive(:move).once.with(1)
        Pawn.process_comments(obj, type, options)
      end
    end

    context "when type is 'left'" do
      let!(:type) { "left" }
      it "Should call PawnSimulator -> left function" do
        expect_any_instance_of(PawnSimulator).to receive(:left).once
        Pawn.process_comments(obj, type)
      end
    end

    context "when type is 'right'" do
      let!(:type) { "right" }
      it "Should call PawnSimulator -> right function" do
        expect_any_instance_of(PawnSimulator).to receive(:right).once
        Pawn.process_comments(obj, type)
      end
    end

    context "when type is 'report'" do
      let!(:type) { "report" }
      it "Should call PawnSimulator -> report function" do
        expect_any_instance_of(PawnSimulator).to receive(:report).once
        Pawn.process_comments(obj, type)
      end
    end
  end
end