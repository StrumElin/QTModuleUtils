//
//  UIImage+QTIM.h
//  RIMDemo
//
//  Created by 未可知 on 2018/10/22.
//  Copyright © 2018年 QT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (QTIM)
//
+ (UIImage *)imageWithColor:(UIColor *)color;

- (UIImage *)imageByScalingToSize:(CGSize)targetSize;

@end

