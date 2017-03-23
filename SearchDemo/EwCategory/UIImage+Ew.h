//
//  UIImage+Ew.h
//  zxwkCIB
//
//  Created by Enway on 15/9/22.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface UIImage (Ew)

/**
 * 将图片变成带边控的圆形图片
 *
 * @param image 原图
 */
+(UIImage *)makeRoundedImage:(UIImage *) image;

/**
 * 将图片变成带边控的圆形图片
 *
 * @param image 原图
 * @param colorHexStr 边框颜色
 */
+(UIImage *)makeRoundedImage:(UIImage *)image withBorderColor:(NSString *)colorHexStr;

/**
 * 通过颜色生成图片
 *
 * @param colorHexStr 颜色
 */
+(UIImage *)imageWithColorHexString:(NSString *)colorHexStr;

/**
 * 按新的尺寸生成图片
 *
 * @param image 原图
 * @param newSize 新尺寸
 */
+(UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
@end
