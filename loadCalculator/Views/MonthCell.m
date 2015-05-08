//
//  MonthCell.m
//  loadCalculator
//
//  Created by maojj on 5/8/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import "MonthCell.h"
#import "MonthlyData+ViewModel.h"

@implementation MonthCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)binWithMonthlyData:(MonthlyData *)monthData {
    self.indexLabel.text = [monthData monthIndexString];
    self.payLabel.text = [monthData paymentString];
    self.payInterestLabel.text = [monthData paymentInterestString];
    self.payPrinLabel.text = [monthData paymentPrincipalString];
    self.princLabel.text = [monthData principalRestAfterString];
}

@end
