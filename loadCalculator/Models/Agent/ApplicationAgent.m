//
//  ApplicationAgent.m
//  loadCalculator
//
//  Created by maojj on 5/9/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import "ApplicationAgent.h"
#import "Interestparser.h"

@implementation ApplicationAgent

IMPLEMENT_SHARED_INSTANCE

- (NSArray *)gjjInterestArray {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sydkll" ofType:@"xml"];
    NSURL *localFileUrl = [NSURL fileURLWithPath:filePath];
    InterestParser *parser = [[InterestParser alloc] initWithXMLFileURL:localFileUrl];
    NSArray *interests = [parser beginParse];
    return interests;
}

- (NSArray *)syInterestArray {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"gjjdkll" ofType:@"xml"];
    NSURL *localFileUrl = [NSURL fileURLWithPath:filePath];
    InterestParser *parser = [[InterestParser alloc] initWithXMLFileURL:localFileUrl];
    NSArray *interests = [parser beginParse];
    return interests;
}

@end
