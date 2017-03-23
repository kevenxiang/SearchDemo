//
//  NSString+ZZM.m
//  zxwkCIB
//
//  Created by Enway on 15/9/22.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "NSString+ZZM.h"

@implementation NSString (ZZM)

- (NSString *)fileAppend:(NSString *)append{

    // 1.1.获得文件拓展名
    NSString *ext = [self pathExtension];
    
    // 1.2.删除最后面的扩展名
    NSString *imgName = [self stringByDeletingPathExtension];
    
    // 1.3.拼接-568h@2x
    imgName = [imgName stringByAppendingString:append];
    
    // 1.4.拼接扩展名
    return [imgName stringByAppendingPathExtension:ext];
}

#pragma mark 去掉字符串的空格
- (NSString *)trimString {
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma mark 是否是空字符串
- (BOOL)isEmptyString {
    return (self.length == 0);
}

#pragma mark 是否属于数组成员
-(BOOL)isBelongToArray:(NSArray *)aArray{
    
    for (NSString *myStr in aArray) {
        if ([myStr isEqualToString:self]) {
            return YES;
        }
    }
    return NO;
}
#pragma mark 获取数组成员下标
-(int)isBelongToArrayIndex:(NSArray *)aArray{
    
    for (int i=0; i<aArray.count; i++) {
        if ([aArray[i] isEqualToString:self]) {
            return i;
        }
    }
    return -1;
}

@end
