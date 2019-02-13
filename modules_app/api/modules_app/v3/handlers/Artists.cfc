component extends="api.handlers.BaseHandler" {

	property name="artistService" inject="services.artist@v3";

	public any function show(event, rc, prc) {
		param rc.id=0;
		vResults = validateModel(target=rc, constraints="pk");
		if (vResults.hasErrors()) {
			prc.response.setStatusCode(400).setStatusText("Bad Request").setData(vResults.getAllErrorsAsStruct());
		} else {
			var artistBean = artistService.getArtist(rc.id);
			if (artistBean.getIsPopulated()) {
				prc.response.setFormat("text").setContentType("application/json").setData(artistBean.getMemento());
			} else {
				prc.response.setStatusCode(404).setStatusText("Not Found").setData("");
			}
		}
	}
	
	function index(event, rc, prc) {
		param rc.offset=0;
		param rc.limit=getSetting("paging").maxDefault;
		vResults = validateModel(target=rc, constraints="pagination");
		if (vResults.hasErrors()) {
			prc.response.setStatusCode(400).setStatusText("Bad Request").setData(vResults.getAllErrorsAsStruct());
		} else {
			var artists = artistService.getArtists(offset = rc.offset, limit = rc.limit);
			artists.data.len() > 0 ? prc.response.setData(artists.data) : prc.response.setData([]);
			prc.response.addHeader("x-total-recordcount", artists.totalcount);
		}
	}

	/*
	public any function put
	( event, rc, prc )
	{
		var requestBean = wirebox.getInstance( "beans.request.artistUpdate@v2" );
		var postedData = deserializeJson( getHTTPRequestData().content );
		rc.append( postedData );
		populateModel( requestBean );
		var vResults = validateModel( requestBean );
		if ( vResults.hasErrors() == true )
		{
			prc.response
				.setErrorCode( 400 )
				.setError( true )
				.setStatusCode( 400 )
				.setStatusText( "Bad Request" )
				.addMessage( vResults.getAllErrors() )
				.setData( vResults.getAllErrorsAsStruct() )
			;
		}
		else
		{
			var userDetails = artistDao.getArtistDetails( ID = rc.ID );
			if ( userDetails.recordcount == 1 )
			{
				var updated = artistDao.updateArtist( bean = requestBean );
				if ( updated )
				{
					var artistDetails = artistDao.getArtistDetails( ID = rc.ID );
					prc.response
						.setStatusCode( 201 )
						.setStatusText( "Updated" )
						.setData( queryGetRow(artistDetails, 1) )
					;
				}
			}
			else
			{
				prc.response
					.setStatusCode( 404 )
					.setStatusText( "Not Found" )
					.setError( true )
					.setErrorCode( 404 )
					.addHeader( "X-Resource-Not-Found", true );
				;
			}
		}
	}


	public any function remove
	( event, rc, prc )
	{
		var requestBean = wirebox.getInstance( "beans.request.artistView@v2" );
		// populate Bean from the arguments collection
		populateModel( requestBean );
		var vResults = validateModel( requestBean );
		if ( vResults.hasErrors() == true )
		{
			prc.response
				.setErrorCode( 400 )
				.setError( true )
				.setStatusCode( 400 )
				.setStatusText( "Bad Request" )
				.addMessage( vResults.getAllErrors() )
				.setData( vResults.getAllErrorsAsStruct() )
			;
		}
		else
		{
			var userDetails = artistDao.getArtistDetails( ID = rc.ID );
			if ( userDetails.recordcount == 1 )
			{
				var deleted = artistDao.removeArtist( artistID = rc.ID );
				if ( deleted )
				{
					prc.response
						.setStatusCode( 201 )
						.setStatusText( "Deleted" )
					;
				}
			}
			else
			{
				prc.response
					.setStatusCode( 404 )
					.setStatusText( "Not Found" )
					.setError( true )
					.setErrorCode( 404 )
					.addHeader( "X-Resource-Not-Found", true )
				;
			}
		}
	}
	*/

}