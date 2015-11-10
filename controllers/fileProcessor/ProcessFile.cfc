/**
* @description
* Process CSV files passed for data dumping.
*/
component output=false {
	property name="filePath" type="string";
	property name="headerColumns" type="struct";

	public function init(required string filePath, required struct headerColumns){
		variables.filePath = arguments.filePath;
		variables.headerColumns = arguments.headerColumns;

		return this;
	}

	public array function processFile(){
		var entityReturn = [];
		var compareArray = [];

		var fileOutput = processFileLines();

		for(fo in local.fileOutput){
			// Create the argument for the entity.
			var args = {};
			var colData = [];
			for(co in headerColumns.columnOrder){
				var argVal = (co.type == "numeric") ? 0 : "";
				for(cNum in listToArray(co.fileColumn) ){
					switch(co.type){
						case "numeric":
							local.argVal = local.argVal + listGetAt(fo, cNum);
						break;
					
						case "boolean":
							local.argVal = listGetAt(fo, cNum);
						break;
					
						default:
							local.argVal = local.argVal & " " & listGetAt(fo, cNum);
							local.argVal = trim(local.argVal);
						break;
					}
				}

				local.args[co.name] = local.argVal;
				arrayAppend(local.colData, {
					"name" = co.name
					,"value" = local.argVal
				});
			}

			if(arrayFind(local.compareArray, local.args) == 0){
				var theEntity = entityLoad(headerColumns.entity, local.args, true);
				local.theEntity = (structKeyExists(local, "theEntity") ) ? local.theEntity : entityNew(headerColumns.entity);

				for(cd in local.colData){
					local.theEntity.setEntityInfo(cd.name, cd.value);
				}

				arrayAppend(local.entityReturn, local.theEntity);
				arrayAppend(local.compareArray, local.args);
			}
		}

		return local.entityReturn;
	}

	public void function deleteFile(){
		try {
			fileDelete(variables.filePath);
		}
		catch(coldfusion.tagext.io.FileUtils$FileDoesNotExistException e){
			/**
			* This error is a file not found error.
			* In the case of a file not found error, then continue to delete the 
			* data from the database.
			* 
			* The file is already deleted for you!
			* */

			// Do nothing!
		}
		catch(any e){
			// Log the error.
			writeLog(text:"FileManager delete error. Message: " & arguments.errorObj.message & " details: " & arguments.errorObj.detail, file:"file-manager", type:"error" );
		}
	}

	private array function processFileLines(){
		var fo = fileOpen(variables.filePath, "read");

		var hasHeader = false;
		var fileOutput = [];
		while(!fileIsEOF(local.fo) ){
			var frl = fileReadLine(local.fo);

			if(!local.hasHeader){
				var isHeaderRow = true;
				for(hc in headerColumns.mustHaveColumns){
					if(!listFind(local.frl, hc) ){
						local.isHeaderRow = false;
					}
				}

				if(local.isHeaderRow){
					local.hasHeader = true;
					continue;
				}
			}

			arrayAppend(local.fileOutput, local.frl);
		}

		fileClose(local.fo);

		return local.fileOutput;
	}
}