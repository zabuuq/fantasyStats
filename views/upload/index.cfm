<cfoutput>
<form action="#event.buildLink('upload.teamSchedule')#" method="post" enctype="multipart/form-data" class="form-horizontal">
	<div class="form-group">
		<label for="fileUpload" class="col-sm-3 control-label">Upload Team Schedule</label>
		<div class="col-sm-6">
			<input type="file" name="fileUpload" class="form-control" placeholder="Upload Team Schedule" />
		</div>
		<div class="col-sm-3">
			<input type="submit" value="Upload" class="btn btn-default" />
		</div>
	</div>
</form>
</cfoutput>

<cfoutput>
<form action="#event.buildLink('upload.fantasyStatsDst')#" method="post" enctype="multipart/form-data" class="form-horizontal">
	<div class="form-group">
		<label for="fileUpload" class="col-sm-3 control-label">Upload Fantasy Stats for DST</label>
		<div class="col-sm-6">
			<input type="file" name="fileUpload" class="form-control" placeholder="Upload Fantasy Stats for DST" />
		</div>
		<div class="col-sm-3">
			<input type="submit" value="Upload" class="btn btn-default" />
		</div>
	</div>
</form>
</cfoutput>

<cfoutput>
<form action="#event.buildLink('upload.fantasyStatsK')#" method="post" enctype="multipart/form-data" class="form-horizontal">
	<div class="form-group">
		<label for="fileUpload" class="col-sm-3 control-label">Upload Fantasy Stats for K</label>
		<div class="col-sm-6">
			<input type="file" name="fileUpload" class="form-control" placeholder="Upload Fantasy Stats for K" />
		</div>
		<div class="col-sm-3">
			<input type="submit" value="Upload" class="btn btn-default" />
		</div>
	</div>
</form>
</cfoutput>
