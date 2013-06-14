module ApplicationHelper

	def nav_active_link_helper(link_name, path, options = nil )
		html = ''
		# args[:controller] = controller
		# args[:action] = action
		# 
		if options && current_page?(options)
			html += "<li class='active'>"
		else
			html += "<li>"
		end
		html += link_to(link_name, path)
		html.html_safe
	end
end
