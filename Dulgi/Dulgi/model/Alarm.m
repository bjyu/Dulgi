//
//  Alarm.m
//  Dulgi
//
//  Created by Byoung Jin Yu on 12. 7. 29..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import "Alarm.h"

@implementation Alarm

@synthesize alarmId, isUse, time, daily, slogan, isUseViabration, isUseSound, isUseTorch, soundPath, backgroundImgPath;

-(id)init{
    alarmId = [NSNumber numberWithDouble:[[NSDate date] timeIntervalSince1970]];
    isUse = true;
    time = [NSDate date];
    daily = @"0,1,2,3,4,5,6";
    slogan = @"";
    isUseViabration = true;
    isUseSound = true;
    isUseTorch = true;
    backgroundImgPath = @"";
    soundPath = @"";
    return [super init];
}

-(NSString*)getTimeWithString {
    NSNumber *timeInterval = [NSNumber numberWithDouble:[self.time timeIntervalSince1970]];
    return [timeInterval stringValue];
}

@end
