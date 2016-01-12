class Player
	def update_score(next_move)
		case next_move
		when 1
			self.score[0] += 1
			self.score[3] += 1
			self.score[6] += 1
		when 2
			self.score[0] += 1
			self.score[4] += 1
		when 3
			self.score[0] += 1
			self.score[5] += 1
			self.score[7] += 1
		when 4
			self.score[1] += 1
			self.score[3] += 1
		when 5
			self.score[1] += 1
			self.score[4] += 1
			self.score[6] += 1
			self.score[7] += 1
		when 6
			self.score[1] += 1
			self.score[5] += 1
		when 7
			self.score[2] += 1
			self.score[3] += 1
			self.score[7] += 1
		when 8
			self.score[2] += 1
			self.score[4] += 1
		when 9
			self.score[2] += 1
			self.score[5] += 1
			self.score[6] += 1
		end
	end
end