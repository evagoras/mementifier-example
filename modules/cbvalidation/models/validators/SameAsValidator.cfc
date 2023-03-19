/**
********************************************************************************
Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
This validator validates if a field is the same as another field with case sensitivity
*/
component accessors="true" implements="cbvalidation.models.validators.IValidator" singleton{

	property name="name";

	SameAsValidator function init(){
		name = "SameAs";
		return this;
	}

	/**
	* Will check if an incoming value validates
	* @validationResultThe result object of the validation
	* @targetThe target object to validate on
	* @fieldThe field on the target object to validate on
	* @targetValueThe target value to validate
	* @validationDataThe validation data the validator was created with
	*/
	boolean function validate(required cbvalidation.models.result.IValidationResult validationResult, required any target, required string field, any targetValue, any validationData){

		// get secondary value from property
		var compareValue = evaluate("arguments.target.get#arguments.validationData#()");

		if( !isNull(arguments.targetValue) AND compare(arguments.targetValue, compareValue) EQ 0 ){
			return true;
		}
		var args = {
			message        = "The '#arguments.field#' value is not the same as #compareValue.toString()#",
			field          = arguments.field,
			validationType = getName(),
			rejectedValue  = ( isSimpleValue( arguments.targetValue ) ? arguments.targetValue : '' ),
			validationData = arguments.validationData
		};
		var error = validationResult.newError(argumentCollection=args).setErrorMetadata({sameas=arguments.validationData});
		validationResult.addError( error );
		return false;
	}

	/**
	* Get the name of the validator
	*/
	string function getName(){
		return name;
	}

}