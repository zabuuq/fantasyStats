/**
* @description
* Entity for TeamSchedule table.
*/
component output=false accessors=true persistent=true extends="models.EntityInfo" {
	property type="numeric"	cfsqltype="int"			name="teamScheduleId" fieldType="id" generator="identity";
	property type="numeric"	cfsqltype="smallint"	name="seasonYear";
	property type="numeric"	cfsqltype="tinyint"		name="seasonWeek";
	property type="date"	cfsqltype="datetime"	name="gameTime";
	property type="string"	cfsqltype="nchar"		name="visitorTeamId" length=3;
	property type="string"	cfsqltype="nchar"		name="homeTeamId" length=3;

	public function init(){
		return this;
	}
}
