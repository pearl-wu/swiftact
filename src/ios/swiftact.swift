@objc(swiftact) class swiftact : CDVPlugin {

    func version(command: CDVInvokedUrlCommand){
	    let strVersion = NSBundle .mainBundle() .objectForInfoDictionaryKey("CFBundleShortVersionString")
	    var pluginResult = CDVPluginResult(
	      status: CDVCommand_OK,
	      messageAs: strVersion
	    )
	   self.commandDelegate!.send(pluginResult,callbackId:command.callbackId)
	   print(strVersion)		
    }
	
    func openimage(){
    	let url = NSURL();
	let data = NSData(contentsOfURL:url!)
	let newImage = UIImage(data:data!)
	let newImage=UIImageView(image:newImage);
	self.view.addSubview(imageView)
    }
	
    func echo(command: CDVInvokedUrlCommand) {
        var pluginResult = CDVPluginResult(
            status: CDVCommandStatus_ERROR
        )

        let msg = command.arguments[0] as? String ?? ""

        if msg.characters.count > 0 {
            /* UIAlertController is iOS 8 or newer only. */
            let toastController: UIAlertController = 
                UIAlertController(
                    title: "", 
                    message: msg, 
                    preferredStyle: .Alert
                )

            self.viewController?.presentViewController(
                toastController, 
                animated: true, 
                completion: nil
            )

            let duration = Double(NSEC_PER_SEC) * 3.0
            dispatch_after(
                dispatch_time(
                    DISPATCH_TIME_NOW, 
                    Int64(duration)
                ), 
                dispatch_get_main_queue(), 
                { 
                    toastController.dismissViewControllerAnimated(
                        true, 
                        completion: nil
                    )
                }
            )

            pluginResult = CDVPluginResult(
                status: CDVCommandStatus_OK,
                messageAsString: msg
            )
        }

        self.commandDelegate!.sendPluginResult(
            pluginResult, 
            callbackId: command.callbackId
        )
    }
}
