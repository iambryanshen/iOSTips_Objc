//
//  SFUIKitViewController.m
//  iOSTips
//
//  Created by brian on 2018/2/28.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFUIKitViewController.h"
#import "SFReplicatorDemoViewController.h"
#import "SFParticleEffectsViewController.h"

@interface SFUIKitViewController ()

@end

@implementation SFUIKitViewController

- (void)viewDidLoad {
    
    self.header = @[@"核心动画"];
    self.dataSource = @[@{@"Replicator：倒影": [SFReplicatorDemoViewController new],
                          @"粒子效果": [SFParticleEffectsViewController new],}];
    
    [super viewDidLoad];
    
}

@end
