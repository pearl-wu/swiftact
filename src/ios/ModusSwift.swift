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
    
    func downloadfile(_ command: CDVInvokedUrlCommand){
        let mag = command.arguments[0] as? String ?? ""
        let documentsUrl:URL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first as URL!
        _ = documentsUrl.appendingPathComponent(mag)
        let fileURL = URL(string:mag)
        
        _ = URLSessionConfiguration.default
        _ = URLRequest(url:fileURL!)
        
        
        
    }
    
    func isfile(_ command: CDVInvokedUrlCommand){
        let mag = command.arguments[0] as? String ?? ""
        let fileManager = FileManager.default
        let filePath:String = NSHomeDirectory() + "/Documents/ \(mag)"
        let exist = fileManager.fileExists(atPath: filePath)
        var data:Bool;
        if exist{
            data = true;
        }else{
            data = false;
        }
        let pluginResult = CDVPluginResult(status: CDVCommandStatus_OK,messageAs: data)
        self.commandDelegate!.send(pluginResult,callbackId: command.callbackId)
    }
    
    func openfile(_ command: CDVInvokedUrlCommand){
        let mag = command.arguments[0] as? String ?? ""
        let fileManager = FileManager.default
        let filePath:String = NSHomeDirectory() + "/Documents/ \(mag)"
        _ = fileManager.fileExists(atPath: filePath)
    }
    
    func fileview(_ command: CDVInvokedUrlCommand){
        //let arr = command.arguments[0] as? [String] ?? [""]
        //let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let homeDir = NSHomeDirectory();
        print(homeDir);
        
        let fmo=FileManager.default
        let urls=fmo.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask)
        print("-----------")
        print("base dir: \(urls)")
        do {
            let filelist=try fmo.contentsOfDirectory(at: urls[0], includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            for file in filelist {
                print("\(file.lastPathComponent)")
            }
        } catch {
            print(error)
        }
        
        //let manager = FileManager.default
        //let urlsForDocDirectory = manager.urls(for: FileManager.SearchPathDirectory.documentDirectory,in:FileManager.SearchPathDomainMask.userDomainMask)
        //let docPath:NSURL = urlsForDocDirectory[0] **as** NSURL
        //let file = docPath.appendingPathComponent("test.txt")
        //let attributes = try? manager.sttributesOfItemAtPath(file.path!)
        //print("attributes: \\(attributes!)")
        
        
        /*do {
         // Get the directory contents urls (including subfolders urls)
         let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: [])
         //print(directoryContents)
         
         // if you want to filter the directory contents you can do like this:
         let mp3Files = directoryContents.filter{ $0.pathExtension == "mp3" }
         print("urls:",mp3Files)
         let mp3FileNames = mp3Files.map{ $0.deletingPathExtension().lastPathComponent }
         print("list:", mp3FileNames)
         
         } catch let error as NSError {
         print(error.localizedDescription)
         }*/
    }
    
}
