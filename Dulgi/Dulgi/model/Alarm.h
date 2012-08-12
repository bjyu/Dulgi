//
//  Alarm.h
//  Dulgi
//
//  Created by Byoung Jin Yu on 12. 7. 29..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Alarm : NSObject

@property (nonatomic, strong) NSNumber *alarmId;
@property (nonatomic) Boolean isUse;
@property (nonatomic, strong) NSDate *time;
@property (nonatomic, strong) NSString *daily;
@property (nonatomic, strong) NSString *slogan;
@property (nonatomic) Boolean isUseViabration;
@property (nonatomic) Boolean isUseSound;
@property (nonatomic, strong) NSString *soundPath;
@property (nonatomic) Boolean isUseTorch;
@property (nonatomic, strong) NSString *backgroundImgPath;

-(NSString*)getTimeWithString;

@end
