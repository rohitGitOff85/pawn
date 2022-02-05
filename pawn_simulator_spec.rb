require 'rails_helper'

RSpec.describe PawnSimulator, type: :request do
  describe "PawnSimulator" do
    context "passing '0,0,NORTH,WHITE'" do
      let!(:pawn_simulator_obj) { PawnSimulator.new }

      it "should return '0,1,NORTH,WHITE' when move with 1 step" do
        pawn_simulator_obj.place(0,0,'NORTH','WHITE')
        pawn_simulator_obj.move(1)

        x,y,f,c = pawn_simulator_obj.report
        expect(x).to eq(0)
        expect(y).to eq(1)
        expect(f).to eq('NORTH')
        expect(c).to eq('WHITE')
      end

      it "Should return 0,1,WEST,WHITE when 2times move and left 1" do
        pawn_simulator_obj.place(0,1,'NORTH','WHITE')
        pawn_simulator_obj.move
        pawn_simulator_obj.move
        pawn_simulator_obj.left

        x,y,f,c = pawn_simulator_obj.report
        expect(x).to eq(1)
        expect(y).to eq(2)
        expect(f).to eq('WEST')
        expect(c).to eq('WHITE')
      end

      it "Should return 0,1,EAST,WHITE when 3times left" do
        pawn_simulator_obj.place(0,1,'NORTH','WHITE')
        pawn_simulator_obj.left
        pawn_simulator_obj.left
        pawn_simulator_obj.left

        x,y,f,c = pawn_simulator_obj.report
        expect(x).to eq(0)
        expect(y).to eq(1)
        expect(f).to eq('EAST')
        expect(c).to eq('WHITE')
      end

      it "Should return 0,1,SOUTH,WHITE when 3times left and 1time right" do
        pawn_simulator_obj.place(0,1,'NORTH','WHITE')
        pawn_simulator_obj.left
        pawn_simulator_obj.left
        pawn_simulator_obj.left
        pawn_simulator_obj.right

        x,y,f,c = pawn_simulator_obj.report
        expect(x).to eq(0)
        expect(y).to eq(1)
        expect(f).to eq('SOUTH')
        expect(c).to eq('WHITE')
      end
    end

    context "passing 'PLACE 0,0,NORTH,BLACK'" do
      let!(:pawn_simulator_obj) { PawnSimulator.new }

      it "should return '0,0,WEST,BLACK' when 1time left" do
        pawn_simulator_obj.place(0,0,'NORTH','BLACK')
        pawn_simulator_obj.left

        x,y,f,c = pawn_simulator_obj.report
        expect(x).to eq(0)
        expect(y).to eq(0)
        expect(f).to eq('WEST')
        expect(c).to eq('BLACK')
      end

      it "should return '0,0,EAST,BLACK' when 1time left and 2times right" do
        pawn_simulator_obj.place(0,0,'NORTH','BLACK')
        pawn_simulator_obj.left
        pawn_simulator_obj.right
        pawn_simulator_obj.right

        x,y,f,c = pawn_simulator_obj.report
        expect(x).to eq(0)
        expect(y).to eq(0)
        expect(f).to eq('EAST')
        expect(c).to eq('BLACK')
      end

      it "should return '0,0,WEST,BLACK' when 3times right" do
        pawn_simulator_obj.place(0,0,'NORTH','BLACK')
        pawn_simulator_obj.right
        pawn_simulator_obj.right
        pawn_simulator_obj.right

        x,y,f,c = pawn_simulator_obj.report
        expect(x).to eq(0)
        expect(y).to eq(0)
        expect(f).to eq('WEST')
        expect(c).to eq('BLACK')
      end

      it "should return '0,0,SOUTH,BLACK' when 3times right and 1time left" do
        pawn_simulator_obj.place(0,0,'NORTH','BLACK')
        pawn_simulator_obj.right
        pawn_simulator_obj.right
        pawn_simulator_obj.right
        pawn_simulator_obj.left

        x,y,f,c = pawn_simulator_obj.report
        expect(x).to eq(0)
        expect(y).to eq(0)
        expect(f).to eq('SOUTH')
        expect(c).to eq('BLACK')
      end
    end

    context "passing '1,2,EAST,BLACK'" do
      let!(:pawn_simulator_obj) { PawnSimulator.new }

      it "should return '0,1,NORTH,BLACK' when move with 2 steps and move with 1 step and 1time left and 1time move" do
        pawn_simulator_obj.place(2,1,'EAST','BLACK')
        pawn_simulator_obj.move(2)
        pawn_simulator_obj.move(1)
        pawn_simulator_obj.left
        pawn_simulator_obj.move

        x,y,f,c = pawn_simulator_obj.report
        expect(x).to eq(3)
        expect(y).to eq(4)
        expect(f).to eq('NORTH')
        expect(c).to eq('BLACK')
      end
    end
  end
end
