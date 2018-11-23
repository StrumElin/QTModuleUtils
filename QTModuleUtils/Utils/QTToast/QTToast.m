//
//  QTToast.m
//  QTModuleUtils
//
//  Created by ☺strum☺ on 2018/11/23.
//  Copyright © 2018年 l. All rights reserved.
//

#import "QTToast.h"
#import "MBProgressHUD.h"
@interface QTToast ()<MBProgressHUDDelegate>

@property (nonatomic, strong)MBProgressHUD *progressHUD;
@property (nonatomic, assign) NSTimeInterval interval;

@end

@implementation QTToast

+ (id)sharedToast {
    static QTToast *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[QTToast alloc]init];
    });
    return instance;
}

- (void)showDialogWithMsg:(NSString *)msg {
    self.interval = 2;
    if (msg.length <= 14) {
        [self jd_showDialogWithTitle:msg detail:nil];
    }else {
        [self jd_showDialogWithTitle:nil detail:msg];
    }}

- (void)showDialogWithMsg:(NSString *)msg interval:(NSTimeInterval)interval {
    NSAssert(interval > 0, @"error interval");
    self.interval = interval;
    if (msg.length <= 14) {
        [self jd_showDialogWithTitle:msg detail:nil];
    }else {
        [self jd_showDialogWithTitle:nil detail:msg];
    }
}

- (void)jd_showDialogWithTitle:(NSString *)title detail:(NSString *)detail {
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressHUD.label.text        = title;
        self.progressHUD.detailsLabel.text = detail;
        if (self.progressHUD.superview) {
            [self.progressHUD removeFromSuperview];
        }
        
        
        [[[UIApplication sharedApplication] keyWindow] addSubview:self.progressHUD];
        
        [self.progressHUD showAnimated:YES];
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self jd_progressTask];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.progressHUD hideAnimated:YES];
            });
        });
    });
}

- (UIWindow *)window{
    return [[[UIApplication sharedApplication] windows] objectAtIndex:0];
}

- (void)jd_progressTask {
    NSAssert(self.interval > 0, @"error time");
    [NSThread sleepForTimeInterval:self.interval];
}

- (MBProgressHUD*)progressHUD {
    if (!_progressHUD) {
        _progressHUD = [[MBProgressHUD alloc]initWithView:[[UIApplication sharedApplication] keyWindow]];
        _progressHUD.delegate = self;
        _progressHUD.animationType = MBProgressHUDAnimationZoom;
        _progressHUD.mode = MBProgressHUDModeCustomView;
        _progressHUD.userInteractionEnabled = NO;
    }
    return _progressHUD;
}

@end
