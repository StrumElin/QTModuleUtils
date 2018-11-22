//
//  UIButton+interval.h
//  QTModuleUtils
//
//  Created by ☺strum☺ on 2018/11/21.
//  Copyright © 2018年 l. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#define defaultInterval .5  //默认时间间隔

@interface UIButton (interval)

/**设置点击时间间隔*/
@property (nonatomic, assign) NSTimeInterval timeInterval;


@end

