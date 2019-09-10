class Player
    attr_accessor :hand
    def initialize(hand)
      @hand=hand
    end
    def hand
      return @hand
    end
end

class Enemy
  attr_accessor :hand
  def initialize(hand)
    @hand=hand
  end
  def hand
    return @hand
  end
end
	 
	 class Janken
		attr_accessor :player_hand,:enemy_hand
		def initialize(player_hand,enemy_hand)
			@player_hand=player_hand
			@enemy_hand=enemy_hand
		end
		def pon(player_hand, enemy_hand)
			result=((player_hand-enemy_hand+3)%3)
			if(result==2)
				return "You are Winner"
			elsif(result==1)
				return "You loose"
			else
				return "Its a Draw" 
			end

		end
	 end

while(true) do	
puts "Choose a number:"
puts "0: Goo"
puts "1: Choki"
puts "2: Par"
number=gets.to_i
if(number<0 || number>3)
	puts "out of range"
else
	player = Player.new(number)
	arr=[0,1,2]
	randomly=arr[rand(arr.count)];
	enemy = Enemy.new(randomly)
	puts randomly
	janken = Janken.new(player,enemy)
	puts "#{janken.pon(player.hand,enemy.hand)}"

end
end
