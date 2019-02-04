component alias="daos.artist@v3" {

	property name="query" inject="QueryBuilder@qb";

	function init() {
		return this;
	}

	public array function getArtistDetails(required numeric id) {
		return query.from("artists")
			.where("ARTISTID", "=", {value=id, cfsqltype="cf_sql_integer"})
			.get();
	}

	public query function getArtists(required numeric offset, required numeric limit) {
		// works
		// var qryCount = queryExecute("SELECT COUNT(*) AS 'aggregate' FROM artists");
		// does not work
		var qryCount = query.from('artists').count();
		var qry = queryExecute(
			'
				SELECT *, 0 as totalcount
				FROM artists
				order by "ARTISTID" DESC
				LIMIT :limit
				OFFSET :offset
			',
			{
				offset = {
					cfsqltype = "cf_sql_integer",
					value = arguments.offset
				},
				limit = {
					cfsqltype = "cf_sql_integer",
					value = arguments.limit
				}
			}
		);

		for (var row=1; row <= qry.recordcount; row++){
			querySetCell( qry, "totalcount", qryCount.aggregate, row );
		}
		return qry;
	}


	/*
	public any function updateArtist
	( required any bean )
	{
		var startingSQL = "UPDATE artists SET ";
		var sql = [];
		var params = {};
		var propertiesToUpdate = arguments.bean.serialize();
		// var propertiesToUpdate = arguments.bean.serialize().keyArray();
		for ( var property in propertiesToUpdate )
		{
			switch ( property )
			{
				case "firstName":
					if ( propertiesToUpdate.keyExists( property ) )
					{
						sql.append( "firstName = :firstName");
						params[ "firstName" ] = {
							"cfsqltype" = "cf_sql_varchar",
							"value" = utils.removeBeginningChar2( propertiesToUpdate[ property ] )
						};
					}
					else
					{
						sql.append( "firstName = NULL");
					}
				break;
				case "lastName":
					if ( propertiesToUpdate.keyExists( property ) )
					{
						sql.append( "lastName = :lastName");
						params[ "lastName" ] = {
							"cfsqltype" = "cf_sql_varchar",
							"value" = utils.removeBeginningChar2( propertiesToUpdate[ property ] )
						};
					}
					else
					{
						sql.append( "lastName = NULL");
					}
				break;
				case "address":
					sql.append( "address = :address");
					params[ "address" ] = {
						"cfsqltype" = "cf_sql_varchar",
						"value" = ""
					};
					if ( propertiesToUpdate.keyExists( property ) )
					{
						params.address[ "value" ] = utils.removeBeginningChar2( propertiesToUpdate[ property ] );
					}
					else
					{
						params.address[ "null" ] = true;
					}
				break;
				case "city":
					sql.append( "city = :city");
					params[ "city" ] = {
						"cfsqltype" = "cf_sql_varchar",
						"value" = ""
					};
					if ( propertiesToUpdate.keyExists( property ) )
					{
						params.city[ "value" ] = utils.removeBeginningChar2( propertiesToUpdate[ property ] );
					}
					else
					{
						params.city[ "null" ] = true;
					}
				break;
				case "state":
					sql.append( "state = :state");
					params[ "state" ] = {
						"cfsqltype" = "cf_sql_varchar",
						"value" = ""
					};
					if ( propertiesToUpdate.keyExists( property ) )
					{
						params.state[ "value" ] = utils.removeBeginningChar2( propertiesToUpdate[ property ] );
					}
					else
					{
						params.state[ "null" ] = true;
					}
				break;
				case "postalCode":
					sql.append( "postalCode = :postalCode");
					params[ "postalCode" ] = {
						"cfsqltype" = "cf_sql_varchar",
						"value" = ""
					};
					if ( propertiesToUpdate.keyExists( property ) )
					{
						params.postalCode[ "value" ] = utils.removeBeginningChar2( propertiesToUpdate[ property ] );
					}
					else
					{
						params.postalCode[ "null" ] = true;
					}
				break;
				case "email":
					sql.append( "email = :email");
					params[ "email" ] = {
						"cfsqltype" = "cf_sql_varchar",
						"value" = ""
					};
					if ( propertiesToUpdate.keyExists( property ) )
					{
						params.email[ "value" ] = utils.removeBeginningChar2( propertiesToUpdate[ property ] );
					}
					else
					{
						params.email[ "null" ] = true;
					}
				break;
				case "phone":
					sql.append( "phone = :phone");
					params[ "phone" ] = {
						"cfsqltype" = "cf_sql_varchar",
						"value" = ""
					};
					if ( propertiesToUpdate.keyExists( property ) )
					{
						params.phone[ "value" ] = utils.removeBeginningChar2( propertiesToUpdate[ property ] );
					}
					else
					{
						params.phone[ "null" ] = true;
					}
				break;
				case "fax":
					sql.append( "fax = :fax");
					params[ "fax" ] = {
						"cfsqltype" = "cf_sql_varchar",
						"value" = ""
					};
					if ( propertiesToUpdate.keyExists( property ) )
					{
						params.fax[ "value" ] = utils.removeBeginningChar2( propertiesToUpdate[ property ] );
					}
					else
					{
						params.fax[ "null" ] = true;
					}
				break;
				case "active":
					sql.append( "active = :active");
					params[ "active" ] = {
						"cfsqltype" = "cf_sql_varchar",
						"value" = ""
					};
					if ( propertiesToUpdate.keyExists( property ) )
					{
						params.active[ "value" ] = utils.removeBeginningChar2( propertiesToUpdate[ property ] );
					}
					else
					{
						params.active[ "null" ] = true;
					}
				break;
			}
		}
		var endingSQL = " WHERE ARTISTID = :artistID";
		params[ "artistID" ] = {
			"cfsqltype" = "cf_sql_integer",
			"value" = propertiesToUpdate[ "ID" ]
		};
		var sqlQuery = startingSQL & sql.toList( ", " ) & endingSQL;
		var qry = queryExecute
		(
			sqlQuery,
			params,
			{
				datasource = dsn.name,
				result = "qryResult"
			}
		);
		return qryResult.recordcount;
	}


	public boolean function removeArtist
	( required numeric artistID )
	{
		queryExecute
		(
			'
				DELETE FROM artists
				WHERE ARTISTID = :artistID
			',
			{
				artistID = {
					cfsqltype = "cf_sql_integer",
					value = arguments.artistID
				}
			},
			{
				datasource = dsn.name,
				result = "qryResults"
			}
		);
		return qryResults.recordcount;
	}


	
	*/




}