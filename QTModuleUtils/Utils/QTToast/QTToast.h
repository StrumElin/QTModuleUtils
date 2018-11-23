//
//  QTToast.h
//  QTModuleUtils
//
//  Created by ☺strum☺ on 2018/11/23.
//  Copyright © 2018年 l. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface QTToast : NSObject

/**
 *  @brief 提示框
 *
 *  @return 提示框单例
 */
+ (id)sharedToast;

/**
 *  @brief 弹出提示  3秒的弹出时间
 *
 *  @param msg 提示语
 */
- (void)showDialogWithMsg:(NSString*)msg;

/**
 *  @brief 弹出提示
 *
 *  @param msg      提示语
 *  @param interval 弹出时间
 */
- (void)showDialogWithMsg:(NSString*)msg interval:(NSTimeInterval)interval;


@end

NS_ASSUME_NONNULL_END
