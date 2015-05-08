//
//  ChatViewController.m
//  loadCalculator
//
//  Created by maojj on 5/8/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import "ChartViewController.h"
#import "MonthlyData+ViewModel.h"

@interface ChartViewController ()

@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupUI];
}

- (void)setupUI {
    PNLineChart *lineChart = self.lineChart;
    lineChart.showCoordinateAxis = YES;
    lineChart.showGenYLabels = YES;
    lineChart.showLabel = YES;
    lineChart.xUnit = @"期数";
    lineChart.yUnit = @"元";

    [lineChart setXLabels:[self getLabels]];

    NSArray * data01Array = [self getPayPrinDataArray];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.dataTitle = @"Alpha";
    data01.color = PNFreshGreen;
    data01.alpha = 0.3f;
    data01.itemCount = data01Array.count;
    data01.inflexionPointStyle = PNLineChartPointStyleCircle;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };

    // Line Chart #2
    NSArray * data02Array = [self getPayInterestDataArray];
    PNLineChartData *data02 = [PNLineChartData new];
    data02.dataTitle = @"Beta Beta Beta Beta";
    data02.color = PNRed;
    data02.alpha = 0.5f;
    data02.itemCount = data02Array.count;
    data02.inflexionPointStyle = PNLineChartPointStyleCircle;
    data02.getData = ^(NSUInteger index) {
        CGFloat yValue = [data02Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };

    self.lineChart.chartData = @[data01, data02];
    [self.lineChart strokeChart];

//    [self.view addSubview:self.lineChart];
//
//    self.lineChart.legendStyle = PNLegendItemStyleStacked;
//    self.lineChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
//    self.lineChart.legendFontColor = [UIColor redColor];
//
//    lineChart.chartData = @[data01];
//    [lineChart strokeChart];
}

- (NSArray *)getLabels {
    NSMutableArray *labels = [NSMutableArray arrayWithCapacity:self.loan.monthDatas.count];

    [self.loan.monthDatas enumerateObjectsUsingBlock:^(MonthlyData *monthData, NSUInteger idx, BOOL *stop) {
        if (idx % 12 == 0) {
            NSString *label = [monthData monthIndexString];
            [labels addObject:label];
        }
    }];
    return labels;
}

- (NSArray *)getRestPrinDataArray {
    NSMutableArray *datas = [NSMutableArray arrayWithCapacity:self.loan.monthDatas.count];
    [self.loan.monthDatas enumerateObjectsUsingBlock:^(MonthlyData *monthData, NSUInteger idx, BOOL *stop) {
        if (idx % 12 == 0) {
        [datas addObject:@((CGFloat)monthData.principalRestAfter)];
        }
    }];
    return datas;
}

- (NSArray *)getPayPrinDataArray {
    NSMutableArray *datas = [NSMutableArray arrayWithCapacity:self.loan.monthDatas.count];
    [self.loan.monthDatas enumerateObjectsUsingBlock:^(MonthlyData *monthData, NSUInteger idx, BOOL *stop) {
        if (idx % 12 == 0) {

        [datas addObject:@((CGFloat)monthData.paymentPrincipal)];
        }
    }];
    return datas;
}

- (NSArray *)getPayInterestDataArray {
    NSMutableArray *datas = [NSMutableArray arrayWithCapacity:self.loan.monthDatas.count];
    [self.loan.monthDatas enumerateObjectsUsingBlock:^(MonthlyData *monthData, NSUInteger idx, BOOL *stop) {
        if (idx % 12 == 0) {

        [datas addObject:@((CGFloat)monthData.paymentInterest)];
        }
    }];
    return datas;
}


@end
