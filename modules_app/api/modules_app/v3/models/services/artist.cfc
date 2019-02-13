component alias="services.artist@v3" {

	property name="artistDao" inject="daos.artist@v3";
	property name="validator" inject="ValidationManager@cbvalidation";
	property name="populator" inject="wirebox:populator";
	property name="wirebox" inject="wirebox";

	public any function init() {
		return this;
	}

	public any function getArtist(required numeric id) {
		var artistBean = wirebox.getInstance("beans.response.artistView@v3");
		var artistDetails = artistDao.getArtistDetails(id);
		if (artistDetails.len() == 1) {
			populator.populateFromStruct(target=artistBean, memento=artistDetails[1], ignoreEmpty=true);
			artistBean.setIsPopulated(true);
		}
		return artistBean;
	}

	public any function getArtists(required numeric offset, required numeric limit) {
		var results = {
			"data" = [],
			"totalcount" = 0
		};
		var artists = artistDao.getArtists(offset = arguments.offset, limit = arguments.limit);
		if (artists.recordcount > 0) {
			results.totalcount = artists.totalCount[1];
			for (var row = 1; row <= artists.recordCount; row++) {
				var artist = artists.getRow( row );
				var artistResponseBean = wirebox.getInstance( "beans.response.artistList@v3" );
				populator.populateFromStruct(target=artistResponseBean, memento=artist, ignoreEmpty=true);
				artistResponseBean.setIsPopulated(true);
				results.data.append( artistResponseBean.getMemento() );
			}
		}
		return results;
	}

}