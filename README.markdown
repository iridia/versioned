#	`versioned.rb`
##	Git information in your Xcode build log




###	Using `versioned.rb`

*	Make this project a Git submodule of your Xcode project.

*	Go to your Target in Xcode, and add a Run Script build phase.

*	Use this line, and make sure the path is relative to your project root:

		ruby ${PROJECT_DIR}/../Externals/versioned/versioned.rb





###	Credits

Evadne Wu at Iridia Productions, 2010.  `ev@iridia.tw`.