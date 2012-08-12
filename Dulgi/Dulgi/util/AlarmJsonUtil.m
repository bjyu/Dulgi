//
//  AlarmJsonUtil.m
//  Dulgi
//
//  Created by Byoung Jin Yu on 12. 8. 12..
//  Copyright (c) 2012년 y2. All rights reserved.
//

#import "AlarmJsonUtil.h"

@implementation AlarmJsonUtil

NSString *m_filePath;

-(id)init {
    //NSDocumentDirectory
    NSString *docDirectoryPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    m_filePath = [docDirectoryPath stringByAppendingFormat:@"/%@",@"alarms.json"];
    return [super init];
}

-(void)writeToFile:(NSDictionary*)jsonDic {
    [jsonDic writeToFile:m_filePath atomically:YES];
}

-(NSDictionary*)readFromFile {
    NSDictionary *jsonDic;
    @try {
        
        NSString *jsonString = [NSString stringWithContentsOfFile:m_filePath encoding:NSUTF8StringEncoding error:nil];
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:kNilOptions error:&err ];
        
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.debugDescription);
    }
    @finally {
        return jsonDic;
    }
    
}
@end
