//
//  MonthlyData.m
//  loadCalculator
//
//  Created by maojj on 5/8/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import "MonthlyData.h"

@implementation MonthlyData

- (instancetype)initWithMonthIndex:(NSUInteger)index
                              date:(NSDate *)date
                 monthInterestRate:(double)monthInterestRate
               principalRestBefore:(double)principalRestBefore
                           payment:(double)payment {
    self = [super init];
    if (self) {
        [self setMonthIndex:index];
        [self setDate:date];
        [self setMonthInterestRate:monthInterestRate];
        [self setPayment:payment];
        [self refreshWithPrincipalRestBefore:principalRestBefore];
    }
    return self;
}

- (void)refreshWithPrincipalRestBefore:(double)principalRestBefore {
    [self setPrincipalRestBefore:principalRestBefore];

    [self setPaymentInterest:(self.principalRestBefore * self.monthInterestRate)];
    [self setPaymentPrincipal:(self.payment - self.paymentInterest)];
    [self setPrincipalRestAfter:(self.principalRestBefore - self.paymentPrincipal)];
}

@end
