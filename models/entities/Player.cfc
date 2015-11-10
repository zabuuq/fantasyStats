/**
* @description
* Entity for Player table.
*/
component output=false accessors=true persistent=true extends="models.EntityInfo" {
	property type="numeric"	cfsqltype="int"		name="playerId" fieldType="id" generator="identity";
	property type="numeric"	cfsqltype="int"		name="fantasyDataId";
	property type="numeric"	cfsqltype="nchar"	name="playerName" length=100;

	property fieldtype="one-to-many"			name="playerSchedule" cfc="PlayerWeek" fkcolumn="fantasyDataId";

	public function init(){
		return this;
	}

	public void function postLoad(){
	}
}
