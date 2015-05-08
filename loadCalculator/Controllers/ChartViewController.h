//
//  ChatViewController.h
//  loadCalculator
//
//  Created by maojj on 5/8/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChart.h"
#import "Loan.h"

@interface ChartViewController : UIViewController

@property (nonatomic, strong) Loan *loan;
@property (weak, nonatomic) IBOutlet PNLineChart *lineChart;

@end
