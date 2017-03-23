//
//  UIImage+Ew.m
//  zxwkCIB
//
//  Created by Enway on 15/9/22.
//  Copyright (c) 2015年 Michael. All rights reserved.
//

#import "UIImage+Ew.h"
#import "UIColor+Ew.h"

@implementation UIImage (Ew)

// 圆角的Image
+(UIImage *)makeRoundedImage:(UIImage *)image;
{
    
    return [UIImage makeRoundedImage:image withBorderColor:@"#ffffff"];
}

// 圆角的Image
+(UIImage *)makeRoundedImage:(UIImage *)image withBorderColor:(NSString *) colorHexStr;
{
//    DLog(@"image.size.widthd%f image.size.height%f ",image.size.width,image.size.height);
    image = [UIImage imageWithImage:image scaledToSize:CGSizeMake(image.size.width, image.size.width)];
    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = CGRectMake(0, 0, image.size.width, image.size.height);
    imageLayer.contents = (id) image.CGImage;
    
    imageLayer.borderWidth = 3.0;
    imageLayer.masksToBounds = YES;
    imageLayer.cornerRadius = image.size.width/2;
    imageLayer.borderColor =[[UIColor colorWithHexString:colorHexStr] CGColor];
    
    UIGraphicsBeginImageContext(image.size);
    [imageLayer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *roundedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return roundedImage;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

// 通过颜色创建Image
+ (UIImage *)imageWithColorHexString:(NSString *)colorHexStr {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    UIColor *color = [UIColor colorWithHexString:colorHexStr];
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
