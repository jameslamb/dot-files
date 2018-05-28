
# [description] Populate PATH without creating a super-long string
#               or cluttering the terminal env with a bunch of
#               superfluous variables
# [usage] copy this whole things into your `~/.bash_profile`
build_path() {
	
	local SUBLIME="/Applications/Sublime Text.app/Contents/SharedSupport/bin"
	local MINICONDA="/Users/${USER}/miniconda3/bin"
	
	# Putting this on the path "because of reasons". RStudio bundles a pandoc
	# version with its distribution and some R packages only work if you
	# find RStudio's version. Ugh.
	local RSTUDIO_PANDOC="/Applications/Rstudio.app/Contents/MacOS/pandoc"

	# Create the final path
	export PATH="${SUBLIME}:${MINICONDA}:$PATH"
}
build_path
