/**
* @description
* Parent component for entities.
*/
component output=false extends="models.EntityInfo" {
	property type="array"	persistent=false		name="playerWeek";

	public function init(){
		return this;
	}

	public void function postLoad(){
		variables.playerWeek = ormExecuteQuery("
			FROM	PlayerWeek
			WHERE	fantasyDataId = :fantasyDataId
			AND		seasonYear = :seasonYear
			AND		seasonWeek = :seasonWeek"
			,{
				fantasyDataId = variables.fantasyDataId
				,seasonYear = variables.seasonYear
				,seasonWeek = variables.seasonWeek
			}
		);
	}
}
