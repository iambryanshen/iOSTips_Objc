//
//  SFParticleEffectsViewController.m
//  iOSTips
//
//  Created by brian on 2018/3/20.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

/*
 粒子效果思路：
    1. 绘制贝塞尔曲线
    2. 创建CALayer粒子
    3. 更改当前控制器的view的layer的类型为CAReplicatorLayer（复制层layer）
    4. 给粒子添加帧动画，让粒子沿着贝塞尔曲线移动
    5. 设置复制层属性，赋值多个粒子，并让复制的粒子延迟执行
 */

#import "SFParticleEffectsViewController.h"
#import "SFParticleEffectsView.h"

@interface SFParticleEffectsViewController ()
@property (strong, nonatomic) IBOutlet SFParticleEffectsView *particleEffectsView;

@end

@implementation SFParticleEffectsViewController

/*
 在指定view中做的事情，交给指定view处理，指定view提供给外界一个接口调用
 */
- (IBAction)startClick {
    [self.particleEffectsView start];
}

- (IBAction)redrawClick {
    [self.particleEffectsView redraw];
}

@end
