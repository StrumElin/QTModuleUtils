//
//  NSString+QTIM.m
//  RIMDemo
//
//  Created by 未可知 on 2018/11/20.
//  Copyright © 2018 QT. All rights reserved.
//

#import "NSString+QTIM.h"
#import <UIKit/UIKit.h>

@implementation NSString (QTIM)
- (CGFloat)textWidth:(CGFloat)height font:(UIFont *)font
{
    CGRect rect = CGRectZero;
    rect= [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil];
    return rect.size.width;
}
@end
