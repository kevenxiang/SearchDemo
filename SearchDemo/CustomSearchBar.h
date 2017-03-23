//
//  CustomSearchBar.h
//  SearchDemo
//
//  Created by xiang on 2017/3/23.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomSearchBarDelegate <NSObject>

- (void)customSearchBarCancelSearch;
- (void)customSearchBarDidChange:(NSString *)text;
- (void)customSearchBarReturn:(NSString *)text;

@end

@interface CustomSearchBar : UIView

@property (nonatomic, assign) id <CustomSearchBarDelegate> delegate;

- (void)customSearchBarBeginAct;

@end
