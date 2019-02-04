component{

	// Configure ColdBox Application
	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "Your RESTFul app name here",
			eventName 				= "event",

			//Development Settings
			reinitPassword			= "",
			handlersIndexAutoReload = true,

			//Implicit Events
			defaultEvent			= "v3:echo.index",
			requestStartHandler		= "",
			requestEndHandler		= "",
			applicationStartHandler = "",
			applicationEndHandler	= "",
			sessionStartHandler 	= "",
			sessionEndHandler		= "",
			missingTemplateHandler	= "",

			//Extension Points
			applicationHelper 			= "",
			viewsHelper					= "",
			modulesExternalLocation		= [],
			viewsExternalLocation		= "",
			layoutsExternalLocation 	= "",
			handlersExternalLocation  	= "",
			requestContextDecorator 	= "",
			controllerDecorator			= "",

			//Error/Exception Handling
			invalidHTTPMethodHandler = "",
			exceptionHandler		= "",
			invalidEventHandler			= "",
			customErrorTemplate		= "",

			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false,
			viewCaching				= false
		};

		// custom settings
		settings = {
			"dsn" = {
				"gallery" = {
					"name" = "cfartgallery"
				}
			},
			"paging" = {
				"maxLimit" = 500,
				"maxDefault" = 10
			}
		};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			development = "localhost,127\.0\.0\.1"
		};

		// Module Directives
		modules = {
			// An array of modules names to load, empty means all of them
			include = [],
			// An array of modules names to NOT load, empty means none
			exclude = []
		};

		//LogBox DSL
		logBox = {
			// Define Appenders
			appenders = {
				coldboxTracer = { class="coldbox.system.logging.appenders.ConsoleAppender" }
			},
			// Root Logger
			root = { levelmax="INFO", appenders="*" },
			// Implicit Level Categories
			info = [ "coldbox.system" ]
		};

		//Layout Settings
		layoutSettings = {
			defaultLayout = "",
			defaultView   = ""
		};

		//Interceptor Settings
		interceptorSettings = {
			customInterceptionPoints = ""
		};

		//Register interceptors as an array, we need order
		interceptors = [
		];

		// module setting overrides
		moduleSettings = {
			mementifier = {
				// Turn on to use the ISO8601 date/time formatting on all processed date/time properites, else use the masks
				iso8601Format = false,
				// The default date mask to use for date properties
				dateMask      = "yyyy-mm-dd",
				// The default time mask to use for date properties
				timeMask      = "HH:mm:ss"
			},
			qb = {
				defaultGrammar = "MySQLGrammar",
				returnFormat = "array"
			}
		};

		validation = {
			// The third-party validation manager to use, by default it uses CBValidation.
			//manager = "class path",
			
			// You can store global constraint rules here with unique names
			sharedConstraints = {
				"pk" = {
					"id" = {
						type = "integer",
						min = 1,
						required = true
					}
				},
				"pagination" = {
					"offset" = {
						type = "integer",
						min = 0
					},
					"limit" = {
						type = "integer",
						min = 0
					}
				}
			}
		
		}
		
		/*
		// flash scope configuration
		flash = {
			scope = "session,client,cluster,ColdboxCache,or full path",
			properties = {}, // constructor properties for the flash scope implementation
			inflateToRC = true, // automatically inflate flash data into the RC scope
			inflateToPRC = false, // automatically inflate flash data into the PRC scope
			autoPurge = true, // automatically purge flash data for you
			autoSave = true // automatically save flash scopes at end of a request and on relocations.
		};

		//Register Layouts
		layouts = [
			{ name = "login",
		 	  file = "Layout.tester.cfm",
			  views = "vwLogin,test",
			  folders = "tags,pdf/single"
			}
		];

		//Conventions
		conventions = {
			handlersLocation = "handlers",
			viewsLocation 	 = "views",
			layoutsLocation  = "layouts",
			modelsLocation 	 = "models",
			eventAction 	 = "index"
		};

		*/

	}

	/**
	* Development environment
	*/
	function development(){
		coldbox.customErrorTemplate = "/coldbox/system/includes/BugReport.cfm";
	}

}