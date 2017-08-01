@objc(ModusEchoSwift) class ModusEchoSwift : CDVPlugin {
    func echo(command: CDVInvokedUrlCommand) {
        print("echo echo echo echo")
       let msg = command.arguments[0] as? String ?? ""
       let pluginResult = CDVPluginResult(
           status: CDVCommendStaus_OK,
           messageAs: msg+",ECHO"
       )
        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
    }
}
