//
//  ViewController.m
//  SDCycleScrollView
//
//  Created by aier on 15-3-22.
//  Copyright (c) 2015年 GSD. All rights reserved.
//

#import "ViewController.h"
#import "SDCycleScrollView.h"

@interface ViewController () <SDCycleScrollViewDelegate>
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView;
@property (nonatomic, strong) SDCycleScrollView *cycleScrollView2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:0.99];
    NSArray *images = @[[UIImage imageNamed:@"h1.jpg"],
                        [UIImage imageNamed:@"h2.jpg"],
                        [UIImage imageNamed:@"h3.jpg"],
                        [UIImage imageNamed:@"h4.jpg"]
                        ];
    
    NSArray *titles = @[@"感谢您的支持，如果下载的",
                        @"如果代码在使用过程中出现问题",
                        @"您可以发邮件到gsdios@126.com",
                        @"感谢您的支持"
                        ];
    
    
    CGFloat w = self.view.bounds.size.width;
    
    // 创建不带标题的图片轮播器
    self.cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 60, w, 180) imagesGroup:images];
    self.cycleScrollView.delegate = self;
    //cycleScrollView.autoScrollTimeInterval = 2.0;
    [self.view addSubview:self.cycleScrollView];
    
    
    // 创建带标题的图片轮播器
    self.cycleScrollView2 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 280, w, 180) imagesGroup:images];
    self.cycleScrollView2.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.cycleScrollView2.delegate = self;
    self.cycleScrollView2.titlesGroup = titles;
    [self.view addSubview:self.cycleScrollView2];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"刷新" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(reload:) forControlEvents:UIControlEventTouchUpInside];
    button.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - w) / 2, 280 + 180, w, 40);
    [self.view addSubview:button];
}

- (void)reload:(UIButton *)sender {
    NSArray *images = @[[UIImage imageNamed:@"h4.jpg"],
                        [UIImage imageNamed:@"h3.jpg"],
                        [UIImage imageNamed:@"h2.jpg"],
                        [UIImage imageNamed:@"h1.jpg"],
                        [UIImage imageNamed:@"h3.jpg"],
                        ];
    
    NSArray *titles = @[@"数据已经重新加载过 1",
                        @"数据已经重新加载过 2",
                        @"数据已经重新加载过 3",
                        @"数据已经重新加载过 4",
                        @"数据已经重新加载过 3(again)",
                        ];
    
    self.cycleScrollView.imagesGroup = images;
    self.cycleScrollView2.imagesGroup = images;
    self.cycleScrollView2.titlesGroup = titles;
    [self.cycleScrollView reloadData];
    [self.cycleScrollView2 reloadData];
}

#pragma mark - SDCycleScrollViewDelegate

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", index);
}

@end
