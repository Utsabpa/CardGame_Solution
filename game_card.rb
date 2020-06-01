class Game
	def initialize
		@deck = create_deck
		@players = create_players
		@dealer = create_dealer
		@hands = []
	end

	def create_deck
		Deck.new
	end

	def create_dealer
		Dealer.new
	end

	def add_player
	end

	def remove_player(player)
	end

	def change_dealer
	end

	def create_players
		players = []
		(1..5).to_a.each do |number|
			players.push(Player.new("player" + number.to_s))
		end
		players
	end

	def new_hand
		@hands.push(Hand.new(@deck, @players, @dealer))
		@hands.last
	end
end

class Dealer

end

class Player
	attr_accessor :active, :name

	def initialize(name)
		@name = name
	end

end

class Card
	def initialize(number, color)
		@number = number
		@color = color
	end
end

class Hand
	def initialize(deck, players, dealer)
		@deck = deck
		@players = players
		@hand_dealer = HandDealer.new(self, dealer)
		@hand_players = []
		start
	end

	def start
		initialize_hand_players
		@hand_player_cards = @hand_dealer.distribute_cards(@hand_players, @deck)
	end

	def initialize_hand_players
		@players.each do |player|
			@hand_players.push(HandPlayer.new(self, player))
		end
	end

	def get_winner
		@hand_dealer.get_winner(@hand_players)
	end

end

class HandPlayer
	attr_accessor :score, :hand_player_cards, :player

	def initialize(hand, player)
		@hand = hand
		@player = player
		@hand_player_cards = []
	end

	def get_score
	end

end

class HandDealer

	def initialize(hand, dealer)
		@hand = hand
		@dealer = dealer
	end

	def shuffle(deck)
		deck.cards.shuffle!
	end

	def distribute_cards(hand_players, deck)
		shuffle(deck)
		cards = deck.cards.map(&:clone)
		(1..2).to_a.each do 
			hand_players.each do |hand_player|
				hand_player.hand_player_cards.push(HandPlayerCard.new(hand_player, cards.delete(cards.first)))
			end
		end
	end

	def get_winner(hand_players)
		hand_player = hand_players.shuffle.first
		hand_player.player
	end

end

class HandPlayerCard
	attr_accessor :winner

	def initialize(hand_player, card)
		@hand_player = hand_player
		@card = card
	end
end


class Deck
	attr_accessor :cards

	def initialize
		@cards = create_cards
	end

	def create_cards
		heart_cards = create_color_card("heart")
		club_cards = create_color_card("club")
		diamond_cards = create_color_card("diamond")
		spade_cards = create_color_card("spade")
		heart_cards + club_cards + diamond_cards + heart_cards
	end

	def create_color_card(color)
		cards = []
		numbers = ['A', 'J', 'Q', 'K'] + [2..10].to_a
		numbers.each do |i|
			cards.push(Card.new(i,color))
		end
		cards
	end
end

g1 = Game.new
hand = g1.new_hand
player = hand.get_winner
puts(player.name)
