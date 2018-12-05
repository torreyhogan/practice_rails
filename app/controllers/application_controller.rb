class ApplicationController < ActionController::Base
	protect_from forgery with: :exception

	def hello
		render html: 'Hello, world'
	end
end
