<cfset local.hideDebug = (structKeyExists(url, "hideDebug") ) ? url.hideDebug : false />
<cfset local.controller = (structKeyExists(arguments, "controller") ) ? arguments.controller : {} />
<cfset local.configSettings = local.controller.getConfigSettings() />
<cfset local.environment = (structKeyExists(local.configSettings, "environment") ) ? lCase(local.configSettings.environment) : "production" />

<html lang="en">
<head>
	<cfif local.hideDebug>
		<cfsetting showdebugoutput="false" />
	</cfif>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

	<title>Fantasy Football</title>
	<meta name="description" content="Fantasy Football">
	<meta name="author" content="Jason C McCoy (zabuuq)">

	<!---css --->
	<link href="/includes/css/bootstrap.css" rel="stylesheet">
	<link href="/includes/css/bootstrap-theme.css" rel="stylesheet">
	<link href="/includes/css/layout.css" rel="stylesheet">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
		<script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
		<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	<![endif]-->
</head>

<body data-spy="scroll">
	<!---Top NavBar --->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<!---Brand --->
			<div class="navbar-header">
				<!---Responsive Design --->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<!---Branding --->
				<cfoutput>
					<a class="navbar-brand" href="#event.buildLink('')#"><span class="glyphicon glyphicon-home"></span></a>
				</cfoutput>
			</div>
			<div class="collapse navbar-collapse">
				<div class="nav navbar-nav navbar-right">
					<cfoutput>
						<a class="navbar-brand" href="#event.buildLink('upload')#"><span class="glyphicon glyphicon-upload"></span></a>
					</cfoutput>
				</div>
			</div>
		</div> <!---end container --->
	</nav> <!---end navbar --->

	<div class="container main-body">
		<div class="alert alert-danger text-center">
			<p>I'm sorry, an error occured with that request.</p>
			<p>Please reload the page and try again.</p>
			<p>If this problem persists, contact the system administrator.</p>
		</div>

		<cfdump var="#arguments.exception#" label="Error Dump" />
	</div>

	<footer class="footer">
		Fantasy Football
	</footer>

	<!---js --->
	<script src="/includes/js/jquery-1.11.3.min.js"></script>
	<script src="/includes/js/bootstrap.min.js"></script>

	<cfloop array="#REQUEST.htmlFootArray#" index="hfa">
		<cfoutput>#hfa#</cfoutput>
	</cfloop>
</body>
</html>
