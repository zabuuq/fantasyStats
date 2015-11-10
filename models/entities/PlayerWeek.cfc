/**
* @description
* Entity for PlayerWeek table.
*/
component output=false accessors=true persistent=true extends="models.EntityInfo" {
	property type="numeric"	cfsqltype="int"			name="playerWeekId" fieldType="id" generator="identity";
	property type="numeric"	cfsqltype="int"			name="fantasyDataId";
	property type="numeric"	cfsqltype="smallint"	name="seasonYear";
	property type="numeric"	cfsqltype="tinyint"		name="seasonWeek";
	property type="string"	cfsqltype="nchar"		name="teamId" length=3;
	property type="string"	cfsqltype="nchar"		name="position" length=5;

	property type="struct"	persistent=false 		name="team";
	property type="array"	persistent=false		name="player";

	property type="array"	persistent=false		name="weekGame";

	public function init(){
		return this;
	}

	public void function postLoad(){
		variables.team = entityLoad("Team", {teamId=variables.teamId}, true);
		variables.team.setSeasonYear(variables.seasonYear);
		
		variables.player = entityLoad("Player", {fantasyDataId=variables.fantasyDataId}, true);

		variables.weekGame = variables.team.getScheduleForWeek(variables.seasonWeek);
	}
}
