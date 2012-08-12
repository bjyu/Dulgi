//
//  Alarms.m
//  Dulgi
//
//  Created by Byoung Jin Yu on 12. 7. 30..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import "Alarms.h"
#import "Alarm.h"

@implementation Alarms

-(void)addAlarm:(Alarm*)alarm {
    [self setValue:alarm forKey:[alarm.alarmId stringValue]];
}

-(void)deleteAlarm:(Alarm*)alarm {
    [self deleteAlarmWithId:[alarm.alarmId stringValue]];
}

-(void)deleteAlarmWithId:(NSString*)alarmId {
    [self removeObjectForKey:alarmId];
}
    
-(void)saveAlarms {
    if (self) {
        for (Alarm *alarm in [self allValues]) {

        }
    }
}

-(void)loadAlarms {

}

@end
