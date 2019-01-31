component accessors=true alias="beans.request.artistView@v3" {

	property name="id";

	this.constraints = {
		"id" = {
			type = "integer",
			min = 1,
			required = true
		}
	};

	function init() {
		return this;
	}

}