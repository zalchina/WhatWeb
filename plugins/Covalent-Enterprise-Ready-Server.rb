##
# This file is part of WhatWeb and may be subject to
# redistribution and commercial restrictions. Please see the WhatWeb
# web site for more information on licensing and terms of use.
# http://www.morningstarsecurity.com/research/whatweb
##
Plugin.define "Covalent-Enterprise-Ready-Server" do
author "Brendan Coles <bcoles@gmail.com>" # 2011-05-12
version "0.1"
description "The Covalent Enterprise Ready Server is a stand-alone, manually-managed instance of an Apache 2.0 Web server with Covalent extensions. - Homepage: http://www.covalent.net/resource/documentation/ers/2.1.0/HTML/InstallGuide/installers.html"
# Product guide: http://www.covalent.net/resource/documentation/ers/2.4.0/ers-2.4.0-ProductGuide.pdf

# ShodanHQ results as at 2011-05-12 #
# 160 for CovalentSNMP
# 62 for secured_by_Covalent



# Passive #
def passive
	m=[]

	# Version Detection # HTTP Server Header
	m << { :version=>@headers["server"].scan(/secured_by_Covalent\/([^\s]+)/) } if @headers["server"] =~ /secured_by_Covalent\/([^\s]+)/

	# CovalentSNMP
	m << { :module=>@headers["server"].scan(/(CovalentSNMP\/[^\s]+)/) } if @headers["server"] =~ /CovalentSNMP\/[^\s]+/

	# Return passive matches
	m
end

end

