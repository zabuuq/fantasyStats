<!--- 
	Save content to be placed in the <head> of the layout file.
	<cfhtmlhead> automatically adds the saved content to the <head>.
--->
<cfsavecontent variable="htmlHeadContent">
	<link rel="stylesheet" type="text/css" href="/includes/css/jquery.dataTables.css" />
</cfsavecontent>

<cfhtmlhead text="#htmlHeadContent#" />

<table id="contentTable" class="table table-striped">
	<thead>
		<tr>
			<th title="Season Year">Year</th>
			<th title="Week Number">Week</th>
			<th title="Day of Week">Day</th>
			<th title="Game Date">Date</th>
			<th title="Kick-off Time">Time</th>
			<th title="Visiting Team">Visitor</th>
			<th title="Home Team">@Home</th>
		</tr>
	</thead>

	<tbody>
		<cfloop array="#prc.fileOutput#" index="fo">
			<cfset trClass=(fo.getTeamScheduleId() NEQ "") ? "class='warning text-warning'" : "" />
			<cfoutput>
				<tr #trClass#>
					<td>#fo.getSeasonYear()#</td>
					<td>#fo.getSeasonWeek()#</td>
					<td>#dayOfWeekAsString(dayOfWeek(fo.getGameTime() ) )#</td>
					<td>#dateFormat(fo.getGameTime(), "mm/dd/yyyy")#</td>
					<td>#timeFormat(fo.getGameTime(), "hh:mm tt")#</td>
					<td>#fo.getVisitorTeamId()#</td>
					<td>@#fo.getHomeTeamId()#</td>
				</tr>
			</cfoutput>
		</cfloop>
	</tbody>
</table>

<!---
	Save content to be placed at the bottom of the layout file.

	The content has to be stored in the array (htmlFootArray) which will
	be looped through and added to the bottom of the layout file.
--->
<cfsavecontent variable="htmlFootContent">
	<script src="/includes/js/jquery.dataTables.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#contentTable").dataTable({
				pageLength: 25
				,order: [ [3, 'asc'], [4, 'asc'], [5, 'asc'] ]
			});
		});
	</script>
</cfsavecontent>
<cfset arrayAppend(request.htmlFootArray, htmlFootContent) />
