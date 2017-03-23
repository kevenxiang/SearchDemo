//
//  UIImage+Clip.m
//  zxwkCIB
//
//  Created by Enway on 15/9/22.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "UIImage+Clip.h"

#define PIC_SCALE_HEIGHT 4 //图片宽高比例-高
#define PIC_SCALE_WIDTH 3 //图片宽高比例-宽

@implementation UIImage (Clip)

/**
 *  按比例裁剪
 *
 *  @return 裁剪后的图像
 */
- (UIImage*)cropImageWithScale
{
    
    //得到原图的宽高
    int oWidth=self.size.width;
    int oHeight=self.size.height;
    
    //根据宽高比例(3:4)计算出高的大小
    int cHeight = (oWidth/PIC_SCALE_WIDTH)*PIC_SCALE_HEIGHT;
    //定义裁剪的区域相对于原图片的位置
    CGRect cropRect = CGRectMake(0, (oHeight-cHeight)/2, oWidth, cHeight);

    
    CGRect drawRect = CGRectMake(-cropRect.origin.x , -cropRect.origin.y, self.size.width * self.scale, self.size.height * self.scale);
    
    UIGraphicsBeginImageContext(cropRect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextClearRect(context, CGRectMake(0, 0, cropRect.size.width, cropRect.size.height));
    
    [self drawInRect:drawRect];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
