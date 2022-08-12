#' Function to load in a specific variable

#' @param dir path to temporary directory.
#' @param verbose  Should feedback be output to the console?

assignInNamespace(
	"loadVar", 
	function(dir, verbose=FALSE, attach=FALSE){
		# read in the raster
		pared <- readRDS(file.path(dir, "pbdb_occs.rds"))

		return(pared)
	}, 
	ns="chronosphere")
