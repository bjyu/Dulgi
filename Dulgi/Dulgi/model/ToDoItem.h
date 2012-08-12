//
//  ToDoItem.h
//  DeviceControlTest
//
//  Created by Byoung Jin Yu on 12. 7. 15..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDoItem : NSObject

{
    NSInteger year;
    NSInteger month;
    NSInteger day;
    NSInteger hour;
    NSInteger minute;
    NSInteger second;
    NSString *eventName;
}

@property (nonatomic, readwrite) NSInteger year;
@property (nonatomic, readwrite) NSInteger month;
@property (nonatomic, readwrite) NSInteger day;
@property (nonatomic, readwrite) NSInteger hour;
@property (nonatomic, readwrite) NSInteger minute;
@property (nonatomic, readwrite) NSInteger second;
@property (nonatomic, copy) NSString *eventName;

@end