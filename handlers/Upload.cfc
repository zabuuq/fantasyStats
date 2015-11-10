component extends="coldbox.system.EventHandler"{
	// Default Action
	function index(event,rc,prc){
		prc.messageBox = getInstance("messagebox@cbmessagebox");
	}

	function teamSchedule(event,rc,prc){
		prc.messageBox = getInstance("messagebox@cbmessagebox");

		prc.uploader = new controllers.Upload();
		prc.uploader.uploadFile(getSetting("applicationPath") );
		
		prc.uploader.addProcessFile(new controllers.fileProcessor.TeamSchedule(prc.uploader.getFilePath() ) );

		prc.fileOutput = prc.uploader.processFile()[1];

		prc.processEvent = "upload.teamScheduleProcess";
		prc.formDisplay = "Process Team Schedule Upload";

		prc.messageBox.setMessage("info", "Team Schedule pre-processed without errors. Click 'Process' to enter the data into the database.");
	}

	function teamScheduleProcess(event,rc,prc){
		prc.messageBox = getInstance("messagebox@cbmessagebox");

		transaction {
			try {
				var uploader = new controllers.Upload(rc.filePath);

				local.uploader.addProcessFile(new controllers.fileProcessor.TeamSchedule(local.uploader.getFilePath() ) );

				var fileOutput = local.uploader.processFile();

				for(ent in local.fileOutput[1]){
					entitySave(ent);
				}

				prc.messageBox.setMessage("info", "Team Schedule data added to the database.");

				transactionCommit();

				local.uploader.deleteFile();

				setNextEvent(event="upload");
			}
			catch(any e){
				transactionRollback();

				prc.messageBox.setMessage("error", "<p>There was an error processing the Team Schedule.</p><p><strong>#e.message#</strong></p>");

				setNextEvent(event="upload");
			}
		}
	}

	function fantasyStatsDst(event,rc,prc){
		prc.messageBox = getInstance("messagebox@cbmessagebox");

		prc.uploader = new controllers.Upload();
		prc.uploader.uploadFile(getSetting("applicationPath") );

		prc.uploader.addProcessFile(new controllers.fileProcessor.FantasyStatsDst(prc.uploader.getFilePath() ) );
		prc.uploader.addProcessFile(new controllers.fileProcessor.PlayerWeek(prc.uploader.getFilePath() ) );
		prc.uploader.addProcessFile(new controllers.fileProcessor.Player(prc.uploader.getFilePath() ) );

		prc.fileOutput = prc.uploader.processFile();

		prc.processEvent = "upload.fantasyStatsDstProcess";
		prc.formDisplay = "Process Fantasy Stats for DST Upload";

		prc.messageBox.setMessage("info", "Fantasy Stats for DST pre-processed without errors. Click 'Process' to enter the data into the database.");
	}

	function fantasyStatsDstProcess(event,rc,prc){
		prc.messageBox = getInstance("messagebox@cbmessagebox");

		transaction {
			try {
				var uploader = new controllers.Upload(rc.filePath);

				local.uploader.addProcessFile(new controllers.fileProcessor.FantasyStatsDst(local.uploader.getFilePath() ) );
				local.uploader.addProcessFile(new controllers.fileProcessor.PlayerWeek(local.uploader.getFilePath() ) );
				local.uploader.addProcessFile(new controllers.fileProcessor.Player(local.uploader.getFilePath() ) );

				var fileOutput = local.uploader.processFile();

				for(fo in local.fileOutput){
					for(ent in fo){
						entitySave(ent);
					}
				}

				prc.messageBox.setMessage("info", "Fantasy Stats for DST data added to the database.");

				transactionCommit();

				local.uploader.deleteFile();

				setNextEvent(event="upload");
			}
			catch(any e){
				transactionRollback();

				prc.messageBox.setMessage("error", "<p>There was an error processing the Fantasy Stats for DST.</p><p><strong>#e.message#</strong></p>");

				setNextEvent(event="upload");
			}
		}
	}

	function fantasyStatsK(event,rc,prc){
		prc.messageBox = getInstance("messagebox@cbmessagebox");

		prc.uploader = new controllers.Upload();
		prc.uploader.uploadFile(getSetting("applicationPath") );

		prc.uploader.addProcessFile(new controllers.fileProcessor.FantasyStatsK(prc.uploader.getFilePath() ) );
		prc.uploader.addProcessFile(new controllers.fileProcessor.PlayerWeek(prc.uploader.getFilePath() ) );
		prc.uploader.addProcessFile(new controllers.fileProcessor.Player(prc.uploader.getFilePath() ) );

		prc.fileOutput = prc.uploader.processFile();

		prc.processEvent = "upload.fantasyStatsKProcess";
		prc.formDisplay = "Process Fantasy Stats for DST Upload";

		prc.messageBox.setMessage("info", "Fantasy Stats for DST pre-processed without errors. Click 'Process' to enter the data into the database.");
	}

	function fantasyStatsKProcess(event,rc,prc){
		prc.messageBox = getInstance("messagebox@cbmessagebox");

		transaction {
			try {
				var uploader = new controllers.Upload(rc.filePath);

				local.uploader.addProcessFile(new controllers.fileProcessor.FantasyStatsK(local.uploader.getFilePath() ) );
				local.uploader.addProcessFile(new controllers.fileProcessor.PlayerWeek(local.uploader.getFilePath() ) );
				local.uploader.addProcessFile(new controllers.fileProcessor.Player(local.uploader.getFilePath() ) );

				var fileOutput = local.uploader.processFile();

				for(fo in local.fileOutput){
					for(ent in fo){
						entitySave(ent);
					}
				}

				prc.messageBox.setMessage("info", "Fantasy Stats for DST data added to the database.");

				transactionCommit();

				local.uploader.deleteFile();

				setNextEvent(event="upload");
			}
			catch(any e){
				transactionRollback();

				writeDump(e);
				abort;

				prc.messageBox.setMessage("error", "<p>There was an error processing the Fantasy Stats for DST.</p><p><strong>#e.message#</strong></p>");

				setNextEvent(event="upload");
			}
		}
	}
}