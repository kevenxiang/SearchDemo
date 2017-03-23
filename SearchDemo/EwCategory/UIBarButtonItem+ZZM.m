//
//  UIBarButtonItem+ZZM.m
//  zxwkCIB
//
//  Created by Enway on 15/9/22.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "UIBarButtonItem+ZZM.h"

@implementation UIBarButtonItem (ZZM)

-(id)initwithIcon:(NSString *)icon highlightedIcon:(NSString *)highlightedIcon target:(id) target action:(SEL)action{
    
    // 1.创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    // 2.设置背景图片
    [btn setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highlightedIcon] forState:UIControlStateHighlighted];
    //设置宽高才能显示
    btn.bounds = (CGRect){CGPointZero,[UIImage imageNamed:icon].size};
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];


    return  [self initWithCustomView:btn];
    

}

+(id)barButtonItemIcon:(NSString *)icon highlightedIcon:(NSString *)highlightedIcon target:(id) target action:(SEL)action{

    return [[self alloc]initwithIcon:icon highlightedIcon:highlightedIcon target:target action:action];

}


@end
