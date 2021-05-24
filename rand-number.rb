require 'color_text'

@num_to_roll = 0
@sides = 0
@mod = 0

def user_pick_die
	print "Choose your dice. "
	print "1) d4, ".red + "2) d6, ".red + "3) d8, ".red + "4) d10, ".red + "5) d12, ".red + "6) d20, ".red + "7) d100 ".red
	print "Press q to quit. "
	user_input = gets.chomp
	if user_input == "q"
		exit
	elsif user_input == "1"
		@sides = 4
	elsif user_input == "2"
		@sides = 6
	elsif user_input == "3"
		@sides = 8
	elsif user_input == "4"
		@sides = 10
	elsif user_input == "5"
		@sides = 12
	elsif user_input == "6"
		@sides = 20
	elsif user_input == "7"
		@sides = 100
	else
		puts "You must choose 1 - 7 or q to quit."
		user_pick_die
	end
end

def add_mod
	print "Add your mod or enter 0. "
	get_mod = gets.chomp
	@mod = get_mod.to_i
end

def user_num_dice
	print "How many dice to roll? "
	num_dice = gets.chomp
	@num_to_roll = num_dice.to_i - 1
end

def roll_dice
	i = 0
	dice_array = []
	while i <= @num_to_roll.to_i 
		chosen_number = rand(1..@sides.to_i)
		dice_array.push(chosen_number)
		i += 1
	end
	puts "your number(s) was #{dice_array.join(", ").yellow} with mod of " + "#{@mod} ".yellow + "totaling " + "#{dice_array.sum + @mod.to_i}".green
end

while true
	user_pick_die
	add_mod
	user_num_dice
	roll_dice
end
