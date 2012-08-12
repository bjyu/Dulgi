//
//  DateUtil.m
//  DeviceControlTest
//
//  Created by Byoung Jin Yu on 12. 7. 15..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import "DateUtil.h"

@implementation DateUtil

@synthesize year, month, day, hour, minutes, seconds;

-(id)initWith:(NSDate *)date {
    
    NSDateComponents *comp = [[NSCalendar currentCalendar] components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSWeekCalendarUnit | NSWeekdayCalendarUnit | NSWeekdayOrdinalCalendarUnit | NSQuarterCalendarUnit fromDate:date];
    
//    NSInteger era = [comp era];    
    NSInteger y = [comp year]; NSInteger m = [comp month]; NSInteger d = [comp day]; NSInteger h = [comp hour]; NSInteger mm = [comp minute]; NSInteger s = [comp second];
//    NSInteger week = [comp week];
//    NSInteger weekday = [comp weekday];
//    NSInteger weekdayOrdinal = [comp weekdayOrdinal];
//    NSInteger quarter = [comp quarter];

    year = y;
    month = m;
    day = d;
    hour = h;
    minutes = mm;
    seconds = s;

    return [super init];
}
//
//-(int)getYear {
//    return 0;
//}
//
//-(int)getDay {
//    
//    return 0;
//}
//
//-(int)getMonth {
//    return 0;
//}
//
//-(int)getHour{
//    return 0;
//}
//
//-(int)getMinutes {
//    return 0;
//}
//
//-(int)getSeconds {
//    return 0;
//}


@end
