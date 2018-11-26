//
//  UINavigationController+QTIM.m
//  RIMDemo
//
//  Created by 未可知 on 2018/11/22.
//  Copyright © 2018 QT. All rights reserved.
//

#import "UINavigationController+QTIM.h"
#import <objc/runtime.h>
#import "UIImage+QTIM.h"
#import "QTIMMacros.h"

@implementation UINavigationController (QTIM)
+ (void)load
{
    Method originalViewDidLoad, swizzledViewDidLoad;
    originalViewDidLoad = class_getInstanceMethod(self, @selector(viewDidLoad));
    swizzledViewDidLoad = class_getInstanceMethod(self, @selector(swizzled_viewDidLoad));
    method_exchangeImplementations(originalViewDidLoad, swizzledViewDidLoad);
}

- (void)swizzled_viewDidLoad
{
    if ([self respondsToSelector:@selector(swizzled_viewDidLoad)]) {
        [self swizzled_viewDidLoad];
    }
    if ([self isKindOfClass:[UINavigationController class]]) {
        [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName :[UIColor whiteColor]}];
        self.navigationBar.tintColor = [UIColor whiteColor];
        [self.navigationBar setBackgroundImage:[UIImage imageWithColor:MainBlueColor(1)] forBarMetrics:UIBarMetricsDefault];
    }
}
@end
