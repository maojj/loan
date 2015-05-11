//
//  ApplicationAgent.h
//  loadCalculator
//
//  Created by maojj on 5/9/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApplicationAgent : NSObject

DECLARE_SHARED_INSTANCE

/// 公布的利率，按时间顺序返回多次公布的利率
- (NSArray *)gjjInterestArray;

- (NSArray *)syInterestArray;

@end
