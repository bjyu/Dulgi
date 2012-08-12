//
//  FirstViewController.m
//  DeviceControlTest
//
//  Created by Byoung Jin Yu on 12. 7. 8..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import "FirstViewController.h"
#import "ToDoItem.h"
#import "DateUtil.h"
#import "DeviceUtil.h"
#import "AppDelegate.h"


#define ToDoItemKey @"EVENT_KEY1"

@interface FirstViewController ()

@end

@implementation FirstViewController
UILocalNotification *localNotif;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view, typically from a nib.
    // AudioServicesPlaySystemSound(kSystemSoundID_Vibrate)
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    appDelegate.currentViewController = self;
    
    dtpSetAlarm.timeZone = [NSTimeZone localTimeZone];
}

-(void)alarmGoOffWithinFiveSecs {
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    localNotif.timeZone = [NSTimeZone localTimeZone];
    
//    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
//    NSTimeZone *tz = [NSTimeZone timeZoneWithName:@"Asia/Seoul"];
//    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
//    [dateFormatter setTimeZone:tz];


    NSDate *now = [NSDate date];
    NSNumber *a = [NSNumber numberWithDouble:[now timeIntervalSince1970]];
    NSLog(@"%@",[a stringValue]);
    
//    NSString *nowString = [NSString stringWithFormat:@"%@", now];
//    now = [dateFormatter dateFromString:nowString];
//    NSDate *targetDt = [now dateByAddingTimeInterval:(9*60*60+5)];
    NSDate *targetDt = [now dateByAddingTimeInterval:5];
    localNotif.fireDate = targetDt;
    NSLog(@"%@", [NSString stringWithFormat:@"%@", localNotif.fireDate ]);
    
    localNotif.alertBody = [NSString stringWithFormat:NSLocalizedString(@"%@ : Alarm Go Off.", nil),
                                                                        @"Test01"];
    localNotif.alertAction = NSLocalizedString(@"View Details", nil);
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
//    localNotif.applicationIconBadgeNumber = 1;
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"Alarm01" forKey:ToDoItemKey];
    localNotif.userInfo = infoDict;
    
//    localNotif.hasAction = YES;
//    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotif];
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
//    [self showSettingDateAlert:targetDt];
    
//    [[UIApplication sharedApplication] ];
}

- (void)scheduleNotificationWithItem:(NSDate*)itemDate { //:(int)minutesBefore {
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    
//    //target date
//    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
//    [dateComps setTimeZone:[NSTimeZone localTimeZone]];
//    [dateComps setDay:item.day];
//    [dateComps setMonth:item.month];
//    [dateComps setYear:item.year];
//    [dateComps setHour:item.hour];
//    [dateComps setMinute:item.minute];
////    [dateComps setSecond:item.second];
//    NSDate *itemDate = [calendar dateFromComponents:dateComps];

    //deprecated [dateComps release];
    
    
    // local notification
    localNotif = [[UILocalNotification alloc] init];
    //localNotif.timeZone = [NSTimeZone localTimeZone];
    
    localNotif.fireDate = itemDate;
    NSLog(@"%@", [NSString stringWithFormat:@"%@", localNotif.fireDate ]);
    
    localNotif.alertBody = [NSString stringWithFormat:NSLocalizedString(@"@ : Alarm Go Off.",
                            item.eventName)];
    localNotif.alertAction = NSLocalizedString(@"View Details", nil);
    
    localNotif.soundName = UILocalNotificationDefaultSoundName;
//    localNotif.applicationIconBadgeNumber = 1;
    
    NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"Alarm01" forKey:ToDoItemKey];
    localNotif.userInfo = infoDict;
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotif];
    //deprecated [localNotif release];
    

}

-(IBAction)switchedTorch:(id)sender {
//    UISwitch *swcTorch = (UISwitch)sender;
    
    if(swcTorch.on) {
        [DeviceUtil turnTorch:true];
        NSLog(@"torchOn");
    }
    else {
        [DeviceUtil turnTorch:false];
        NSLog(@"torchOff");
    }
    
    //NSLog(m_swcTorch.state);
}

-(IBAction)touchedBtnVibration:(id)sender {
    
    [DeviceUtil turnVibration:true];
    UIAlertView *vi = [[UIAlertView alloc] initWithTitle:@"" 
                                                 message:@""
                                                delegate:self
                                       cancelButtonTitle:nil
                                       otherButtonTitles:@"확인", nil ];
    [vi setTag:7002];
    [vi show];
     
}

-(IBAction)setAlarm:(id)sender {
    
    [self alarmGoOffWithinFiveSecs];
    return;
    
    ToDoItem *alarmItem = [[ToDoItem alloc] init];
    NSDate *targetDate = [dtpSetAlarm.date dateByAddingTimeInterval:(9*60*60)];
    
    NSString *dateString = [NSString stringWithFormat:@"%@", targetDate];
    NSLog(@"datePicker date : %@",dateString);
    
    DateUtil *dtUtil = [[DateUtil alloc]initWith:targetDate];
    
    
//    NSDateFormatter *dtFormatter = [[NSDateFormatter alloc]init];
    alarmItem.year = dtUtil.year;
    alarmItem.month = dtUtil.month;
    alarmItem.day = dtUtil.day;
    alarmItem.hour = dtUtil.hour;
    alarmItem.minute = dtUtil.minutes;
    alarmItem.second = dtUtil.seconds;
    alarmItem.eventName = @"test1";
    
    [self scheduleNotificationWithItem:targetDate];
    
    //NSString *fireString = [NSString stringWithFormat:@"A notification will show at %@", targetDate];
    
    
}

-(void)showSettingDateAlert:(NSDate*)date {
    NSString *fireString = [NSString stringWithFormat:@"A notification will show at %@", date];
    
    UIAlertView *fireTime = [[UIAlertView alloc] initWithTitle:@"Notification Set" message:fireString delegate:nil cancelButtonTitle:@"Set Alarm" otherButtonTitles:nil, nil];
    [fireTime show];

}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch ([alertView tag]) {
        case 7002:
            NSLog(@"7002");
            break;
    }
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
