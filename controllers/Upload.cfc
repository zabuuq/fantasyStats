/**
* @description
* A single Controller for all the upload functions in the Upload handler
*/

component output=false accessors=true {
	property name="filePath" type="string";
	property name="processFile" accessors=false type="array";

	public function init(string filePath){
		variables.filePath = (structKeyExists(arguments, "filePath") ) ? arguments.filePath : "";
		variables.processFile = [];

		return this;
	}

	public void function uploadFile(required string applicationPath){
		var uploadPath = arguments.applicationPath & "includes\uploads\";
		var fileUploadStruct = fileUpload(local.uploadPath, "fileUpload", "text/csv", "overwrite");
		variables.filePath = local.uploadPath & local.fileUploadStruct.clientFile;
	}

	public void function addProcessFile(required struct processFile){
		arrayAppend(variables.processFile, arguments.processFile);
	}

	public array function processFile(){
		var fileOutput = [];

		for(pf in variables.processFile){
			arrayAppend(local.fileOutput, pf.processFile() );
		}

		return fileOutput;
	}

	public void function deleteFile(){
		for(pf in variables.processFile){
			pf.deleteFile();
		}
	}
}