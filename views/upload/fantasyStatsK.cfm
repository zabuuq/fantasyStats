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
			<th title="Field Goals Made">FG Made</th>
			<th title="Field Goals Attempted">FG Att</th>
			<th title="Percentage">%</th>
			<th title="Longest Field Goal">Longest</th>
			<th title="Extra Points Made">XP Made</th>
			<th title="Extra Points Attempted">XP Att</th>
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
					<td>#fod.getFieldGoalsMade()#</td>
					<td>#fod.getFieldGoalsAttempted()#</td>
					<td nowrap="nowrap">#numberFormat(fod.getPercentage(), "_._")# %</td>
					<td>#fod.getLongestFieldGoal()#</td>
					<td>#fod.getExtraPointsMade()#</td>
					<td>#fod.getExtraPointsAttempted()#</td>
					<td>#numberFormat(fod.getFanduelFantasyPoints(), "_.__")#</td>
				</tr>
			</cfoutput>
		</cfloop>
	</tbody>
</table>

<cfoutput>#fsPlayerTables#</cfoutput>
