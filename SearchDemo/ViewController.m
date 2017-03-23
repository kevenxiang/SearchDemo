//
//  ViewController.m
//  SearchDemo
//
//  Created by xiang on 2017/3/23.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+Ew.h"
#import "UIColor+Ew.h"
#import "CustomSearchBar.h"

@interface ViewController () <UITextFieldDelegate, CustomSearchBarDelegate>
{
    //标签选择项
    UISegmentedControl *mSegmentControl;
    UITextField *searchTextField;
    UIView *searchBgView;
    UIButton *searchCancelBtn;
    CustomSearchBar *tCustomSearchBar;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *navView = [[UIView alloc] init];
    navView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 64);
    navView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:navView];
    
    NSArray *segAry = @[@"待办列表", @"已办列表"];
    mSegmentControl = [[UISegmentedControl alloc] initWithItems:segAry];
    mSegmentControl.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 230)/2, 20+(44-30)/2 + 44, 230, 30);
    
    [mSegmentControl setBackgroundImage:[UIImage imageWithColorHexString:@"#FFFFFF"]
                               forState:UIControlStateNormal
                             barMetrics:UIBarMetricsDefault];
    [mSegmentControl setBackgroundImage:[UIImage imageWithColorHexString:@"#19A8F3"]
                               forState:UIControlStateSelected
                             barMetrics:UIBarMetricsDefault];
    
    [mSegmentControl setDividerImage:[UIImage imageWithColorHexString:@"#19A8F3"]
                 forLeftSegmentState:UIControlStateNormal
                   rightSegmentState:UIControlStateNormal
                          barMetrics:UIBarMetricsDefault];
    [mSegmentControl setDividerImage:[UIImage imageWithColorHexString:@"#19A8F3"]
                 forLeftSegmentState:UIControlStateSelected
                   rightSegmentState:UIControlStateNormal
                          barMetrics:UIBarMetricsDefault];
    [mSegmentControl setDividerImage:[UIImage imageWithColorHexString:@"#19A8F3"]
                 forLeftSegmentState:UIControlStateNormal
                   rightSegmentState:UIControlStateSelected
                          barMetrics:UIBarMetricsDefault];
    
    NSDictionary *textAttributesN = @{NSFontAttributeName: [UIFont systemFontOfSize:15],
                                      NSForegroundColorAttributeName: [UIColor colorWithHexString:@"#19A8F3"]};
    NSDictionary *textAttributesS = @{NSFontAttributeName: [UIFont systemFontOfSize:15],
                                      NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    [mSegmentControl setTitleTextAttributes:textAttributesN
                                   forState:UIControlStateNormal];
    [mSegmentControl setTitleTextAttributes:textAttributesS
                                   forState:UIControlStateSelected];
    
    [self.view addSubview:mSegmentControl];
    
    mSegmentControl.selectedSegmentIndex = 0;
    mSegmentControl.layer.cornerRadius = 5.f;
    mSegmentControl.layer.borderWidth = 1.f;
    mSegmentControl.layer.borderColor = [UIColor colorWithHexString:@"#19A8F3"].CGColor;
    mSegmentControl.clipsToBounds = YES;
    
    [mSegmentControl addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:mSegmentControl];
    
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(mSegmentControl.frame.origin.x+mSegmentControl.frame.size.width + 10, mSegmentControl.frame.origin.y, 30, 30);
    [searchBtn setImage:[UIImage imageNamed:@"search"] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(searchBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:searchBtn];
    
    tCustomSearchBar = [[CustomSearchBar alloc] init];
    tCustomSearchBar.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 64, 0, 36);
    tCustomSearchBar.backgroundColor = [UIColor lightGrayColor];
    tCustomSearchBar.delegate = self;
    [self.view addSubview:tCustomSearchBar];

}



- (void)segmentAction:(id)sender {

}

- (void)searchBtnAction:(id)sender {
    mSegmentControl.hidden = YES;
    tCustomSearchBar.frame = CGRectMake(0, tCustomSearchBar.frame.origin.y, [UIScreen mainScreen].bounds.size.width, tCustomSearchBar.frame.size.height);
    [tCustomSearchBar customSearchBarBeginAct];
}

#pragma mark - CustomSearchBarDelegate
- (void)customSearchBarCancelSearch {
    mSegmentControl.hidden = NO;
    tCustomSearchBar.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, tCustomSearchBar.frame.origin.y, 0, tCustomSearchBar.frame.size.height);
}

- (void)customSearchBarDidChange:(NSString *)text {
    NSLog(@"搜索改变======:%@", text);
}

- (void)customSearchBarReturn:(NSString *)text {
    NSLog(@"搜索返回======:%@", text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end





















