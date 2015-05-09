//
//  Interest.m
//  loadCalculator
//
//  Created by maojj on 5/9/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import "Interest.h"

@implementation Interest

- (NSMutableDictionary *)interestDic {
    if (!_interestDic) {
        _interestDic = [NSMutableDictionary dictionaryWithCapacity:30];
    }
    return _interestDic;
}

- (instancetype)initWithSimpleDateString:(NSString *)dateString {
    self = [super init];
    if (self) {
        static NSDateFormatter *formatter;
        if (formatter == nil) {
            formatter = [[NSDateFormatter alloc] init];
            [formatter setTimeZone:[NSTimeZone defaultTimeZone]];
            [formatter setDateFormat:@"yyyy-MM-dd"];
        }
        NSDate *publishDate = [formatter dateFromString:dateString];
        [self setPublishDate:publishDate];
    }
    return self;
}

- (void)updateInterest:(CGFloat)interes forYears:(NSInteger)years {
    [self.interestDic setObject:@(interes) forKey:@(years)];
}

- (CGFloat)interestForYears:(NSInteger)years {
    return [self.interestDic[@(years)] floatValue];
}

@end
