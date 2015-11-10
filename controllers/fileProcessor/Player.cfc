/**
* @description
* Process CSV files passed for data dumping.
*/
component output=false extends="controllers.fileProcessor.ProcessFile" {
	public function init(required string filePath){
		var headerColumns = {
			"mustHaveColumns"=[
				"ID"
				,"Player"
			]
			,"entity"="Player"
			,"columnOrder"=[
				{
					name="fantasyDataId"
					,type="numeric"
					,fileColumn="2"
				}
				,{
					name="playerName"
					,type="string"
					,fileColumn="3"
				}
			]
		};

		return super.init(arguments.filePath, local.headerColumns);
	}
}