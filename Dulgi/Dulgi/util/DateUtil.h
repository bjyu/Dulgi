//
//  DateUtil.h
//  DeviceControlTest
//
//  Created by Byoung Jin Yu on 12. 7. 15..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtil : NSObject

-(id)initWith:(NSDate *)date;

@property int year;
@property int month;
@property int day;
@property int hour;
@property int minutes;
@property int seconds;

@end

