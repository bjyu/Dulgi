//
//  DeviceControlTestTests.m
//  DeviceControlTestTests
//
//  Created by Byoung Jin Yu on 12. 7. 8..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import "DulgiTests.h"
#import "AlarmXmlUtil.h"
#import "Alarm.h"
#import "AlarmJsonUtil.h"

@implementation DulgiTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

//- (void)testExample
//{
//    STFail(@"Unit tests are not implemented yet in DeviceControlTestTests");
//}

-(void)testAlarmXml {
    AlarmXmlUtil *xmlTest = [[AlarmXmlUtil alloc]init];
    Alarm *alarm = [[Alarm alloc]init];
    NSMutableArray *alarms = [[NSMutableArray alloc]init];
    [alarms addObject:alarm];
    [xmlTest writeAlarm:alarms];
    
}

-(void)testAlarmJsonUtil {
    //AlarmJsonUtil *util = [[AlarmJsonUtil alloc]init];
    
}

-(void)testAlarmJson {

    NSString *jsonExString = @"{ \"Alarms\" :"
                                "[ {\"id\" : \"111111\", "
                                "\"time\" : \"222222.22222\", "
                                "\"slogan\" : \"No Pain No Gain\" },"
                                "{\"id\" : \"222222\", "
                                "\"time\" : \"3333333.33333\", "
                                "\"slogan\" : \"No Gain Get Nothing\" }]"

                              "}";

    
    NSData *jsonData = [jsonExString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&err ];
    
    for (NSDictionary *dic in [jsonDic objectForKey:@"Alarms"]) {
        NSLog(@"%@", [dic objectForKey:@"id"]);
    }
//    NSLog(@"%@",[[jsonDic objectForKey:@"Alarms"] objectForKey:@"id"]);
    
//    STAssertTrue([[jsonDic objectForKey:@"who"] isEqualToString:@"B.J.Yu"], @"Success" );
    
    
    //NSDictionary *dictFromFile = [NSDictionary dictionaryWithContentsOfFile:dictPath];
}

@end
