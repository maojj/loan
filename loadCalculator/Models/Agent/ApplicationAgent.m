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

- (NSArray *)interestArrayForYears:(NSUInteger)years {
    InterestParser *parser = [[InterestParser alloc] init];
    NSArray *interests = [parser beginParse];
    return interests;
}

@end
