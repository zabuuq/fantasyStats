﻿/**
*********************************************************************************
* Copyright Since 2005 ColdBox Framework by Luis Majano and Ortus Solutions, Corp
* www.coldbox.org | www.luismajano.com | www.ortussolutions.com
********************************************************************************
* ColdBox Main Configuration Defaults
*/
component{

	// Release Metadata
	this.codename 		= "ColdBox SEEK";
	this.author			= "Ortus Solutions";
	this.authorEmail 	= "coldbox@ortussolutions.com";
	this.authorWebsite	= "http://www.ortussolutions.com";
	this.suffix			= "Gideon";
	this.version		= "4.1.0+00002";
	this.description	= "This is the ColdBox Platform for ColdFusion Powered Web Applications.";

	// Operation Defaults
	this.eventName 		= "event";
	this.defaultEvent 	= "main.index";
	this.defaultLayout 	= "Layout.Main.cfm";

	// flash scope defaults
	this.flash = {
		scope = "session",
		properties = {},
		inflateToRC = true,
		inflateToPRC = false,
		autoPurge = true,
		autoSave = true
	};

    // Conventions
    this.handlersConvention	= "handlers";
	this.layoutsConvention	= "layouts";
	this.viewsConvention	= "views";
	this.eventAction		= "index";
	this.modelsConvention	= "models";
	this.configConvention	= "config.Coldbox";
	this.modulesConvention	= "modules";

}