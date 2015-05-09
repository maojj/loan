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

@property (nonatomic, strong) NSURL *fileUrl;

@end

@implementation InterestParser

- (instancetype)init {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"gjjdkll" ofType:@"xml"];
    NSURL *localFileUrl = [NSURL fileURLWithPath:filePath];
    return [self initWithXMLFileURL:localFileUrl];
}

- (instancetype)initWithXMLFileURL:(NSURL *)fileUrl {
    self = [super init];
    if (self) {
        [self setFileUrl:fileUrl];
    }
    return self;
}

- (NSArray *)beginParse {
    NSData *data = [NSData dataWithContentsOfURL:_fileUrl];
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

    NSArray *interests = [interestDic allValues];
    NSArray *sortedInterests = [interests sortedArrayUsingComparator:^NSComparisonResult(Interest *obj1, Interest *obj2) {
       return [obj1.publishDate compare:obj2.publishDate];
    }];
    return sortedInterests;
}

@end
