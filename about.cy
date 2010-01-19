#!/usr/bin/cycript -p SpringBoard

//Original idea by optimo

SpringBoard.prototype.toggleAbout = function()
{
	[SBAwayController.sharedAwayController playLockSound];
	about = [SBDismissOnlyAlertItem.alloc
				initWithTitle:"About this "+UIHardware.localizedDeviceName
				body:UIDevice.currentDevice.model+" "+UIDevice.currentDevice.name+"\n"
					+SBLowPowerAlertItem.systemVersionDescription +"\n\n"
					+"UDID: " +UIDevice.currentDevice.uniqueIdentifier+"\n"
			];
	[SBAlertItemsController.sharedInstance activateAlertItem:about];
	[about release];
}

@class SBStatusBarCarrierView
- touchesEnded:touches withEvent:event
{
	if(!SBAwayController.sharedAwayController.isLocked)
		UIApp.toggleAbout();
}
@end

@class SBStatusBarOperatorNameView
- touchesEnded:touches withEvent:event
{
	if(!SBAwayController.sharedAwayController.isLocked)
		UIApp.toggleAbout();
}
@end

@class SBStatusBarNoServiceView
- touchesEnded:touches withEvent:event
{
	if(!SBAwayController.sharedAwayController.isLocked)
		UIApp.toggleAbout();
}
@end
