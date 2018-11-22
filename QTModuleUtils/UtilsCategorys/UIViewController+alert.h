//
//  UIViewController+alert.h
//  QTModuleUtils
//
//  Created by ☺strum☺ on 2018/11/21.
//  Copyright © 2018年 l. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (alert)

- (void)showAlertWithTitle:(NSString *)title msg:(NSString *)msg handler:(void (^)(UIAlertAction *action))handler;

- (void)showCancleAlertWithTitle:(NSString *)title msg:(NSString *)msg handler:(void (^)(UIAlertAction *action))handler;

- (void)showActionSheetWithTitle:(NSString *)title firstButton:(NSString *)btnTitle1 firstHandler:(void (^)(UIAlertAction *action))handler secondButton:(NSString *)btnTitle2 secondHandler:(void (^)(UIAlertAction *action))handler2;

@end
