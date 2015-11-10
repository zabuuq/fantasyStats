/**
* @description
* Parent component for entities.
*/
component output=false {
	public function init(){
		return this;
	}

	public any function getEntityInfo(required string colName){
		if(structKeyExists(variables, arguments.colName) ){
			return variables[arguments.colName];
		}

		return "";
	}

	public void function setEntityInfo(required string colName, required any colValue){
		variables[arguments.colName] = arguments.colValue;
	}
}
