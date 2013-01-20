require File.dirname(__FILE__) + '/../rubywarrior/test-drive-beginner/player'

describe "The Ruby Warrior's life" do
  let(:warrior){ mock}
  it 'should walk forward' do
    warrior.should_receive(:walk!)
    player = Player.new
    player.play_turn(warrior)
  end 
end