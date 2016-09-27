module UsersHelper
	def gravatar_for(user,options = { size: 30 })
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
   		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
   		image_tag(gravatar_url, alt: user.name, class: "gravatar")
	end

	def gravatar_for1(user)
		gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
   		gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
   		image_tag(gravatar_url, alt: user.name, class: "gravatar1")
	end
end
