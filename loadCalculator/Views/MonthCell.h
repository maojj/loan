//
//  MonthCell.h
//  loadCalculator
//
//  Created by maojj on 5/8/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MonthlyData.h"


@interface MonthCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *indexLabel;
@property (weak, nonatomic) IBOutlet UILabel *payLabel;
@property (weak, nonatomic) IBOutlet UILabel *payInterestLabel;
@property (weak, nonatomic) IBOutlet UILabel *payPrinLabel;
@property (weak, nonatomic) IBOutlet UILabel *princLabel;


- (void)binWithMonthlyData:(MonthlyData *)monthData;


@end
