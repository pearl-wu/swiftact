@objc(ModusSwift) class ModusSwift : CDVPlugin {
    func version(_ command: CDVInvokedUrlCommand) {
        let msg = command.arguments[0] as? String ?? ""
        var data = ""
        //print("method call OK!")
        let infoDic = Bundle.main.infoDictionary
        if(msg == "version"){         // 取App的版本號
            let appVersion = infoDic?["CFBundleShortVersionString"]
            data = appVersion as! String
            // print(appVersion as Any)
            // 取App的build版本
            //let appBuildVersion = infoDic?["CFBundleVersion"]
            //print(appBuildVersion as Any)
        }else if(msg == "APPname"){   // 取App的名稱
            let appName = infoDic?["CFBundleDisplayName"]
            data = appName as! String
            //print(appName as Any)
        }
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK,messageAs: data)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }
    
    func toptype(_ command: CDVInvokedUrlCommand){
        let msg = command.arguments[0] as? String ?? ""
        if(msg == "black"){
            UIApplication.shared.statusBarStyle = UIStatusBarStyle.default
        }else{
            UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent
        }
    }
    
    func download(_ command: CDVInvokedUrlCommand){}
    
    func imagecotroller(_ command: CDVInvokedUrlCommand){}
    
    func fileview(_ command: CDVInvokedUrlCommand){
        let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        do {
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: [])
            print(directoryContents)
            
            // if you want to filter the directory contents you can do like this:
            let mp3Files = directoryContents.filter{ $0.pathExtension == "mp3" }
            print("mp3 urls:",mp3Files)
            let mp3FileNames = mp3Files.map{ $0.deletingPathExtension().lastPathComponent }
            print("mp3 list:", mp3FileNames)
            
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }

}
