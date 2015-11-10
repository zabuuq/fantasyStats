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
				,"Team"
				,"Pos"
			]
			,"entity"="PlayerWeek"
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
					name="teamId"
					,type="string"
					,fileColumn="7"
				}
				,{
					name="position"
					,type="string"
					,fileColumn="4"
				}
			]
		};

		return super.init(arguments.filePath, local.headerColumns);
	}
}