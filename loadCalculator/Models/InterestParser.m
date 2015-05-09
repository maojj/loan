//
//  Interestparser.m
//  loadCalculator
//
//  Created by maojj on 5/9/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import "InterestParser.h"
#import "TFHpple.h"

@interface InterestParser()

@property (nonatomic, strong) NSString *filePath;

@end

@implementation InterestParser

- (instancetype)initWithXMLFilePath:(NSString *)path {
    self = [super init];
    if (self) {
        [self setFilePath:path];
    }
    return self;
}

- (void)beginParse {
    NSURL *xmlurl = [NSURL URLWithString:_filePath];
    NSData *data = [NSData dataWithContentsOfURL:xmlurl];
    TFHpple *doc = [[TFHpple alloc] initWithData:data isXML:YES];
    NSArray *recordsElements = [doc searchWithXPathQuery:@"//record"];



}

@end
