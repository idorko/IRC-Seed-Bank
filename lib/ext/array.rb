class Array

	def sort_by_name
		self.sort! { |a,b| a.name.downcase <=> b.name.downcase }
	end

	def sort_by_variety
		self.sort! { |a,b| a.variety.downcase <=> b.variety.downcase }
	end

end
