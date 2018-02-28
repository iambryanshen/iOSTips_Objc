//
//  SFTabBarController.m
//  iOSTips
//
//  Created by brian on 2018/2/28.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFTabBarController.h"
#import "SFTipsNavigationController.h"
#import "SFTipsViewController.h"
#import "SFUIKitNavigationController.h"
#import "SFUIKitViewController.h"
#import "SFNetworkNavigationController.h"
#import "SFNetworkViewController.h"

@interface SFTabBarController ()

@end

@implementation SFTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupChildVC];
}

- (void)setupChildVC {
    
    SFUIKitViewController *uikitVC = [[SFUIKitViewController alloc] init];
    uikitVC.title = @"UIKit";
    SFUIKitNavigationController *uikitNavigationVC = [[SFUIKitNavigationController alloc] initWithRootViewController:uikitVC];
    [self addChildViewController:uikitNavigationVC];
    
    SFNetworkViewController *networkVC = [[SFNetworkViewController alloc] init];
    networkVC.title = @"Network";
    SFNetworkNavigationController *networkNavigationVC = [[SFNetworkNavigationController alloc] initWithRootViewController:networkVC];
    [self addChildViewController:networkNavigationVC];
    
    SFTipsViewController *tipsVC = [[SFTipsViewController alloc] init];
    tipsVC.title = @"Tips";
    SFTipsNavigationController *tipsNavigationVC = [[SFTipsNavigationController alloc] initWithRootViewController:tipsVC];
    [self addChildViewController:tipsNavigationVC];
}

@end
