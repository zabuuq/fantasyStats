<!--- 
	Save content to be placed in the <head> of the layout file.
	<cfhtmlhead> automatically adds the saved content to the <head>.
--->
<cfsavecontent variable="htmlHeadContent">
	<link rel="stylesheet" type="text/css" href="/includes/css/jquery.dataTables.css" />
</cfsavecontent>

<cfhtmlhead text="#htmlHeadContent#" />

<table id="contentTableDst" class="table table-striped">
	<caption>Fantasy Stats</caption>
	<thead>
		<tr>
			<th title="ID">ID</th>
			<th title="Season Year">Year</th>
			<th title="Week Number">Week</th>
			<th title="Tackles For Loss">TFL</th>
			<th title="Sacks">Sacks</th>
			<th title="QB Hits">QB Hits</th>
			<th title="Interceptions">Int</th>
			<th title="Fumbles Recovered">FRec</th>
			<th title="Safeties">Sfty</th>
			<th title="Defensive Touchdowns">DTD</th>
			<th title="Special Teams Touchdowns">RTD</th>
			<th title="Points Allowed">PA</th>
			<th title="Fanduel Fantasy Points">FFP</th>
		</tr>
	</thead>

	<tbody>
		<cfloop array="#prc.fileOutput[1]#" index="fod">
			<cfset trClass=(fod.getStatsId() NEQ "") ? "class='warning text-warning'" : "" />
			<cfoutput>
				<tr #trClass#>
					<td>#fod.getFantasyDataId()#</td>
					<td>#fod.getSeasonYear()#</td>
					<td>#fod.getSeasonWeek()#</td>
					<td>#fod.getTacklesForLoss()#</td>
					<td>#numberFormat(fod.getSacks(), "_._")#</td>
					<td>#fod.getQbHits()#</td>
					<td>#fod.getInterceptions()#</td>
					<td>#fod.getFumblesRecovered()#</td>
					<td>#fod.getSafeties()#</td>
					<td>#fod.getDefensiveTd()#</td>
					<td>#fod.getSpecialTeamsTd()#</td>
					<td>#fod.getPointsAllowed()#</td>
					<td>#numberFormat(fod.getFanduelFantasyPoints(), "_.__")#</td>
				</tr>
			</cfoutput>
		</cfloop>
	</tbody>
</table>

<cfoutput>#fsPlayerTables#</cfoutput>
