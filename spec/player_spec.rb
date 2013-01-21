require File.dirname(__FILE__) + '/../rubywarrior/test-drive-beginner/player'

describe "The Ruby Warrior's life" do
  let(:warrior){ mock}
  before do
    @player = Player.new
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