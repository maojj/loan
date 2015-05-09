//
//  Interestparser.m
//  loadCalculator
//
//  Created by maojj on 5/9/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import "InterestParser.h"
#import "TFHpple.h"
#import "Interest.h"

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
//    NSURL *xmlurl = [NSURL URLWithString:_filePath];
//    NSData *data = [NSData dataWithContentsOfURL:xmlurl];
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"gjjdkll" ofType:@"xml"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    TFHpple *doc = [[TFHpple alloc] initWithData:data isXML:YES];
    NSArray *recordsElements = [doc searchWithXPathQuery:@"//record"];


    NSMutableDictionary *interestDic = [NSMutableDictionary dictionary];

    [recordsElements enumerateObjectsUsingBlock:^(TFHppleElement *element, NSUInteger idx, BOOL *stop) {
        NSString *dateString = [[element firstChildWithTagName:@"SXRQ"] text];
        NSInteger years = [[[element firstChildWithTagName:@"LFQX"] text] integerValue];
        CGFloat interestRate = [[[element firstChildWithTagName:@"NLL"] text] floatValue];
        if (years > 0) {
            Interest *interest = [interestDic objectForKey:dateString];
            if (!interest) {
                interest = [[Interest alloc] initWithSimpleDateString:dateString];
                if (interest) {
                    [interestDic setObject:interest forKey:dateString];
                }
            }
            [interest updateInterest:interestRate forYears:years];
        }
    }];


}

@end
