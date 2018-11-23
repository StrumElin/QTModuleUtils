//
//  QTLoadingHUD.m
//  QTModuleUtils
//
//  Created by ☺strum☺ on 2018/11/23.
//  Copyright © 2018年 l. All rights reserved.
//

#import "QTLoadingHUD.h"
#import "MBProgressHUD.h"

@interface QTLoadingHUD (){
     BOOL _isShow;
}

@property (nonatomic, strong) MBProgressHUD *loadingHUD;

@end
@implementation QTLoadingHUD

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static QTLoadingHUD *sharedInstance = nil;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[QTLoadingHUD alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[[UIApplication sharedApplication] keyWindow] addSubview:self.loadingHUD];
    }
    return self;
}

+ (void)show {
    dispatch_async(dispatch_get_main_queue(), ^{
        QTLoadingHUD *hud = [self sharedInstance];
        if (hud->_isShow) {
            return;
        }
        [hud.loadingHUD showAnimated:YES];
        hud->_isShow = YES;
    });
}

+ (void)hide {
    dispatch_async(dispatch_get_main_queue(), ^{
        QTLoadingHUD *hud = [self sharedInstance];
        [hud.loadingHUD hideAnimated:YES];
        hud->_isShow = NO;
    });
}

#pragma mark - Accessor
+ (void)setUserInterfaceEnable:(BOOL)isEnable {
    QTLoadingHUD *hud = [self sharedInstance];
    hud.loadingHUD.userInteractionEnabled = isEnable;
}

- (MBProgressHUD *)loadingHUD {
    if (!_loadingHUD) {
        _loadingHUD = [[MBProgressHUD alloc] initWithView:[[UIApplication sharedApplication] keyWindow]];
        //        _loadingHUD.delegate = self;
        _loadingHUD.mode = MBProgressHUDModeIndeterminate;
        _loadingHUD.graceTime = 0.7;
        _loadingHUD.minShowTime = 0.5;
        _loadingHUD.animationType = MBProgressHUDAnimationZoom;
        _loadingHUD.userInteractionEnabled = NO;
    }
    return _loadingHUD;
}




@end
