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
			<th rowspan="2">Team</th>
			<th rowspan="2">Location</th>
			<th rowspan="2">Name</th>
			<th rowspan="2">Conference</th>
			<th rowspan="2">Division</th>
			<th colspan="2" class="text-center">This Week</th>
			<th colspan="2" class="text-center">Next Game</th>
		</tr>
		<tr>
			<th>Game Time</th>
			<th>Opponent</th>
			<th>Game Time</th>
			<th>Opponent</th>
		</tr>
	</thead>

	<tbody>
		<cfloop array="#prc.teamList#" index="tl">
			<cfif arrayLen(tl.getThisWeekGame() ) GT 0>
				<cfset thisWeekGameTime = dateTimeFormat(tl.getThisWeekGame()[1].getGameTime(), "mm/dd/yy hh:mm tt (EEE)") />
				<cfset thisWeekOpponent = (tl.getThisWeekGame()[1].getHomeTeamId() EQ tl.getTeamId() ) ? tl.getThisWeekGame()[1].getVisitorTeamId() : "@" & tl.getThisWeekGame()[1].getHomeTeamId() />
			<cfelse>
				<cfset thisWeekGameTime = "BYE" />
				<cfset thisWeekOpponent = "&nbsp;" />
			</cfif>

			<cfif arrayLen(tl.getNextGame() ) GT 0>
				<cfset nextGameTime = dateTimeFormat(tl.getNextGame()[1].getGameTime(), "mm/dd/yy hh:mm tt (EEE)") />
				<cfset nextGameOpponent = (tl.getNextGame()[1].getHomeTeamId() EQ tl.getTeamId() ) ? tl.getNextGame()[1].getVisitorTeamId() : "@" & tl.getNextGame()[1].getHomeTeamId() />
			<cfelse>
				<cfset nextGameTime = "BYE" />
				<cfset nextGameOpponent = "&nbsp;" />
			</cfif>

			<cfoutput>
				<tr>
					<td>#tl.getTeamId()#</td>
					<td>#tl.getTeamLocation()#</td>
					<td>#tl.getTeamName()#</td>
					<td>#tl.getTeamConference()#</td>
					<td>#tl.getTeamDivision()#</td>
					<td>#thisWeekGameTime#</td>
					<td>#thisWeekOpponent#</td>
					<td>#nextGameTime#</td>
					<td>#nextGameOpponent#</td>
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
				paging: false
			});
		});
	</script>
</cfsavecontent>
<cfset arrayAppend(request.htmlFootArray, htmlFootContent) />
