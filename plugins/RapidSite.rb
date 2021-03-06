##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "RapidSite" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-03-08
version "0.1"
description "RapidSite is the world's largest and most experienced Web hosting entity. - Homepage: http://www.rapidsite.net/"

# ShodanHQ results as at 2011-03-08 #
# 166,648 for Rapidsite/Apa
#
#	United States 101,473
#	Japan 55,903
#	Germany 7,032
#	Switzerland 1,138
#	Spain 1,100



# Passive #
def passive
	m=[]

	# HTTP Server Header
	if @headers["server"] =~ /^Rapidsite\/Apa\/([\d\.]+)/
		m << { :string=>"Apache/"+@headers["server"].scan(/Rapidsite\/Apa\/([\d\.]+)/).flatten }
	elsif @headers["server"] =~ /^Rapidsite\/Apa$/
		m << { :string=>"Apache" }
	end

	# Return passive matches
	m
end

end


