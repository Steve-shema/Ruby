class Player
    
    def hand(hand)
      return hand
    end
end

class Enemy
  def hand(hand)
    return hand
  end
end
	 
	 class Janken
		def pon(player_hand, enemy_hand)
			result=((player_hand-enemy_hand+3)%3)
			if(result==2)
				return "win"
			elsif(result==1)
				return "loss"
			else
				return "draw" 
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
	player = Player.new
	player_hand=player.hand(number)
	arr=[0,1,2]
	randomly=arr[rand(arr.count)];
	enemy = Enemy.new
	enemy_hand=enemy.hand(randomly)
	janken = Janken.new

	result=janken.pon(player_hand,enemy_hand)
if(result=="win")
	puts"the hand the other party is throb.You are the winner"
	break
elsif(result=="loss")
	puts"the hand the other party is throb.You Loose"
	break
elsif(result=="draw")
	puts"the hand the other party is throb.Its a draw"
end
end
end