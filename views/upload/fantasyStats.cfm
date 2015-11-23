<cfsavecontent variable="fsPlayerTables">
	<hr />

	<table id="contentTablePlayerWeek" class="table table-striped">
		<caption>Player Week Information</caption>
		<thead>
			<tr>
				<th title="ID">ID</th>
				<th title="Season Year">Year</th>
				<th title="Week Number">Week</th>
				<th title="Team Played For">Team</th>
				<th title="Position Played">Position</th>
			</tr>
		</thead>

		<tbody>
			<cfloop array="#prc.fileOutput[2]#" index="fopw">
				<cfset trClass=(fopw.getPlayerWeekId() NEQ "") ? "class='warning text-warning'" : "" />
				<cfoutput>
					<tr #trClass#>
						<td>#fopw.getFantasyDataId()#</td>
						<td>#fopw.getSeasonYear()#</td>
						<td>#fopw.getSeasonWeek()#</td>
						<td>#fopw.getTeamId()#</td>
						<td>#fopw.getPosition()#</td>
					</tr>
				</cfoutput>
			</cfloop>
		</tbody>
	</table>

	<hr />

	<table id="contentTablePlayer" class="table table-striped">
		<caption>Player Information</caption>
		<thead>
			<tr>
				<th title="ID">ID</th>
				<th title="Player Name">Name</th>
			</tr>
		</thead>

		<tbody>
			<cfloop array="#prc.fileOutput[3]#" index="fop">
				<cfset trClass=(fop.getPlayerId() NEQ "") ? "class='warning text-warning'" : "" />
				<cfoutput>
					<tr #trClass#>
						<td>#fop.getFantasyDataId()#</td>
						<td>#fop.getPlayerName()#</td>
					</tr>
				</cfoutput>
			</cfloop>
		</tbody>
	</table>
</cfsavecontent>

<!---
	Save content to be placed at the bottom of the layout file.

	The content has to be stored in the array (htmlFootArray) which will
	be looped through and added to the bottom of the layout file.
--->
<cfsavecontent variable="htmlFootContent">
	<script src="/includes/js/jquery.dataTables.min.js"></script>

	<script type="text/javascript">
		$(document).ready(function(){
			$("#contentTableDst").dataTable({
				order: [ [0, 'asc'], [1, 'asc'] ]
			});

			$("#contentTablePlayerWeek").dataTable({
				order: [ [0, 'asc'], [1, 'asc'] ]
			});

			$("#contentTablePlayer").dataTable({
				order: [ [1, 'asc'] ]
			});
		});
	</script>
</cfsavecontent>
<cfset arrayAppend(request.htmlFootArray, htmlFootContent) />
