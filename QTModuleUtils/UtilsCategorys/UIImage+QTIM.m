//
//  UIImage+QTIM.m
//  RIMDemo
//
//  Created by 未可知 on 2018/10/22.
//  Copyright © 2018年 QT. All rights reserved.
//

#import "UIImage+QTIM.h"

@implementation UIImage (QTIM)
+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)imageByScalingToSize:(CGSize)targetSize

{
    
    UIImage *sourceImage = self;
    
    UIImage *newImage = nil;
    
    CGSize imageSize = sourceImage.size;
    
    CGFloat width = imageSize.width;
    
    CGFloat height = imageSize.height;
    
    CGFloat targetWidth = targetSize.width;
    
    CGFloat targetHeight = targetSize.height;
    
    CGFloat scaleFactor = 0.0;
    
    CGFloat scaledWidth = targetWidth;
    
    CGFloat scaledHeight = targetHeight;
    
    CGPoint thumbnailPoint = CGPointMake(0.0,0.0);
    
    if (CGSizeEqualToSize(imageSize, targetSize) ==NO) {
        
        CGFloat widthFactor = targetWidth / width;
        
        CGFloat heightFactor = targetHeight / height;
        
        if (widthFactor < heightFactor)
            
            scaleFactor = widthFactor;
        
        else
            
            scaleFactor = heightFactor;
        
        scaledWidth  = width * scaleFactor;
        
        scaledHeight = height * scaleFactor;
        
        // center the image
        
        if (widthFactor < heightFactor) {
            
            
            
            thumbnailPoint.y = (targetHeight - scaledHeight) * 0.5;
            
        } else if (widthFactor > heightFactor) {
            
            thumbnailPoint.x = (targetWidth - scaledWidth) * 0.5;
            
        }
        
    }
    
    // this is actually the interesting part:
    if ([UIScreen mainScreen].scale != 1) {
        UIGraphicsBeginImageContextWithOptions(targetSize, NO, [UIScreen mainScreen].scale);
    }
    else {
        UIGraphicsBeginImageContext(targetSize);
    }
    CGRect thumbnailRect = CGRectZero;
    
    thumbnailRect.origin = thumbnailPoint;
    
    thumbnailRect.size.width  = scaledWidth;
    
    thumbnailRect.size.height = scaledHeight;
    
    [sourceImage drawInRect:thumbnailRect];
    
    newImage =UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    if(newImage == nil)
        
        NSLog(@"could not scale image");
    
    return newImage ;
    
}

//+ (UIImage *)imageWithColor:(UIColor *)color {
//    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
//    UIGraphicsBeginImageContext(rect.size);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    CGContextSetFillColorWithColor(context, [color CGColor]);
//    CGContextFillRect(context, rect);
//    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return theImage;
//}
@end
