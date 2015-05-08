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

@property (nonatomic) long double monthInterestRate;
@property (nonatomic) long double principalRestBefore;
@property (nonatomic) long double payment;

@property (nonatomic) long double paymentPrincipal;
@property (nonatomic) long double paymentInterest;

@property (nonatomic) long double principalRestAfter;

@property (nonatomic) BOOL isPaymentManual;

- (instancetype)initWithMonthIndex:(NSUInteger)index
                              date:(NSDate *)date
                 monthInterestRate:(long double)monthInterestRate
               principalRestBefore:(long double)principalRestBefore
                           payment:(long double)payment;

- (void)refreshWithPrincipalRestBefore:(long double)principalRestBefore;

@end
