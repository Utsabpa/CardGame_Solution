## Command to execute the program
ruby game_card.rb

## Explanation of execution
* g1 = Game.new
	
	Above command will create new instance of the game and in that it is creating 5 player objects, 1 deck and 1 dealer.
	Name of the players are like "player1, player2, player3 player4, player5"

* hand = g1.new_hand
	
This command will create new "hand" in the game. This new hand will have the games' players, dealer and deck. It will also 
create new "HandDealer" and "HandPlayer" objects  which specifies the current dealer and current players of the hand. Then dealer will distribute 2 cards each in round robin fashion.
We keep the card information of the player for each hand I have created a separate class "HandPlayerCard".

* player = hand.get_winner
	
get_winner method of hand will return the player object on random basis. 

* puts(player.name)
	
To print the name of the player.


* In addition to that I have created some methods : 

- Method to add/remove player in Game class.
- Method to change the dealer
- Method to calculate the score of each player in the hand
