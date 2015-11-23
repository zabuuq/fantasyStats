<cfoutput>
	<form action="#event.buildLink(prc.processEvent)#" method="post" class="form-horizontal">
		<div class="form-group">
			<label for="infoImport" class="col-sm-11 control-label">#prc.formDisplay#</label>
			<div class="col-sm-1">
				<input type="hidden" value="#prc.uploader.getFilePath()#" name="filePath" />
				<input type="submit" value="Process" class="btn btn-default" />
			</div>
		</div>
	</form>
</cfoutput>

<cfif findNoCase("fantasyStats", event.getCurrentEvent() )>
	<cfinclude template="fantasyStats.cfm" />
</cfif>
