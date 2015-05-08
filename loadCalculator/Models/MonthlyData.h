//
//  MonthlyData.h
//  loadCalculator
//
//  Created by maojj on 5/8/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MonthlyData : NSObject

@property (nonatomic, strong) NSDate *date;
@property (nonatomic) NSUInteger monthIndex;

@property (nonatomic) double monthInterestRate;
@property (nonatomic) double principalRestBefore;
@property (nonatomic) double payment;

@property (nonatomic) double paymentPrincipal;
@property (nonatomic) double paymentInterest;

@property (nonatomic) double principalRestAfter;

@property (nonatomic) BOOL isPaymentManual;

- (instancetype)initWithMonthIndex:(NSUInteger)index
                              date:(NSDate *)date
                 monthInterestRate:(double)monthInterestRate
               principalRestBefore:(double)principalRestBefore
                           payment:(double)payment;

- (void)refreshWithPrincipalRestBefore:(double)principalRestBefore;

@end
