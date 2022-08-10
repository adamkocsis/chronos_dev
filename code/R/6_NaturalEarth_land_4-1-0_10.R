#' @param na logical flag to trigger the removal of placeholder values - it also forces the dataset in the memory!

assignInNamespace(
	"loadVar", 
	function(dir, verbose=FALSE){
		shp <- rgdal::readOGR(file.path(dir, "ne_10m_land.shx"), verbose=verbose)
		return(shp)
	}, 
	ns="chronosphere")
