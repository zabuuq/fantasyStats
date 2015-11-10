/**
* @description
* Process CSV files passed for data dumping.
*/
component output=false extends="controllers.fileProcessor.ProcessFile" {
	public function init(required string filePath){
		var headerColumns = {
			"mustHaveColumns"=[
				"ID"
				,"Year"
				,"Week"
				,"FG Made"
				,"FG Att"
				,"Pct"
				,"Long"
				,"XP Made"
				,"XP Att"
				,"Fantasy Points"
			]
			,"entity"="FantasyStatsK"
			,"columnOrder"=[
				{
					name="fantasyDataId"
					,type="numeric"
					,fileColumn="2"
				}
				,{
					name="seasonYear"
					,type="numeric"
					,fileColumn="5"
				}
				,{
					name="seasonWeek"
					,type="numeric"
					,fileColumn="6"
				}
				,{
					name="fieldGoalsMade"
					,type="numeric"
					,fileColumn="9"
				}
				,{
					name="fieldGoalsAttempted"
					,type="numeric"
					,fileColumn="10"
				}
				,{
					name="percentage"
					,type="numeric"
					,fileColumn="11"
				}
				,{
					name="longestFieldGoal"
					,type="numeric"
					,fileColumn="12"
				}
				,{
					name="extraPointsMade"
					,type="numeric"
					,fileColumn="13"
				}
				,{
					name="extraPointsAttempted"
					,type="numeric"
					,fileColumn="14"
				}
				,{
					name="fanduelFantasyPoints"
					,type="numeric"
					,fileColumn="15"
				}
			]
		};

		return super.init(arguments.filePath, local.headerColumns);
	}
}