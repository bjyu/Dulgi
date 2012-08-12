//
//  Alarms.h
//  Dulgi
//
//  Created by Byoung Jin Yu on 12. 7. 30..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Alarm.h"
@interface Alarms : NSMutableDictionary


-(void)addAlarm:(Alarm*)alarm;
-(void)deleteAlarm:(Alarm*)alarm;
-(void)saveAlarms;
-(void)loadAlarms;

@end

