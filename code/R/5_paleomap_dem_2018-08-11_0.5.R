#' Function to load in a specific variable
#' @param dir path to archive directory
#' @param verbose  Should feedback be output to the console?
#' 
assignInNamespace("loadVar", 
	function(dir, verbose=FALSE){
        if(! requireNamespace("ncdf4", quietly=TRUE)) stop("This dataset requires the 'ncdf4' package to load.")
	
		# read all files in temporary directory - it is more robust to do it explicitly than tinkering 
		all<- c(
			"paleomap_dem_20190719_0.5_0.nc",
			"paleomap_dem_20190719_0.5_5.nc",
			"paleomap_dem_20190719_0.5_10.nc",
			"paleomap_dem_20190719_0.5_15.nc",
			"paleomap_dem_20190719_0.5_20.nc",
			"paleomap_dem_20190719_0.5_25.nc",
			"paleomap_dem_20190719_0.5_30.nc",
			"paleomap_dem_20190719_0.5_35.nc",
			"paleomap_dem_20190719_0.5_40.nc",
			"paleomap_dem_20190719_0.5_45.nc",
			"paleomap_dem_20190719_0.5_50.nc",
			"paleomap_dem_20190719_0.5_55.nc",
			"paleomap_dem_20190719_0.5_60.nc",
			"paleomap_dem_20190719_0.5_65.nc",
			"paleomap_dem_20190719_0.5_70.nc",
			"paleomap_dem_20190719_0.5_75.nc",
			"paleomap_dem_20190719_0.5_80.nc",
			"paleomap_dem_20190719_0.5_85.nc",
			"paleomap_dem_20190719_0.5_90.nc",
			"paleomap_dem_20190719_0.5_95.nc",
			"paleomap_dem_20190719_0.5_100.nc",
			"paleomap_dem_20190719_0.5_105.nc",
			"paleomap_dem_20190719_0.5_110.nc",
			"paleomap_dem_20190719_0.5_115.nc",
			"paleomap_dem_20190719_0.5_120.nc",
			"paleomap_dem_20190719_0.5_125.nc",
			"paleomap_dem_20190719_0.5_130.nc",
			"paleomap_dem_20190719_0.5_135.nc",
			"paleomap_dem_20190719_0.5_140.nc",
			"paleomap_dem_20190719_0.5_145.nc",
			"paleomap_dem_20190719_0.5_150.nc",
			"paleomap_dem_20190719_0.5_155.nc",
			"paleomap_dem_20190719_0.5_160.nc",
			"paleomap_dem_20190719_0.5_165.nc",
			"paleomap_dem_20190719_0.5_170.nc",
			"paleomap_dem_20190719_0.5_175.nc",
			"paleomap_dem_20190719_0.5_180.nc",
			"paleomap_dem_20190719_0.5_185.nc",
			"paleomap_dem_20190719_0.5_190.nc",
			"paleomap_dem_20190719_0.5_195.nc",
			"paleomap_dem_20190719_0.5_200.nc",
			"paleomap_dem_20190719_0.5_205.nc",
			"paleomap_dem_20190719_0.5_210.nc",
			"paleomap_dem_20190719_0.5_215.nc",
			"paleomap_dem_20190719_0.5_220.nc",
			"paleomap_dem_20190719_0.5_225.nc",
			"paleomap_dem_20190719_0.5_230.nc",
			"paleomap_dem_20190719_0.5_235.nc",
			"paleomap_dem_20190719_0.5_240.nc",
			"paleomap_dem_20190719_0.5_245.nc",
			"paleomap_dem_20190719_0.5_250.nc",
			"paleomap_dem_20190719_0.5_255.nc",
			"paleomap_dem_20190719_0.5_260.nc",
			"paleomap_dem_20190719_0.5_265.nc",
			"paleomap_dem_20190719_0.5_270.nc",
			"paleomap_dem_20190719_0.5_275.nc",
			"paleomap_dem_20190719_0.5_280.nc",
			"paleomap_dem_20190719_0.5_285.nc",
			"paleomap_dem_20190719_0.5_290.nc",
			"paleomap_dem_20190719_0.5_295.nc",
			"paleomap_dem_20190719_0.5_300.nc",
			"paleomap_dem_20190719_0.5_305.nc",
			"paleomap_dem_20190719_0.5_310.nc",
			"paleomap_dem_20190719_0.5_315.nc",
			"paleomap_dem_20190719_0.5_320.nc",
			"paleomap_dem_20190719_0.5_325.nc",
			"paleomap_dem_20190719_0.5_330.nc",
			"paleomap_dem_20190719_0.5_335.nc",
			"paleomap_dem_20190719_0.5_340.nc",
			"paleomap_dem_20190719_0.5_345.nc",
			"paleomap_dem_20190719_0.5_350.nc",
			"paleomap_dem_20190719_0.5_355.nc",
			"paleomap_dem_20190719_0.5_360.nc",
			"paleomap_dem_20190719_0.5_365.nc",
			"paleomap_dem_20190719_0.5_370.nc",
			"paleomap_dem_20190719_0.5_375.nc",
			"paleomap_dem_20190719_0.5_380.nc",
			"paleomap_dem_20190719_0.5_385.nc",
			"paleomap_dem_20190719_0.5_390.nc",
			"paleomap_dem_20190719_0.5_395.nc",
			"paleomap_dem_20190719_0.5_400.nc",
			"paleomap_dem_20190719_0.5_405.nc",
			"paleomap_dem_20190719_0.5_410.nc",
			"paleomap_dem_20190719_0.5_415.nc",
			"paleomap_dem_20190719_0.5_420.nc",
			"paleomap_dem_20190719_0.5_425.nc",
			"paleomap_dem_20190719_0.5_430.nc",
			"paleomap_dem_20190719_0.5_435.nc",
			"paleomap_dem_20190719_0.5_440.nc",
			"paleomap_dem_20190719_0.5_445.nc",
			"paleomap_dem_20190719_0.5_450.nc",
			"paleomap_dem_20190719_0.5_455.nc",
			"paleomap_dem_20190719_0.5_460.nc",
			"paleomap_dem_20190719_0.5_465.nc",
			"paleomap_dem_20190719_0.5_470.nc",
			"paleomap_dem_20190719_0.5_475.nc",
			"paleomap_dem_20190719_0.5_480.nc",
			"paleomap_dem_20190719_0.5_485.nc",
			"paleomap_dem_20190719_0.5_490.nc",
			"paleomap_dem_20190719_0.5_495.nc",
			"paleomap_dem_20190719_0.5_500.nc",
			"paleomap_dem_20190719_0.5_505.nc",
			"paleomap_dem_20190719_0.5_510.nc",
			"paleomap_dem_20190719_0.5_515.nc",
			"paleomap_dem_20190719_0.5_520.nc",
			"paleomap_dem_20190719_0.5_525.nc",
			"paleomap_dem_20190719_0.5_530.nc",
			"paleomap_dem_20190719_0.5_535.nc",
			"paleomap_dem_20190719_0.5_540.nc"
		)
		
		# for the names of the files
		ageExt <- unlist(lapply(strsplit(all, "_"), function(x) x[5]))
		ageNum <- as.numeric(unlist(lapply(strsplit(ageExt, "\\."), function(x) x[1])))

		# resolution names have to be here, otherwise they will be overwritten here and the links to the 
		# to make a stack in memory, make a list first
		listForm <- list()

		# netCDF files (raster data - two dimensions)
		for(i in 1:length(all)){
			listForm[[i]]<-raster::raster(file.path(dir, all[i]))
			listForm[[i]]@data@names <- paste("dem", ageNum[i], sep="_")
		}

		# make a RasterArray
		ind <- 1:length(all)
		names(ind) <-  as.character(ageNum)
	
		# RasterArray
		RasterArray(stack=raster::stack(listForm), index=ind)

	}, ns="chronosphere"
)
