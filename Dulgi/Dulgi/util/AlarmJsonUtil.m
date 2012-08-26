//
//  AlarmJsonUtil.m
//  Dulgi
//
//  Created by Byoung Jin Yu on 12. 8. 12..
//  Copyright (c) 2012년 y2. All rights reserved.
//

#import "AlarmJsonUtil.h"
#import "Alarm.h"

@implementation AlarmJsonUtil

NSString *m_filePath;
NSDictionary *m_alarms;

-(id)init {
    //NSDocumentDirectory
    NSString *docDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    m_filePath = [docDirectoryPath stringByAppendingFormat:@"/%@",@"alarms.json"];
    [self loadAlarms];
    return [super init];
}

-(void)saveAlarms {
    [m_alarms writeToFile:m_filePath atomically:YES];
}

-(void)loadAlarms {
    @try {
        
        NSString *jsonString = [NSString stringWithContentsOfFile:m_filePath encoding:NSUTF8StringEncoding error:nil];
        if (!jsonString) jsonString = @"{Alarms:[]}";
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        m_alarms = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&err ];
        
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.debugDescription);
    }

}

-(void)addAlarm:(Alarm*)alarm {
    NSDictionary *alarmJson = [[NSDictionary alloc]init];
    [alarmJson setValue:alarm.alarmId forKey:@"id"];
    [alarmJson setValue:[NSNumber numberWithBool:alarm.isUse] forKey:@"isUse"];
    [alarmJson setValue:alarm.alarmId forKey:@"id"];
    [alarmJson setValue:alarm.alarmId forKey:@"id"];
    [alarmJson setValue:alarm.alarmId forKey:@"id"];
    [alarmJson setValue:alarm.alarmId forKey:@"id"];
    [alarmJson setValue:alarm.alarmId forKey:@"id"];
    [alarmJson setValue:alarm.alarmId forKey:@"id"];
    [alarmJson setValue:alarm.alarmId forKey:@"id"];
    [alarmJson setValue:alarm.alarmId forKey:@"id"];
    
}

-(NSDictionary*)findAlarmById:(NSString*)alarmId {
    for (NSDictionary *alarm in m_alarms) {
        if ([[alarm objectForKey:@"id"] isEqualToString:alarmId]) {
            return alarm;
        }
    }
    return nil;
}

@end
