@objc(ModusEchoSwift) class ModusEchoSwift : CDVPlugin {
    func echo(_ command: CDVInvokedUrlCommand) {
        let msg = command.arguments[0] as? String ?? ""
        var data = ""
        //print("method call OK!")
        let infoDic = Bundle.main.infoDictionary
        if(msg == "version"){
            // 取App的版本號
            let appVersion = infoDic?["CFBundleShortVersionString"]
            data = appVersion as! String
            // print(appVersion as Any)
            // 取App的build版本
            //let appBuildVersion = infoDic?["CFBundleVersion"]
            //print(appBuildVersion as Any)
            
        }else if(msg == "APPname"){
            // 取App的名稱
            let appName = infoDic?["CFBundleDisplayName"]
            data = appName as! String
            //print(appName as Any)
        }

        let pluginResult = CDVPluginResult(
            status: CDVCommandStatus_OK,
            messageAs: data + ",ECHO"
        )
            
        self.commandDelegate!.send(
            pluginResult,
            callbackId: command.callbackId
        )
    }
}
