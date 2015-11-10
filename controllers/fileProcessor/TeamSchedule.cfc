/**
* @description
* Process CSV files passed for data dumping.
*/
component output=false extends="controllers.fileProcessor.ProcessFile" {
	public function init(required string filePath){
		var headerColumns = {
			"mustHaveColumns"=[
				"Year"
				,"Visitor"
				,"Home"
				,"Week"
				,"Date"
				,"Time"
			]
			,"entity"="TeamSchedule"
			,"columnOrder"=[
				{
					name="seasonYear"
					,type="numeric"
					,fileColumn="1"
				}
				,{
					name="seasonWeek"
					,type="numeric"
					,fileColumn="4"
				}
				,{
					name="gameTime"
					,type="date"
					,fileColumn="6,7"
				}
				,{
					name="visitorTeamId"
					,type="string"
					,fileColumn="2"
				}
				,{
					name="homeTeamId"
					,type="string"
					,fileColumn="3"
				}
			]
		};

		return super.init(arguments.filePath, local.headerColumns);
	}
}