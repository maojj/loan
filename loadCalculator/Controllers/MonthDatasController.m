//
//  MonthDatasController.m
//  loadCalculator
//
//  Created by maojj on 5/8/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import "MonthDatasController.h"
#import "Loan.h"
#import "MonthCell.h"
#import "MonthlyData.h"
#import "ChartViewController.h"

static NSString *CellIdentifer = @"monthCell";

@interface MonthDatasController ()

@property (nonatomic, strong) Loan *load;

@end

@implementation MonthDatasController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor clearColor];
    self.load = [Loan new];
    self.load.firstInterestRate = (long double)0.04 / (long double)12.0;
    self.load.totalPrincipal = 120.0 * 10000.0;
    self.load.monthCount = 360;
    self.load.startDate = [NSDate date];
//    self.load.defaultMonthlyPayment = 5492.0;

    [self.load refreshMonthDatas];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.load.monthDatas.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MonthCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifer forIndexPath:indexPath];
    MonthlyData *monthData = self.load.monthDatas[indexPath.row];
    [cell binWithMonthlyData:monthData];
    if (indexPath.row % 2 == 0 ) {
        cell.backgroundColor = [UIColor whiteColor];
    } else {
        cell.backgroundColor = UIColorFromRGB(0xF0F0F0);
    }
    
    return cell;
}

- (IBAction)charButtonPressed:(UIBarButtonItem *)sender {

}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"seg_showChart"]) {
        ChartViewController *chartVC = segue.destinationViewController;
        chartVC.loan = self.load;
    }
}


@end
