/**
* @description
* Entity for FantasyStatsDst table.
*/
component output=false accessors=true persistent=true extends="models.FantasyStats" {
	property type="numeric"	cfsqltype="int"			name="statsId" fieldType="id" generator="identity";
	property type="numeric"	cfsqltype="int"			name="fantasyDataId";
	property type="numeric"	cfsqltype="smallint"	name="seasonYear";
	property type="numeric"	cfsqltype="tinyint"		name="seasonWeek";

	property type="numeric"	cfsqltype="tinyint"		name="tacklesForLoss";
	property type="numeric"	cfsqltype="float"		name="sacks";
	property type="numeric"	cfsqltype="tinyint"		name="qbHits";
	property type="numeric"	cfsqltype="tinyint"		name="interceptions";
	property type="numeric"	cfsqltype="tinyint"		name="fumblesRecovered";
	property type="numeric"	cfsqltype="tinyint"		name="safeties";
	property type="numeric"	cfsqltype="tinyint"		name="defensiveTd";
	property type="numeric"	cfsqltype="tinyint"		name="specialTeamsTd";
	property type="numeric"	cfsqltype="tinyint"		name="pointsAllowed";

	property type="numeric"	cfsqltype="float"		name="fanduelFantasyPoints";

	property type="array"	persistent=false		name="playerWeek";

	public function init(){
		return this;
	}
}
