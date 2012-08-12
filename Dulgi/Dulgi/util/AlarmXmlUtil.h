//
//  AlarmXmlUtil.h
//  Dulgi
//
//  Created by Byoung Jin Yu on 12. 7. 31..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Alarm.h"

@interface AlarmXmlUtil : NSObject <NSXMLParserDelegate> 

-(void)writeAlarm:(NSArray*)alarms;

@end
