#' Function to load in a specific variable
#' @param dir path to archive directory
#' @param verbose  Should feedback be output to the console?
#' 
assignInNamespace("loadVar", 
	function(dir, verbose=FALSE){
        if(! requireNamespace("ncdf4", quietly=TRUE)) stop("This dataset requires the 'ncdf4' package to load.")
	
		# read all files in temporary directory - it is more robust to do it explicitly than tinkering 
		all<- c(
			"paleomap_dem_20190719_1_0.nc",
			"paleomap_dem_20190719_1_5.nc",
			"paleomap_dem_20190719_1_10.nc",
			"paleomap_dem_20190719_1_15.nc",
			"paleomap_dem_20190719_1_20.nc",
			"paleomap_dem_20190719_1_25.nc",
			"paleomap_dem_20190719_1_30.nc",
			"paleomap_dem_20190719_1_35.nc",
			"paleomap_dem_20190719_1_40.nc",
			"paleomap_dem_20190719_1_45.nc",
			"paleomap_dem_20190719_1_50.nc",
			"paleomap_dem_20190719_1_55.nc",
			"paleomap_dem_20190719_1_60.nc",
			"paleomap_dem_20190719_1_65.nc",
			"paleomap_dem_20190719_1_70.nc",
			"paleomap_dem_20190719_1_75.nc",
			"paleomap_dem_20190719_1_80.nc",
			"paleomap_dem_20190719_1_85.nc",
			"paleomap_dem_20190719_1_90.nc",
			"paleomap_dem_20190719_1_95.nc",
			"paleomap_dem_20190719_1_100.nc",
			"paleomap_dem_20190719_1_105.nc",
			"paleomap_dem_20190719_1_110.nc",
			"paleomap_dem_20190719_1_115.nc",
			"paleomap_dem_20190719_1_120.nc",
			"paleomap_dem_20190719_1_125.nc",
			"paleomap_dem_20190719_1_130.nc",
			"paleomap_dem_20190719_1_135.nc",
			"paleomap_dem_20190719_1_140.nc",
			"paleomap_dem_20190719_1_145.nc",
			"paleomap_dem_20190719_1_150.nc",
			"paleomap_dem_20190719_1_155.nc",
			"paleomap_dem_20190719_1_160.nc",
			"paleomap_dem_20190719_1_165.nc",
			"paleomap_dem_20190719_1_170.nc",
			"paleomap_dem_20190719_1_175.nc",
			"paleomap_dem_20190719_1_180.nc",
			"paleomap_dem_20190719_1_185.nc",
			"paleomap_dem_20190719_1_190.nc",
			"paleomap_dem_20190719_1_195.nc",
			"paleomap_dem_20190719_1_200.nc",
			"paleomap_dem_20190719_1_205.nc",
			"paleomap_dem_20190719_1_210.nc",
			"paleomap_dem_20190719_1_215.nc",
			"paleomap_dem_20190719_1_220.nc",
			"paleomap_dem_20190719_1_225.nc",
			"paleomap_dem_20190719_1_230.nc",
			"paleomap_dem_20190719_1_235.nc",
			"paleomap_dem_20190719_1_240.nc",
			"paleomap_dem_20190719_1_245.nc",
			"paleomap_dem_20190719_1_250.nc",
			"paleomap_dem_20190719_1_255.nc",
			"paleomap_dem_20190719_1_260.nc",
			"paleomap_dem_20190719_1_265.nc",
			"paleomap_dem_20190719_1_270.nc",
			"paleomap_dem_20190719_1_275.nc",
			"paleomap_dem_20190719_1_280.nc",
			"paleomap_dem_20190719_1_285.nc",
			"paleomap_dem_20190719_1_290.nc",
			"paleomap_dem_20190719_1_295.nc",
			"paleomap_dem_20190719_1_300.nc",
			"paleomap_dem_20190719_1_305.nc",
			"paleomap_dem_20190719_1_310.nc",
			"paleomap_dem_20190719_1_315.nc",
			"paleomap_dem_20190719_1_320.nc",
			"paleomap_dem_20190719_1_325.nc",
			"paleomap_dem_20190719_1_330.nc",
			"paleomap_dem_20190719_1_335.nc",
			"paleomap_dem_20190719_1_340.nc",
			"paleomap_dem_20190719_1_345.nc",
			"paleomap_dem_20190719_1_350.nc",
			"paleomap_dem_20190719_1_355.nc",
			"paleomap_dem_20190719_1_360.nc",
			"paleomap_dem_20190719_1_365.nc",
			"paleomap_dem_20190719_1_370.nc",
			"paleomap_dem_20190719_1_375.nc",
			"paleomap_dem_20190719_1_380.nc",
			"paleomap_dem_20190719_1_385.nc",
			"paleomap_dem_20190719_1_390.nc",
			"paleomap_dem_20190719_1_395.nc",
			"paleomap_dem_20190719_1_400.nc",
			"paleomap_dem_20190719_1_405.nc",
			"paleomap_dem_20190719_1_410.nc",
			"paleomap_dem_20190719_1_415.nc",
			"paleomap_dem_20190719_1_420.nc",
			"paleomap_dem_20190719_1_425.nc",
			"paleomap_dem_20190719_1_430.nc",
			"paleomap_dem_20190719_1_435.nc",
			"paleomap_dem_20190719_1_440.nc",
			"paleomap_dem_20190719_1_445.nc",
			"paleomap_dem_20190719_1_450.nc",
			"paleomap_dem_20190719_1_455.nc",
			"paleomap_dem_20190719_1_460.nc",
			"paleomap_dem_20190719_1_465.nc",
			"paleomap_dem_20190719_1_470.nc",
			"paleomap_dem_20190719_1_475.nc",
			"paleomap_dem_20190719_1_480.nc",
			"paleomap_dem_20190719_1_485.nc",
			"paleomap_dem_20190719_1_490.nc",
			"paleomap_dem_20190719_1_495.nc",
			"paleomap_dem_20190719_1_500.nc",
			"paleomap_dem_20190719_1_505.nc",
			"paleomap_dem_20190719_1_510.nc",
			"paleomap_dem_20190719_1_515.nc",
			"paleomap_dem_20190719_1_520.nc",
			"paleomap_dem_20190719_1_525.nc",
			"paleomap_dem_20190719_1_530.nc",
			"paleomap_dem_20190719_1_535.nc",
			"paleomap_dem_20190719_1_540.nc"
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
