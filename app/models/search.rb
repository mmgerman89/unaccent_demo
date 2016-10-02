class Search
	def initialize(keywords)
		@keywords = keywords
	end

	def brands_by_name
		if @keywords.present?
		    brands = Brand.where(name_condition).order(:name)
	    else
		    brands = Brand.order(:name)
	    end
	    
	    return brands
	end

	private 

	def name_condition
		name_condition = "unaccent(lower(name)) LIKE '%#{I18n.transliterate(@keywords.downcase)}%'"
	end
end