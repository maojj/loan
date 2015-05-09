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

@property (nonatomic, strong) NSArray *interests;
@property (nonatomic, assign) NSUInteger years;

@end

@implementation InterestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.years = 30;
    self.interests = [[ApplicationAgent sharedInstance] interestArrayForYears:self.years];

    PNLineChart *lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    [self.view addSubview:lineChart];

    lineChart.showCoordinateAxis = YES;
    lineChart.showGenYLabels = YES;
    lineChart.showLabel = YES;
    lineChart.xUnit = @"时间";
    lineChart.yUnit = @"利率";
    lineChart.yFixedValueMin = 0.0;
    lineChart.yFixedValueMax = 0.08;

    [lineChart setXLabels:[self getLabels]];
    [lineChart setYLabels:@[@"0", @"1%", @"2%", @"3%", @"4%", @"5%", @"6%", @"7%", @"8%"]];


    PNLineChartData *data01 = [self lineChartForYears:1];
    PNLineChartData *data03 = [self lineChartForYears:2];
    PNLineChartData *data05 = [self lineChartForYears:3];
    PNLineChartData *data10 = [self lineChartForYears:4];
    PNLineChartData *data20 = [self lineChartForYears:5];
    PNLineChartData *data30 = [self lineChartForYears:30];

    lineChart.chartData = @[data01, data03, data05, data10, data20, data30];
    [lineChart strokeChart];

    lineChart.hasLegend = YES;
    lineChart.legendStyle = PNLegendItemStyleStacked;
    lineChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    lineChart.legendFontColor = [UIColor redColor];

    UIView *legend = [lineChart getLegendWithMaxWidth:100];
    [legend setFrame:CGRectMake(self.view.frame.size.width - 100, 64, 100, legend.frame.size.height)];
    [self.view addSubview:legend];
    
}

- (NSArray *)getLabels {
    NSMutableArray *arrays = [NSMutableArray arrayWithCapacity:self.interests.count];
    [self.interests enumerateObjectsUsingBlock:^(Interest *interest, NSUInteger idx, BOOL *stop) {
        if (idx % 5 == 0) {
            [arrays addObject:[interest.publishDate stringWithFormat:@"yyyy-MM-dd"]];
        }
    }];
    return arrays;
}

- (NSArray *)dataArrayForYears:(NSUInteger)years {
    NSMutableArray *arrays = [NSMutableArray arrayWithCapacity:self.interests.count];
    [self.interests enumerateObjectsUsingBlock:^(Interest *interest, NSUInteger idx, BOOL *stop) {
        [arrays addObject:[interest.interestDic objectForKey:@(years)]];
    }];
    return arrays;
}

- (PNLineChartData *)lineChartForYears:(NSUInteger)years {
    static NSArray *colors;
    if (!colors) {
        colors = @[
                        PNLightBlue
                        ,PNGreen
                        ,PNFreshGreen
                        ,PNDeepGreen
                        ,PNRed
                        ,PNMauve
                        ,PNBrown
                        ,PNBlue
                        ,PNYellow
                        ,PNDarkYellow
                        ,PNPinkDark
                        ,PNTwitterColor
                        ,PNWeiboColor
                        ,PNiOSGreenColor];

    }

    NSArray *styles = @[@(PNLineChartPointStyleCircle), @(PNLineChartPointStyleSquare),@(PNLineChartPointStyleTriangle)];


    NSArray * data01Array = [self dataArrayForYears:years];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = colors[((years / styles.count) % (colors.count))];
    data01.dataTitle = [NSString stringWithFormat:@"%lu年", (unsigned long)years];
    data01.alpha = 0.3f;
    data01.itemCount = data01Array.count;
    PNLineChartPointStyle style = (PNLineChartPointStyle)[styles[years % (styles.count)] unsignedIntegerValue];
    data01.inflexionPointStyle = style;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };
    return data01;
}

@end
