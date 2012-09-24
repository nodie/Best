//
//  YUAppDelegate.h
//  Best
//
//  Created by 於 琦峰 on 12-09-22.
//  Copyright (c) 2012年 於 琦峰. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YUViewController;

@interface YUAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *viewController;

@property (assign) int section;

@property (assign) int row;

@property (strong, nonatomic) NSArray *provinces;

@end
