$win_pos = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
p1_pos = []
p2_pos = []

def display_grid_numbers(x1 = 1, x2 = 2, x3 = 3, x4 = 4, x5 =5, x6 = 6, x7 = 7, x8 = 8, x9 = 9)
	puts " _____ _____ _____"
	puts "|" + "     " + "|" + "     " + "|" + "     " + "|"
	puts "|" + "  #{x1}  " + "|" + "  #{x2}  " + "|" + "  #{x3}  " + "|"
	puts "|" + "_____" + "|" + "_____" + "|" + "_____" + "|"
	
	puts "|" + "     " + "|" + "     " + "|" + "     " + "|"
	puts "|" + "  #{x4}  " + "|" + "  #{x5}  " + "|" + "  #{x6}  " + "|"
	puts "|" + "_____" + "|" + "_____" + "|" + "_____" + "|"
	
	puts "|" + "     " + "|" + "     " + "|" + "     " + "|"
	puts "|" + "  #{x7}  " + "|" + "  #{x8}  " + "|" + "  #{x9}  " + "|"
	puts "|" + "_____" + "|" + "_____" + "|" + "_____" + "|"
	
end

def win_pos?(p_pos3)
	$win_pos.each do |i|
		if i == p_pos3.sort
			return true
		end
	end
	return false
end

def winning_position(p_pos)
	if p_pos.length < 3
		return false
	end
	for i in 0...p_pos.length-2
		for j in i+1...p_pos.length-1
			for k in j+1...p_pos.length
				if win_pos?([p_pos[i],p_pos[j],p_pos[k]])
					return true
				end
			end
		end
	end
	return false
end

def set_grid(p1_pos, p2_pos, p1_token, p2_token)
	if not p1_pos.select { |i| i == 1}.empty?
		x1 = p1_token
	elsif not p2_pos.select { |i| i == 1}.empty?
		x1 = p2_token
	else
		x1 = 1
	end

	if not p1_pos.select { |i| i == 2}.empty?
		x2 = p1_token
	elsif not p2_pos.select { |i| i == 2}.empty?
		x2 = p2_token
	else
		x2 = 2
	end

	if not p1_pos.select { |i| i == 3}.empty?
		x3 = p1_token
	elsif not p2_pos.select { |i| i == 3}.empty?
		x3 = p2_token
	else
		x3 = 3
	end

	if not p1_pos.select { |i| i == 4}.empty?
		x4 = p1_token
	elsif not p2_pos.select { |i| i == 4}.empty?
		x4 = p2_token
	else
		x4 = 4
	end

	if not p1_pos.select { |i| i == 5}.empty?
		x5 = p1_token
	elsif not p2_pos.select { |i| i == 5}.empty?
		x5 = p2_token
	else
		x5 = 5
	end

	if not p1_pos.select { |i| i == 6}.empty?
		x6 = p1_token
	elsif not p2_pos.select { |i| i == 6}.empty?
		x6 = p2_token
	else
		x6 = 6
	end

	if not p1_pos.select { |i| i == 7}.empty?
		x7 = p1_token
	elsif not p2_pos.select { |i| i == 7}.empty?
		x7 = p2_token
	else
		x7 = 7
	end

	if not p1_pos.select { |i| i == 8}.empty?
		x8 = p1_token
	elsif not p2_pos.select { |i| i == 8}.empty?
		x8 = p2_token
	else
		x8 = 8
	end

	if not p1_pos.select { |i| i == 9}.empty?
		x9 = p1_token
	elsif not p2_pos.select { |i| i == 9}.empty?
		x9 = p2_token
	else
		x9 = 9
	end	

	display_grid_numbers(x1,x2,x3,x4,x5,x6,x7,x8,x9)
end

if rand(2) == 1
	p1_token = "X"
	p2_token = "O"
else
	p1_token = "O"
	p2_token = "X"
end

puts "The Game of Tic-Tac-Toe"
puts "Player 1 is '#{p1_token}'. Player 2 is '#{p2_token}'.\n"
set_grid(p1_pos, p2_pos, p1_token, p2_token)
puts "\n"

player_turn = 1
i = 1
while not (winning_position(p1_pos) || winning_position(p2_pos))
	puts "Player #{player_turn} choose a position: "
	play = gets.chomp
	play = play.to_i
	if play < 1 || play > 9
		puts "Enter a number between 1 and 9"
		next
	end
	if not p1_pos.select { |p| p == play}.empty?
		puts "Player 1 has already played there."
		next
	end
	if not p2_pos.select { |p| p == play}.empty?
		puts "Player 2 has already played there."
		next
	end
	if player_turn == 1
		p1_pos.push(play)
		player_turn = 2
	else
		p2_pos.push(play)
		player_turn = 1
	end
	set_grid(p1_pos, p2_pos, p1_token, p2_token)
	i += 1
	if i == 9
		puts "Game Draw"
		break;
	end
end

if winning_position(p1_pos)
	puts "Game Over. Player 1 wins"
end
if winning_position(p2_pos)
	puts "Game Over. Player 2 wins"
end