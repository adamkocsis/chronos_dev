#' Function to load in a specific variable

#' @param dir path to temporary directory.
#' @param verbose  Should feedback be output to the console?
#' @param attach Should the required package be attached before the item is loaded? 

assignInNamespace(
	"loadVar", 
	function(dir, verbose=FALSE, attach=FALSE){
		if(!requireNamespace("rgplates", quietly=TRUE)){
			stop("This item requires the rgplates package to run.")
		}
		if(attach){
			library(rgplates)
		}
	
		# read in the raster
		mod <- rgplates::platemodel(file.path(dir, "paleomap_model_v3-GPlates.mod"))
	
		return(mod)
	}, 
	ns="chronosphere")
