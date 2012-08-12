//
//  DeviceUtil.h
//  utils
//
//  Created by Byoung Jin Yu on 12. 7. 24..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceUtil : NSObject

+(void)turnTorch:(bool)isOn;
+(void)turnVibration:(bool)isOn;
+(void)turnSound:(bool)isOn;
+(void)turnSound:(bool)isOn withPath:(NSString*)path;
@end
