component{
/**
 * structures to create for configuration
 * 
 * - coldbox (struct)
 * - settings (struct)
 * - conventions (struct)
 * - environments (struct)
 * - wirebox (struct)
 * - ioc (struct)
 * - debugger (struct)
 * - mailSettings (struct)
 * - i18n (struct)
 * - datasources (struct)
 * - layoutSettings (struct)
 * - layouts (array of structs)
 * - cacheBox (struct)
 * - interceptorSettings (struct)
 * - interceptors (array of structs)
 * - modules (struct)
 * - logBox (struct)
 * - flash (struct)
 * - orm (struct)
 * 
 * Available objects in variable scope
 * - controller
 * - logBoxConfig
 * - appMapping (auto calculated by ColdBox)
 * 
 * Required Methods
 * - configure() : The method ColdBox calls to configure the application.
 * Optional Methods
 * - detectEnvironment() : If declared the framework will call it and it must return the name of the environment you are on.
 * - {environment}() : The name of the environment found and called by the framework.
*/

	// Configure ColdBox Application
	function configure(){

		// coldbox directives
		coldbox = {
			//Application Setup
			appName 				= "Your app name here",

			//Development Settings
			reinitPassword			= "",
			handlersIndexAutoReload = true,

			//Implicit Events
			defaultEvent			= "",
			requestStartHandler		= "",
			requestEndHandler		= "",
			applicationStartHandler = "",
			applicationEndHandler	= "",
			sessionStartHandler 	= "",
			sessionEndHandler		= "",
			missingTemplateHandler	= "",

			// Error/Exception Handling
			exceptionHandler		= "",
			onInvalidEvent			= "",
			customErrorTemplate		= "/layouts/Layout.Error.cfm",

			//Application Aspects
			handlerCaching 			= false,
			eventCaching			= false
		};

		// environment settings, create a detectEnvironment() method to detect it yourself.
		// create a function with the name of the environment so it can be executed if that environment is detected
		// the value of the environment is a list of regex patterns to match the cgi.http_host.
		environments = {
			development = "localhost"
		};

		// Module Directives
		modules = {
			//Turn to false in production
			autoReload = false,
			// An array of modules names to load, empty means all of them
			include = [],
			// An array of modules names to NOT load, empty means none
			exclude = []
		};

		// Register interceptors as an array, we need order
		interceptors = [
			//SES
			{class="coldbox.system.interceptors.SES",
			 properties={}
			}
		];

		/*
		//Register Layouts
		layouts = [
			{ name = "login",
		 	  file = "Layout.tester.cfm",
			  views = "vwLogin,test",
			  folders = "tags,pdf/single"
			}
		];
		*/

		//Conventions
		conventions = {
			handlersLocation = "handlers",
			viewsLocation 	 = "views",
			layoutsLocation  = "layouts",
			modelsLocation 	 = "models",
			eventAction 	 = "index"
		};

		// ORM services, injection, etc
		orm = {
			// entity injection
			injection = {
				// enable it
				enabled = true,
				// the include list for injection
				include = "",
				// the exclude list for injection
				exclude = ""
			}
		};

	}

	/**
	* Development environment
	*/
	function development(){
		coldbox.customErrorTemplate = "/coldbox/system/includes/BugReport.cfm";
	}

}