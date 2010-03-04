#!/usr/bin/cycript -p SpringBoard

//oringinal idea by optimo

batteryCharge = SBUIController.sharedInstance.batteryCapacityAsPercentage.toString()

if(batteryCharge == 100) {
	batteryCharge = @"Fully Charged\n";
} else if(batteryCharge == 10) {
	batteryCharge = @"Plug In Very Soon\n";
}

SpringBoard.prototype.toggleBattery = function()
{
		[SBAwayController.sharedAwayController playLockSound];
		power = [SBDismissOnlyAlertItem.alloc 
					initWithTitle:"Battery Information" 
					body: batteryCharge
				];
		[SBAlertItemsController.sharedInstance activateAlertItem:power];
		[power release];
}

@class SBStatusBarBatteryView
- touchesEnded:touches withEvent:event
{
	if(!SBAwayController.sharedAwayController.isLocked)
		UIApp.toggleBattery();
}
@end

@class SBStatusBarBatteryPercentageView
- touchesEnded:touches withEvent:event
{
	if(!SBAwayController.sharedAwayController.isLocked)
		UIApp.toggleBattery();
}
@end
