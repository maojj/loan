//
//  Load.h
//  loadCalculator
//
//  Created by maojj on 5/8/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Load : NSObject

@property (nonatomic) long double totalPrincipal;

@property (nonatomic) long double basicDiscout;
@property (nonatomic) long double firstInterestRate;
@property (nonatomic, strong) NSDate *startDate;
@property (nonatomic) long double defaultMonthlyPayment;

@property (nonatomic) NSUInteger monthCount;
@property (nonatomic, strong) NSArray *monthDatas;


- (void)refreshMonthDatas;

@end
