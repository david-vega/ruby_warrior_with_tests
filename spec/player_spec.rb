require File.dirname(__FILE__) + '/../rubywarrior/test-drive-beginner/player'

describe "The Ruby Warrior's life" do
  let(:warrior){ mock }
  before do
    @player = Player.new
  end

 context 'when the warrior is strong' do
    before do
      warrior.stub(:health).and_return 20
    end
    it 'should walk forward when there is no enemies' do
      warrior.stub_chain(:feel, :empty?).and_return true
      warrior.should_receive(:walk!)
      @player.play_turn(warrior)
    end 

    it 'should attack when there is enemies' do
      warrior.stub_chain(:feel, :empty?).and_return false
      warrior.should_receive(:attack!)
      @player.play_turn(warrior)
    end
  end

  context 'when the warrior is weak' do
    before do
      warrior.stub(:health).and_return 5
    end
    it 'should rest when there is no enemies' do
      warrior.stub_chain(:feel, :empty?).and_return true
      warrior.should_receive(:rest!)
      @player.play_turn(warrior)
    end

    it 'should keep atacking when there is an enemy' do
      warrior.stub_chain(:feel, :empty?).and_return false
      warrior.should_receive(:attack!)
      @player.play_turn(warrior)
    end
  end
end