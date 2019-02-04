component extends="coldbox.system.Interceptor" alias="qbInterceptor@v3" {

	property name="interceptorService" inject="coldbox:interceptorService";

	function configure() {
		controller.getInterceptorService().registerInterceptor( interceptorObject=this );
	}

    function preQBExecute( event, interceptData={} ) {
		// dump(arguments.interceptData.sql);
		// dump(arguments.interceptData.bindings);
		// dump(arguments.interceptData.options);
		// abort;
    }

}