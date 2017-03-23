//
//  UIImage+ZgImage.h
//  zxwkCIB
//
//  Created by Enway on 15/9/22.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZgImage)

#pragma mark 加载全屏的图片
+(UIImage *)fullscrennImage:(NSString *)imgName;

#pragma mark 可以自由拉伸的图片
+ (UIImage *)resizedImage:(NSString *)imgName;
+ (UIImage *)resizedImage:(NSString *)imgName aWidth:(CGFloat)width aHeight:(CGFloat)height;


// 通过颜色创建Image
+ (UIImage *)imageWithColorHexString:(NSString *)colorHexStr;

// 通过颜色和尺寸创建Image
+ (UIImage *)imageWithColorHexString:(NSString *)colorHexStr withSize:(CGSize)size;


+(CGSize)downloadImageSizeWithURL:(id)imageURL;

+ (UIImage *)resizedImage:(NSString *)imgName withTopPix:(CGFloat) top withBottomPix:(CGFloat) bottom withLeftPix:(CGFloat) left withRigthPix:(CGFloat) right;














// 图片处理 0 半灰色  1 灰度   2 深棕色    3 反色
//+(UIImage*)imageWithImage:(UIImage*)image grayLevelType:(float)type;

//色值 变暗多少 0.0 - 1.0
//+(UIImage*)imageWithImage:(UIImage*)image darkValue:(float)darkValue;

/**
 获取网络图片的Size, 先通过文件头来获取图片大小
 如果失败 会下载完整的图片Data 来计算大小 所以最好别放在主线程
 如果你有使用SDWebImage就会先看下 SDWebImage有缓存过改图片没有
 支持文件头大小的格式 png、gif、jpg   http://www.cocoachina.com/bbs/read.php?tid=165823
 */
//+(CGSize)downloadImageSizeWithURL:(id)imageURL;




@end
