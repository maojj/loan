//
//  InterestViewController.m
//  loadCalculator
//
//  Created by maojj on 5/9/15.
//  Copyright (c) 2015 maojjdev. All rights reserved.
//

#import "InterestViewController.h"
#import "ApplicationAgent.h"
#import "PNChart.h"
#import "Interest.h"
#import "NSDate+Utilities.h"

@interface InterestViewController ()

@property (nonatomic, strong) NSArray *gjjInterests;
@property (nonatomic, strong) NSArray *syInterests;
@property (nonatomic, assign) NSUInteger years;

@end

@implementation InterestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.years = 30;
    self.gjjInterests = [[ApplicationAgent sharedInstance] gjjInterestArray];
    self.syInterests = [[ApplicationAgent sharedInstance] syInterestArray];

    PNLineChart *lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    [self.view addSubview:lineChart];

    lineChart.showCoordinateAxis = YES;
    lineChart.showGenYLabels = YES;
    lineChart.showLabel = YES;
    lineChart.xUnit = @"时间";
    lineChart.yUnit = @"利率";
    lineChart.yFixedValueMin = 0.0;
    lineChart.yFixedValueMax = 0.1;

    [lineChart setXLabels:[self getLabels]];
    [lineChart setYLabels:@[@"0", @"1%", @"2%", @"3%", @"4%", @"5%", @"6%", @"7%", @"8%", @"9%", @"10%"]];


    PNLineChartData *gjjData5 = [self lineChartForYears:5 interestArray:self.gjjInterests];
    gjjData5.color = PNPinkDark;
    gjjData5.dataTitle = @"公积金（1-5年）";
    gjjData5.inflexionPointStyle = PNLineChartPointStyleTriangle;

    PNLineChartData *gjjData30 = [self lineChartForYears:30 interestArray:self.gjjInterests];
    gjjData30.color = PNLightBlue;
    gjjData30.dataTitle = @"公积金（6-30年）";
    gjjData30.inflexionPointStyle = PNLineChartPointStyleTriangle;

    PNLineChartData *syData5 = [self lineChartForYears:5 interestArray:self.syInterests];
    syData5.color = PNYellow;
    syData5.dataTitle = @"商业（1-5年）";
    syData5.inflexionPointStyle = PNLineChartPointStyleSquare;

    PNLineChartData *syData30 = [self lineChartForYears:30 interestArray:self.syInterests];
    syData30.color = PNGreen;
    syData30.dataTitle = @"商业（6-30年）";
    syData30.inflexionPointStyle = PNLineChartPointStyleTriangle;




    lineChart.chartData = @[gjjData5, gjjData30, syData5, syData30];
    [lineChart strokeChart];

    lineChart.hasLegend = YES;
    lineChart.legendStyle = PNLegendItemStyleStacked;
    lineChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    lineChart.legendFontColor = [UIColor redColor];

    UIView *legend = [lineChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(self.view.frame.size.width - 200, 64, 200, legend.frame.size.height)];
    [self.view addSubview:legend];
    
}

- (NSArray *)getLabels {
    NSMutableArray *arrays = [NSMutableArray arrayWithCapacity:self.gjjInterests.count];
    [self.gjjInterests enumerateObjectsUsingBlock:^(Interest *interest, NSUInteger idx, BOOL *stop) {
        if (idx % 5 == 0) {
            [arrays addObject:[interest.publishDate stringWithFormat:@"yyyy-MM-dd"]];
        }
    }];
    return arrays;
}

- (NSArray *)dataArrayForYears:(NSUInteger)years interests:(NSArray *)interests {
    NSMutableArray *arrays = [NSMutableArray arrayWithCapacity:self.gjjInterests.count];
    [interests enumerateObjectsUsingBlock:^(Interest *interest, NSUInteger idx, BOOL *stop) {
        [arrays addObject:[interest.interestDic objectForKey:@(years)]];
    }];
    return arrays;
}

- (PNLineChartData *)lineChartForYears:(NSUInteger)years interestArray:(NSArray *)interests{
    NSArray * data01Array = [self dataArrayForYears:years interests:interests];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.alpha = 0.3f;
    data01.itemCount = data01Array.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    return data01;
}

@end
