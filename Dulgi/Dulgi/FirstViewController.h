//
//  FirstViewController.h
//  DeviceControlTest
//
//  Created by Byoung Jin Yu on 12. 7. 8..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController {

    IBOutlet UISwitch *swcTorch;
    IBOutlet UIDatePicker *dtpSetAlarm;

}

//@property (nonatomic, assign)UISwitch *swcTorch;


-(IBAction)touchedBtnVibration:(id)sender;
-(IBAction)switchedTorch:(id)sender;
-(IBAction)setAlarm:(id)sender;

@end
