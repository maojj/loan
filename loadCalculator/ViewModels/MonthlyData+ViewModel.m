//
//  MonthlyData+ViewModel.m
//  loadCalculator
//
//  Created by maojj on 5/8/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import "MonthlyData+ViewModel.h"

@implementation MonthlyData (ViewModel)

- (NSString *)monthIndexString {
    return [NSString stringWithFormat:@"%lu", (unsigned long)self.monthIndex];
}

- (NSString *)paymentString {
    return [NSString stringWithFormat:@"%.2f", self.payment];
}

- (NSString *)paymentPrincipalString {
    return [NSString stringWithFormat:@"%.2f", self.paymentPrincipal];
}

- (NSString *)paymentInterestString {
    return [NSString stringWithFormat:@"%.2f", self.paymentInterest];
}

- (NSString *)principalRestAfterString {
    return [NSString stringWithFormat:@"%.2f", self.principalRestAfter];
}

@end
