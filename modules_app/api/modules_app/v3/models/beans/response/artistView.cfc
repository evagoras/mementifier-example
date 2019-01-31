component accessors=true alias="beans.response.artistView@v3" {

	property name="firstName";
	property name="lastName";
	property name="address";
	property name="city";
	property name="state";
	property name="postalCode";
	property name="email";
	property name="phone";
	property name="fax";
	property name="dateCreated";
	property name="active";

	function init() {
		return this;
	}

	string function getDate(){
		return getDateCreated() == "" ? "" : dateTimeFormat(now(), "yyyy-mm-dd HH:nn:ss");
	}

	this.memento = {
		// An array of the properties/relationships to include by default
		defaultIncludes = ["firstName","lastName","address","city","state","postalCode","email","phone","fax","active","date"],
		// An array of properties/relationships to exclude by default
		defaultExcludes = ["dateCreated"],
		// An array of properties/relationships to NEVER include
		neverInclude = [],
		// A struct of defaults for properties/relationships if they are null
		defaults = {},
		// A struct of mapping functions for properties/relationships that can transform them
		mappers = {
			"active" = function(item) {
				return isBoolean(item);
			}
		}
	}

}