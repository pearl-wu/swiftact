@objc(swiftact) class swiftact : CDVPlugin {

    func version(command: CDVInvokedUrlCommand){
        let infoDic = Bundle.main.infoDictionary
        
        //APP version
        let appVersion = infoDic?["CFBundleShortVersionString"]
        print(appVersion)
        //var pluginResult:CDVPluginResult?
	    //pluginResult = CDVPluginResult(status: CDVCommandStatus_OK,messageAs: strVersion)
	    //self.commandDelegate!.send(pluginResult,callbackId:command.callbackId)
    }
	
    func openimage(){}
	
    func echo(command: CDVInvokedUrlCommand) {}
}
