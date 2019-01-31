component accessors=true alias="User@v2" {

	property name="id";
	property name="title";
	property name="json";

	function init() {
		return this;
	}

	this.memento = {
		// An array of the properties/relationships to include by default
		defaultIncludes = ["id","title","json"],
		// An array of properties/relationships to exclude by default
		defaultExcludes = [],
		// An array of properties/relationships to NEVER include
		neverInclude = [],
		// A struct of defaults for properties/relationships if they are null
		defaults = {},
		// A struct of mapping functions for properties/relationships that can transform them
		mappers = {
			"json" = function() {
				return deserializeJson(getJson());
			}
		}
	}

}