//
//  Macros.h
//  loadCalculator
//
//  Created by maojj on 5/8/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#ifndef loadCalculator_Macros_h
#define loadCalculator_Macros_h

#define fequal(a,b) (fabs((a) - (b)) < FLT_EPSILON)
#define fequalzero(a) (fabs(a) < FLT_EPSILON)
#define flessthan(a,b) (fabs(a) < fabs(b)+FLT_EPSILON)


#define UIColorFromRGB(rgbValue) \
[UIColor colorWithRed : ((float)(((rgbValue) & 0xFF0000) >> 16)) / 255.0 \
green : ((float)(((rgbValue) & 0xFF00) >> 8)) / 255.0 \
blue : ((float)((rgbValue) & 0xFF)) / 255.0 \
alpha : 1.0]

#define UIColorFromRGBA(rgbValue, alphaValue) \
[UIColor colorWithRed : ((float)(((rgbValue) & 0xFF0000) >> 16)) / 255.0 \
green : ((float)(((rgbValue) & 0xFF00) >> 8)) / 255.0 \
blue : ((float)((rgbValue) & 0xFF)) / 255.0 \
alpha : (alphaValue)]


#endif
