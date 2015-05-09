//
//  Interestparser.h
//  loadCalculator
//
//  Created by maojj on 5/9/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InterestParser : NSObject

- (instancetype)initWithXMLFileURL:(NSURL *)fileUrl;

- (NSArray *)beginParse;

@end
