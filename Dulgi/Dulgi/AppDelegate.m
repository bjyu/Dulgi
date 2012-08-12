//
//  AppDelegate.m
//  DeviceControlTest
//
//  Created by Byoung Jin Yu on 12. 7. 8..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import "AppDelegate.h"
#import "DeviceUtil.h"
#import "SecondViewController.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize currentViewController;



- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //application.applicationIconBadgeNumber = 0;
    
    // Handle launching from a notification
    UILocalNotification *localNotif =
        [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (localNotif) {
        NSLog(@"Recieved Notification %@",localNotif);
    }
    
   [application setApplicationIconBadgeNumber:0];
    
    //NSDocumentDirectory
    NSString *ss = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"%@", ss);
    


    return YES;
}

							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    NSLog(@"applicationWillEnterForeground");
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)app didReceiveLocalNotification:(UILocalNotification *)notif {
    // Handle the notificaton when the app is running
    NSLog(@"Recieved Notification %@",notif);
    
//    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Launched with Options" 
//                                                    message:@"Incoming notification in running app" 
//                                                   delegate:self cancelButtonTitle:@"Ok" 
//                                          otherButtonTitles:nil];
//    [alert show];

    [DeviceUtil turnTorch:true];
    [DeviceUtil turnVibration:true];
    
    
//    if (_currentViewController)
//        _window.rootViewController = _currentViewController;
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard"
                                                             bundle: nil];
    
    SecondViewController *controller = (SecondViewController*)[mainStoryboard 
                                                       instantiateViewControllerWithIdentifier: @"SecondViewController"];
    _window.rootViewController = controller;
   
    
//    NSLog(@"Incoming notification in running app");
    
    // Access the payload content
//    NSLog(@"Notification payload: %@", [notif.userInfo objectForKey:@"payload"]);     
}

@end
