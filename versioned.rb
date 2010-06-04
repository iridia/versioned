#	versioned.rb
#	Evadne Wu at iridia Productions, 2010





#!/usr/bin/env ruby

revisionString = `/opt/local/bin/git log -1`

branchString = `/opt/local/bin/git branch`.match(/\*\s+(.+)/).to_s.gsub(/\*\s+/, "")
commitString = revisionString.match(/commit .+$/).to_s.gsub(/commit\s+/, "")
authorString = revisionString.match(/Author: .+$/).to_s.gsub(/Author:\s+/, "")
dateString = revisionString.match(/Date: .+$/).to_s.gsub(/Date:\s+/, "")

puts "Building from branch #{branchString} # #{commitString} committed by #{authorString}."
puts "Date: #{dateString}"





huntForIncidents = {

	"modified" => {

		"regex" => /^.+modified:/,
		"severity" => "warning",
		"message" => "This build contains modified files that were not committed.",
		"dumpfile" => true

	},

	"untracked" => {

		"regex" => /^.+untracked:/,
		"severity" => "warning",
		"message" => "This build contains modified files that were not tracked.  Ignore them, or add them to the repository!",
		"dumpfile" => true

	}

}





statusString = `/opt/local/bin/git status`

huntForIncidents. each { | incidentIndex, incidentObject |

	next if (!(statusString =~ incidentObject['regex']))

	puts "#{incidentObject['severity']}: #{incidentObject['message']}"

	next if (!incidentObject['dumpfile'])

	statusString.each { |line|

		if (!!(line =~ incidentObject['regex']))

			puts line.gsub(incidentObject['regex'], "")

		end

	}

}




