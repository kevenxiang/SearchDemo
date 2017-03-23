//
//  CustomSearchBar.m
//  SearchDemo
//
//  Created by xiang on 2017/3/23.
//  Copyright © 2017年 xiang. All rights reserved.
//

#import "CustomSearchBar.h"

#define SearchTextFieldHeight   26
#define SearchBarHeight         36

@interface CustomSearchBar() <UITextFieldDelegate>
{
    UITextField *searchTextField;
    UIView *searchBgView;
    UIButton *searchCancelBtn;
}

@end

@implementation CustomSearchBar

- (instancetype)init {
    self = [super init];
    if (self) {
        [self setUI];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setUI];
    }
    
    return self;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    searchTextField.text = @"";
    [searchTextField resignFirstResponder];
    
    [UIView animateWithDuration:0.25 animations:^{
        searchBgView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, 0, SearchBarHeight);
        searchCancelBtn.frame = CGRectMake(0, 0, 0, SearchBarHeight);
        searchTextField.frame = CGRectMake(0, (SearchBarHeight-SearchTextFieldHeight)/2, searchBgView.frame.size.width, SearchTextFieldHeight);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)setUI {
    
    searchBgView = [[UIView alloc] init];
    searchBgView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, 0, SearchBarHeight);
    searchBgView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:searchBgView];
    
    searchCancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchCancelBtn.frame = CGRectMake(0, 0, 0, SearchBarHeight);
    [searchCancelBtn setTitle:@"取消" forState:UIControlStateNormal];
    searchCancelBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [searchCancelBtn setTitleColor:[UIColor colorWithRed:0 green:126/255.0 blue:246/255.0 alpha:1] forState:UIControlStateNormal];
    [searchCancelBtn addTarget:self action:@selector(searchCancelBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [searchBgView addSubview:searchCancelBtn];
    
    searchTextField = [[UITextField alloc] init];
    searchTextField.frame = CGRectMake(0, (SearchBarHeight-SearchTextFieldHeight)/2, 0, SearchTextFieldHeight);
    searchTextField.layer.cornerRadius = 5;
    searchTextField.font = [UIFont systemFontOfSize:15];
    searchTextField.layer.masksToBounds = YES;
    searchTextField.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    searchTextField.layer.borderWidth = 1;
    searchTextField.backgroundColor = [UIColor whiteColor];
    searchTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    searchTextField.returnKeyType = UIReturnKeySearch;
    searchTextField.placeholder = @"搜索";
    searchTextField.delegate = self;
    [searchBgView addSubview:searchTextField];
    
    [searchTextField addTarget:self action:@selector(searchTextFieldChange:) forControlEvents:UIControlEventEditingChanged];

}

- (void)customSearchBarBeginAct {
    
    [UIView animateWithDuration:0.35 animations:^{
        CGRect tFrame = searchBgView.frame;
        tFrame.origin.x = 0;
        tFrame.size.width = [UIScreen mainScreen].bounds.size.width;
        searchBgView.frame = tFrame;
        
        CGRect tTextFieldFrame = searchTextField.frame;
        tTextFieldFrame.origin.x = 10;
        tTextFieldFrame.size.width = [UIScreen mainScreen].bounds.size.width - 70;
        searchTextField.frame = tTextFieldFrame;
        
        
        CGRect tSearchCancelBtnFrame = searchCancelBtn.frame;
        tSearchCancelBtnFrame.origin.x = [UIScreen mainScreen].bounds.size.width - 50;
        tSearchCancelBtnFrame.size.width = 40;
        searchCancelBtn.frame = tSearchCancelBtnFrame;
        
    } completion:^(BOOL finished) {
        [searchTextField becomeFirstResponder];
    }];
    
}


- (void)searchCancelBtnAction:(id)sender {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customSearchBarCancelSearch)]) {
        [self.delegate customSearchBarCancelSearch];
    }
    
    searchTextField.text = @"";
    [searchTextField resignFirstResponder];
    
    [UIView animateWithDuration:0.25 animations:^{
        searchBgView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width, 0, 0, SearchBarHeight);
        searchCancelBtn.frame = CGRectMake(0, 0, 0, SearchBarHeight);
        searchTextField.frame = CGRectMake(0, (SearchBarHeight-SearchTextFieldHeight)/2, searchBgView.frame.size.width, SearchTextFieldHeight);
    } completion:^(BOOL finished) {
        
    }];
}

- (void)searchTextFieldChange:(UITextField *)textField {
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(customSearchBarDidChange:)]) {
        [self.delegate customSearchBarDidChange:textField.text];
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {

    if (self.delegate && [self.delegate respondsToSelector:@selector(customSearchBarReturn:)]) {
        [self.delegate customSearchBarReturn:textField.text];
    }
    
    return YES;
}


@end
