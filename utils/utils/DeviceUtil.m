//
//  DeviceUtil.m
//  util
//
//  Created by Byoung Jin Yu on 12. 7. 24..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import "DeviceUtil.h"
#import "AudioToolbox/AudioServices.h"
#import <AVFoundation/AVFoundation.h>

@implementation DeviceUtil


+(void)turnTorch:(bool)isOn {
    Class captureDeviceClass = NSClassFromString(@"AVCaptureDevice");
    if (captureDeviceClass != nil) {
        
        AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        
        if ([device hasTorch] && [device hasFlash]) {
        
            [device lockForConfiguration:nil];
        
            if (isOn) {
                [device setTorchMode:AVCaptureTorchModeOn];
                [device setFlashMode:AVCaptureFlashModeOn];
            } else {
                [device setTorchMode:AVCaptureTorchModeOff];
                [device setFlashMode:AVCaptureFlashModeOff];
            }
        
            [device unlockForConfiguration];
        }
        
    }
}

+(void)turnVibration:(bool)isOn {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

+(void)turnSound:(bool)isOn {
    NSString *defaultSoundPath;
    [self turnSound:isOn withPath:defaultSoundPath];
}


+(void)turnSound:(bool)isOn withPath:(NSString*)path {
    
}

@end
