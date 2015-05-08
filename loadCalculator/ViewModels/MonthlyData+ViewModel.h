//
//  MonthlyData+ViewModel.h
//  loadCalculator
//
//  Created by maojj on 5/8/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import "MonthlyData.h"

@interface MonthlyData (ViewModel)

- (NSString *)monthIndexString;

- (NSString *)paymentString;
- (NSString *)paymentPrincipalString;
- (NSString *)paymentInterestString;
- (NSString *)principalRestAfterString;


#pragma mark - chart


@end
