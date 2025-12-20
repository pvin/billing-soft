class UserCreationService

	def self.find_or_create_user email
		Customer.find_or_create_by!(email: email)
	end
	
end
