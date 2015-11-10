/**
* @description
* Entity for Team table.
*/
component output=false accessors=true persistent=true extends="models.EntityInfo" {
	property type="numeric"	cfsqltype="int"		name="teamNumId" fieldType="id" generator="identity";
	property type="string"	cfsqltype="nchar"	name="teamId" length=3;
	property type="string"	cfsqltype="nchar"	name="teamLocation" length=100;
	property type="string"	cfsqltype="nchar"	name="teamName" length=100;
	property type="string"	cfsqltype="nchar"	name="teamConference" length=3;
	property type="string"	cfsqltype="nchar"	name="teamDivision" length=5;
	property type="boolean"	cfsqltype="bit"		name="isActive";

	property type="array"	persistent=false	name="teamSchedule";
	property type="array"	persistent=false	name="thisWeekGame";
	property type="array"	persistent=false	name="nextGame";
	
	property type="numeric"	persistent=false	name="seasonYear";

	public function init(){
		return this;
	}

	public void function postLoad(numeric seasonYear){
		variables.seasonYear = (month(now() ) > 4) ? year(now() ) : year(now() ) - 1;
		variables.seasonYear = (structKeyExists(arguments, "seasonYear") && isValid("range", arguments.seasonYear, 1900, 2100) ) ? arguments.seasonYear : variables.seasonYear;

		variables.teamSchedule = ormExecuteQuery("
			FROM	TeamSchedule
			WHERE	seasonYear = :seasonYear
			AND (
					visitorTeamId = :teamId
				OR	homeTeamId = :teamId
			)
			ORDER BY gameTime"
			,{
				seasonYear = variables.seasonYear
				,teamId = variables.teamId
			}
		);

		footballWeek = {
			"start" = dateFormat(fix(now() ) - dayOfWeek(fix(now() ) ) + 5, "mm/dd/yyyy")
			,"end" = dateFormat(fix(now() ) - dayOfWeek(fix(now() ) ) + 11, "mm/dd/yyyy")
		};

		variables.thisWeekGame = ormExecuteQuery("
			FROM	TeamSchedule
			WHERE	gameTime >= :weekStart
			AND		gameTime <= :weekEnd
			AND	(
					visitorTeamId = :teamId
				OR	homeTeamId = :teamId
			)
			ORDER BY gameTime"
			,{
				weekStart = footballWeek.start
				,weekEnd = footballWeek.end
				,teamId = variables.teamId
			}
		);

		variables.nextGame = ormExecuteQuery("
			FROM	TeamSchedule
			WHERE	gameTime > :today
			AND	(
					visitorTeamId = :teamId
				OR	homeTeamId = :teamId
			)
			ORDER BY gameTime"
			,{
				today = now()
				,teamId = variables.teamId
			}
			,{maxResults = 1}
		);
	}

	public void function setSeasonYear(required numeric seasonYear){
		variables.seasonYear = arguments.seasonYear;

		postLoad(variables.seasonYear);
	}

	public array function getScheduleForWeek(required numeric seasonWeek){
		return ormExecuteQuery("
			FROM	TeamSchedule
			WHERE	seasonYear = :seasonYear
			AND		seasonWeek = :seasonWeek
			AND	(
					visitorTeamId = :teamId
				OR	homeTeamId = :teamId
			)
			ORDER BY gameTime"
			,{
				seasonYear = variables.seasonYear
				,seasonWeek = arguments.seasonWeek
				,teamId = variables.teamId
			}
		);
	}
}
