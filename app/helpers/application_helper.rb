module ApplicationHelper
		def intellinav
		links =''
		if @current_user
			links += "<li>#{ link_to('FEED', feed_path) }</li>"
			links += "<li>#{ link_to('ADD CONTENT', topics_path) }</li>"
			links += "<li>#{ link_to('ACCOUNT', user_path(@current_user.id) )}</li>"
			links += "<li>#{ link_to('LOG OUT ' + @current_user.first_name, login_path, :method => :delete, :confirm => 'Really log out?') }</li>"
		else
			links += "<li>#{ link_to('SIGN UP', new_user_path) }</li>"
			links += "<li>#{link_to('SIGN IN', login_path)}</li>"	
		end

		if @current_user && @current_user.admin
			links += "<li>#{link_to('SHOW SOURCES', sources_path)}</li>"
			links += "<li>#{link_to('SHOW USERS', users_path)}</li>"
		end
		links
	end
end
