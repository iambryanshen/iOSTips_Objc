//
//  SFReplicatorDemoViewController.m
//  iOSTips
//
//  Created by brian on 2018/3/20.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFReplicatorDemoViewController.h"

@interface SFReplicatorDemoViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SFReplicatorDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    CAReplicatorLayer *replicatorLayer = (CAReplicatorLayer *)self.view.layer;

    // 复制份数
    replicatorLayer.instanceCount = 2;
    // 
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(M_PI, 1, 0, 0);
    // 颜色渐变
    replicatorLayer.instanceRedOffset -= 0.1;
    replicatorLayer.instanceGreenOffset -= 0.1;
    replicatorLayer.instanceBlueOffset -= 0.1;
    replicatorLayer.instanceAlphaOffset -= 0.1;
}

@end
