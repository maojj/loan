//
//  Load.m
//  loadCalculator
//
//  Created by maojj on 5/8/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import "Load.h"
#import "MonthlyData.h"
#import "NSDate+Utilities.h"

@implementation Load

- (CGFloat)defaultMonthlyPayment {
    if (fequalzero(_defaultMonthlyPayment)) {

    }
    return _defaultMonthlyPayment;
}

- (void)refreshMonthDatas {
    if (self.monthDatas) {
        __block CGFloat lastPrincipalRest = self.totalPrincipal;
        [self.monthDatas enumerateObjectsUsingBlock:^(MonthlyData *monthData, NSUInteger idx, BOOL *stop) {
            [monthData refreshWithPrincipalRestBefore:lastPrincipalRest];
            lastPrincipalRest = monthData.principalRestAfter;
        }];
    } else {
        CGFloat lastPrincipalRest = self.totalPrincipal;
        NSMutableArray *monthDatas = [NSMutableArray arrayWithCapacity:self.monthCount];
        for (NSInteger monthIndex = 0; monthIndex < self.monthCount; monthIndex++) {
            NSDate *date = [self.startDate dateByAddingMonths:monthIndex];
            MonthlyData *monthData = [[MonthlyData alloc] initWithMonthIndex:monthIndex
                                                                        date:date
                                                           monthInterestRate:self.firstInterestRate
                                                         principalRestBefore:lastPrincipalRest
                                                                     payment:self.defaultMonthlyPayment];
            [monthDatas addObject:monthData];
            lastPrincipalRest = monthData.principalRestAfter;
        }

        [self setMonthDatas:[NSArray arrayWithArray:monthDatas]];
    }
}


@end