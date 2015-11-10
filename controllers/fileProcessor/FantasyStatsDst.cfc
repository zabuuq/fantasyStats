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
				,"TFL"
				,"Sacks"
				,"QB Hits"
				,"Int"
				,"Fum Rec"
				,"Safeties"
				,"Def TD"
				,"Return TD"
				,"Pts Allowed"
				,"Fantasy Points"
			]
			,"entity"="FantasyStatsDst"
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
					name="tacklesForLoss"
					,type="numeric"
					,fileColumn="9"
				}
				,{
					name="sacks"
					,type="numeric"
					,fileColumn="10"
				}
				,{
					name="qbHits"
					,type="numeric"
					,fileColumn="11"
				}
				,{
					name="interceptions"
					,type="numeric"
					,fileColumn="12"
				}
				,{
					name="fumblesRecovered"
					,type="numeric"
					,fileColumn="13"
				}
				,{
					name="safeties"
					,type="numeric"
					,fileColumn="14"
				}
				,{
					name="defensiveTd"
					,type="numeric"
					,fileColumn="15"
				}
				,{
					name="specialTeamsTd"
					,type="numeric"
					,fileColumn="16"
				}
				,{
					name="pointsAllowed"
					,type="numeric"
					,fileColumn="17"
				}
				,{
					name="fanduelFantasyPoints"
					,type="numeric"
					,fileColumn="18"
				}
			]
		};

		return super.init(arguments.filePath, local.headerColumns);
	}
}