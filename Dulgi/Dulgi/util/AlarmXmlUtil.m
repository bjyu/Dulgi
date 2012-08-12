//
//  AlarmXmlUtil.m
//  Dulgi
//
//  Created by Byoung Jin Yu on 12. 7. 31..
//  Copyright (c) 2012년 MiracomInc. All rights reserved.
//

#import "AlarmXmlUtil.h"
#import "Alarm.h"
//#import <libxml/xmlsave.h>

@implementation AlarmXmlUtil

NSString *mXmlString = @"";

-(id)init {
    return [super init];
}

-(void)writeAlarm:(NSArray*)alarms {
//    NSData *xmlData;
//    NSXMLDocument *XmlDoc;
//    NSString *xmlString = @"<dulgi ver=\"1.0\">";
  
    mXmlString = @"<dulgi ver=\"1.0\">";
    
    for (Alarm *alarm in alarms) {
    
        NSString *attrStrings = [self getAttributeFormat:@"id" value:[alarm.alarmId stringValue]];
        attrStrings = [attrStrings stringByAppendingString:[self getAttributeFormat:@"use" value:[self boolToString:alarm.isUse]]];
        
        NSString *innerXml = @"";
        innerXml = [innerXml stringByAppendingString:[self getTagFormat:@"time" value:[alarm getTimeWithString]]];
        innerXml = [innerXml stringByAppendingString:[self getTagFormat:@"daily" value:[alarm daily]]];
        innerXml = [innerXml stringByAppendingString:[self getTagFormat:@"slogan" value:[alarm slogan]]];
        
        innerXml = [innerXml stringByAppendingString:[self getTagFormat:@"vibration" value:@"" attrs:[self getAttributeFormatOfUse:alarm.isUseViabration]]];
        
        innerXml = [innerXml stringByAppendingString:[self getTagFormat:@"sound" value:[self getTagFormat:@"path" value:alarm.soundPath] attrs:[self getAttributeFormatOfUse:alarm.isUseSound]] ];
        innerXml = [innerXml stringByAppendingString:[self getTagFormat:@"torch" value:@"" attrs:[self getAttributeFormatOfUse:alarm.isUseTorch]]];
        
        
        mXmlString = [mXmlString stringByAppendingString:[self getTagFormat:@"alarm" value:innerXml attrs:attrStrings]];
    
    }
    
    mXmlString = [mXmlString stringByAppendingString:@"</dulgi>"];
    
    
    NSLog(@"%@", mXmlString);
    
    //append in ~
}

-(NSString*)boolToString:(Boolean)b {
    return (b ? @"1" : @"0");
}

-(NSString*)getAttributeFormatOfUse:(Boolean)b {
    return [self getAttributeFormat:@"use" value:[self boolToString:b]];
}

-(NSString*)getTagFormat:(NSString*)tag value:(NSString*)value attrs:(NSString*)attrs{
    NSString *tagFormat = [NSString stringWithFormat:@"<%@%@>%@</%@>", tag, attrs, value, tag];
//    [mXmlString stringByAppendingString:tagFormmat];
    return tagFormat;
}

-(NSString*)getTagFormat:(NSString*)tag value:(NSString*)value {
    NSString *tagFormat = [NSString stringWithFormat:@"<%@>%@</%@>", tag, value, tag];
    //    [mXmlString stringByAppendingString:tagFormmat];
    return tagFormat;
}

-(NSString*)getAttributeFormat:(NSString*)attrName value:(NSString*)value{
    NSString *attrString = [NSString stringWithFormat:@" %@=\"%@\"", attrName, value];
    return attrString;
}    


-(NSArray*)parse:(NSString*)xml {
    
    return nil;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    
//    if([elementName isEqualToString:@"Books"]) {
//        //Initialize the array.
//        appDelegate.books = [[NSMutableArray alloc] init];
//    }
//    else if([elementName isEqualToString:@"Book"]) {
//        
//        //Initialize the book.
//        aBook = [[Book alloc] init];
//        
//        //Extract the attribute here.
//        aBook.bookID = [[attributeDict objectForKey:@"id"] integerValue];
//        
//        NSLog(@"Reading id value :%i", aBook.bookID);
//    }
//    
//    NSLog(@"Processing Element: %@", elementName);
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
//    if(!currentElementValue)
//        currentElementValue = [[NSMutableString alloc] initWithString:string];
//    else
//        [currentElementValue appendString:string];
//    
//    NSLog(@"Processing Value: %@", currentElementValue);
    
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    
//    if([elementName isEqualToString:@"Books"])
//        return;
//    
//    //There is nothing to do if we encounter the Books element here.
//    //If we encounter the Book element howevere, we want to add the book object to the array
//    // and release the object.
//    if([elementName isEqualToString:@"Book"]) {
//        [appDelegate.books addObject:aBook];
//        
//        [aBook release];
//        aBook = nil;
//    }
//    else
//        [aBook setValue:currentElementValue forKey:elementName];
//    
//    [currentElementValue release];
//    currentElementValue = nil;
}

@end
