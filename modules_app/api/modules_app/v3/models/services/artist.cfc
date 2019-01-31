component alias="services.artist@v3" {

	// DAOs
	property name="artistDao" inject="daos.artist@v3";
	// Framework Services
	property name="validator" inject="ValidationManager@cbvalidation";
	property name="populator" inject="wirebox:populator";
	property name="wirebox" inject="wirebox";

	public any function init() {
		return this;
	}

	/**
	 * @hint Returns the order details of a Single Resource
	 * @ID The user ID
	 */
	public any function getArtist(required any bean) {
		var responseViewBean = wirebox.getInstance("beans.response.artistView@v3");
		// Order Details Response Bean
		var artistDetails = artistDao.getArtistDetails(bean.getId());
		// If a record for order details is found
		if ( artistDetails.len() == 1 )
		{
			// dump(populator);abort;
			populator.populateFromStruct(target=responseViewBean, memento=artistDetails[1], ignoreEmpty=true);
			responseViewBean.setIsPopulated(true);
			// populate the response Bean
			// responseViewBean.populate( memento = artistDetails );
		}
		return responseViewBean;
	}

	/*
	public any function getArtists
	(
		required numeric offset,
		required numeric limit
	)
	{
		var results = {
			"data" = [],
			"totalcount" =	 0
		};
		var artists = artistDao.getArtists
		(
			offset = arguments.offset,
			limit = arguments.limit
		);
		if ( artists.recordCount > 0 )
		{
			results.totalcount = artists.totalCount[ 1 ];
			for
			(
				var row = 1;
				row <= artists.recordCount;
				row++
			)
			{
				var order = artists.getRow( row );
				var artistResponseBean = wirebox.getInstance( "beans.response.artistList@v2" );
				artistResponseBean.populate( order );
				results.data.append( artistResponseBean );
			}
		}
		return results;
	}
	*/

}