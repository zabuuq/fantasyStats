/**
 ********************************************************************************
 * Copyright 2005-2007 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
 * www.ortussolutions.com
 ********************************************************************************
*/
component{
	// Application properties
	this.name = hash( getCurrentTemplatePath() );
	this.sessionManagement = true;
	this.sessionTimeout = createTimeSpan(0,0,30,0);
	this.setClientCookies = true;
	
	// Enable ORM
	this.ormEnabled 	  = true;
	// ORM Datasource
	this.datasource		  = "FFB";
	// ORM configuration settings
	this.ormSettings	  = {
		// Location of your entities, default is your convention model folder
		cfclocation = ["\models\entities"],
		// Log SQL or not
		logSQL 		= true,
		// Active ORM events
		eventHandling 	  =  true
	};

	// COLDBOX STATIC PROPERTY, DO NOT CHANGE UNLESS THIS IS NOT THE ROOT OF YOUR COLDBOX APP
	COLDBOX_APP_ROOT_PATH = getDirectoryFromPath( getCurrentTemplatePath() );
	// The web server mapping to this application. Used for remote purposes or static purposes
	COLDBOX_APP_MAPPING   = "";
	// COLDBOX PROPERTIES
	COLDBOX_CONFIG_FILE 	 = "";
	// COLDBOX APPLICATION KEY OVERRIDE
	COLDBOX_APP_KEY 		 = "";

	// application start
	public boolean function onApplicationStart(){
		application.cbBootstrap = new coldbox.system.Bootstrap( COLDBOX_CONFIG_FILE, COLDBOX_APP_ROOT_PATH, COLDBOX_APP_KEY, COLDBOX_APP_MAPPING );
		application.cbBootstrap.loadColdbox();
		return true;
	}

	// request start
	public boolean function onRequestStart(String targetPage){
		if(structKeyExists(URL, "doReset") && URL.doReset == 1){
			applicationStop();
			ormReload();
		}
		
		/**
		* To add extra <html><head> information to the page the ColdFusion tag <cfhtmlhead> can be used,
		* however there is no <cfhtmlfoot> tag for placing extra elements at the bottom of the page.
		* 
		* So, for storing, passing and displaying content at the end of the page REQUEST.htmlFootArray is
		* created in the onRequestStart() function in Application.cfc.
		* 
		* Usage:
		* <cfset arrayAppend(REQUEST.htmlFootArray, HTMLFOOTCONTENT) />
		* 
		* This will usually be used for passing calls to JavaScript file calls to the bottom of the page.
		* At the bottom of each layout, REQUEST.htmlFootArray will be looped through and its content placed
		* on the bottom of the page.
		* */
		REQUEST.htmlFootArray = [];

		// Process ColdBox Request
		application.cbBootstrap.onRequestStart( arguments.targetPage );

		return true;
	}

	public void function onSessionStart(){
		application.cbBootStrap.onSessionStart();
	}

	public void function onSessionEnd( struct sessionScope, struct appScope ){
		arguments.appScope.cbBootStrap.onSessionEnd( argumentCollection=arguments );
	}

	public boolean function onMissingTemplate( template ){
		return application.cbBootstrap.onMissingTemplate( argumentCollection=arguments );
	}

	public void function onError(required any error, required string name){
		try {
			writeOutput("<div>I'm sorry, an error occured with that request.  Please reload the page and try again.  If this problem persists, contact the system administrator.</div>");

			/**
			* @TODO
			* Add error reporting to an email?
			*/

			var logMsg = "#arguments.error.Message# /--||--/ #arguments.error.Detail#";
			for(tag in arguments.error.TagContext){
				logMsg = listAppend(logMsg, "(" & tag.line & ") " & tag.template, " ");
				logMsg = listAppend(logMsg, "/--||--/", " ");
			}
			writeLog(type="error", file="nijbta-error", log="Application", text=logMsg);

			var dumpError = false;

			// Check to see if access is from the server itself.
			if(cgi.remote_addr == "127.0.0.1"){
				dumpError = true;
			
			// Otherwise check for server environment.
			} 
			else if(structKeyExists(application, "cbcontroller")
				&& application.cbcontroller.settingExists("environment")
				&& listFindNoCase("local,dev", application.cbcontroller.getSetting("environment") ) > 0){
				dumpError = true;
			}

			// If allowed to dump the error, then do so.
			if(dumpError){
				writeDump(local);
				abort;
			}
		}
		catch(any e){
			writeOutput("<div>I'm sorry, an error occured with that request.  Please reload the page and try again.  If this problem persists, contact the system administrator.</div><div>Error Code: Secondary</div>");

			writeLog(text:"Error in onError() method. Message: " & e.message & " details: " & e.detail, file:"nijbta-error", type:"error" );

			if(cgi.remote_host == "127.0.0.1"){
				writeDump(e.message);
				writeDump(local);
				abort;
			}
		}
	}
}