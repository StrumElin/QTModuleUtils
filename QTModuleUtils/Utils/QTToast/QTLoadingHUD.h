//
//  QTLoadingHUD.h
//  QTModuleUtils
//
//  Created by ☺strum☺ on 2018/11/23.
//  Copyright © 2018年 l. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QTLoadingHUD : NSObject

+ (instancetype)sharedInstance;

+ (void)setUserInterfaceEnable:(BOOL)isEnable;

+ (void)show;

+ (void)hide;

@end

NS_ASSUME_NONNULL_END
