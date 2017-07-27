@objc(swiftact) class swiftact : CDVPlugin {

    func version(command: CDVInvokedUrlCommand){
        var pluginResult:CDVPluginResult?
        let strVersion = Bundle .main .object(forInfoDictionaryKey: "CFBundleShortVersionString")
	    pluginResult = CDVPluginResult(status: CDVCommandStatus_OK,messageAs: strVersion)
	    self.commandDelegate!.send(pluginResult,callbackId:command.callbackId)
    }
	
    func openimage(){}
	
    func echo(command: CDVInvokedUrlCommand) {}
}
