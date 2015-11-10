/**
* @description
* Entity for FantasyStatsK table.
*/
component output=false accessors=true persistent=true extends="models.FantasyStats" {
	property type="numeric"	cfsqltype="int"			name="statsId" fieldType="id" generator="identity";
	property type="numeric"	cfsqltype="int"			name="fantasyDataId";
	property type="numeric"	cfsqltype="smallint"	name="seasonYear";
	property type="numeric"	cfsqltype="tinyint"		name="seasonWeek";

	property type="numeric"	cfsqltype="tinyint"		name="fieldGoalsMade";
	property type="numeric"	cfsqltype="tinyint"		name="fieldGoalsAttempted";
	property type="numeric"	cfsqltype="float"		name="percentage";
	property type="numeric"	cfsqltype="tinyint"		name="longestFieldGoal";
	property type="numeric"	cfsqltype="tinyint"		name="extraPointsMade";
	property type="numeric"	cfsqltype="tinyint"		name="extraPointsAttempted";

	property type="numeric"	cfsqltype="float"		name="fanduelFantasyPoints";

	property type="array"	persistent=false		name="playerWeek";

	public function init(){
		return this;
	}
}
