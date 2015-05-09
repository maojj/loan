//
//  Interest.h
//  loadCalculator
//
//  Created by maojj on 5/9/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Interest : NSObject

@property (nonatomic, strong) NSDate *publishDate;
@property (nonatomic, strong) NSMutableDictionary *interestDic; // 以年限为key，对应的年利率为valume

- (instancetype)initWithSimpleDateString:(NSString *)dateString;

- (void)updateInterest:(CGFloat)interes forYears:(NSInteger)years;

- (CGFloat)interestForYears:(NSInteger)years;

@end
