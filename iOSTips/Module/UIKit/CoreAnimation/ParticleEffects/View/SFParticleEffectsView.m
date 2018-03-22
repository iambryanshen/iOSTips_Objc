//
//  SFParticleEffectsView.m
//  iOSTips
//
//  Created by brian on 2018/3/20.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFParticleEffectsView.h"

@interface SFParticleEffectsView ()

@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) CALayer *dotLayer;

@end

@implementation SFParticleEffectsView

+ (Class)layerClass {
    return [CAReplicatorLayer class];
}

// 开始粒子动画
- (void)start {
    /*
     只有帧动画可以沿着“UIBezierPath”移动
     */
    CAKeyframeAnimation *keyFrameAnim = [CAKeyframeAnimation animation];
    keyFrameAnim.keyPath = @"position";
    keyFrameAnim.path = self.path.CGPath;
    keyFrameAnim.repeatCount = HUGE;
    keyFrameAnim.duration = 20.0;
    [self.dotLayer addAnimation:keyFrameAnim forKey:nil];
}

// 重绘
- (void)redraw {
    /*
     移除所有的path，所有的粒子，不能忘了重绘当前界面
     */
    [self.path removeAllPoints];
    [self.dotLayer removeAllAnimations];
    [self.layer setNeedsDisplay];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    /*
     * 贝塞尔曲线要在awakeFromNib中绘制，这样可以保证绘制多条线，且不会发生覆盖
     */
    UIBezierPath *path = [UIBezierPath bezierPath];
    self.path = path;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self addGestureRecognizer:pan];
    
    // 创建粒子
    CALayer *dotLayer = [[CALayer alloc] init];
    self.dotLayer = dotLayer;
    dotLayer.backgroundColor = [UIColor redColor].CGColor;
    dotLayer.cornerRadius = 10;
    dotLayer.frame = CGRectMake(0, 0, 20, 20);
    [self.layer addSublayer:dotLayer];
    
    // 设置复制层的属性
    CAReplicatorLayer *replicatorLayer = (CAReplicatorLayer *)self.layer;
    replicatorLayer.instanceCount = 500;
    replicatorLayer.instanceDelay = 0.2;
}

/*
 * 绘制手势执行的方法
 */
- (void)pan:(UIPanGestureRecognizer *)panGes {
    CGPoint currentPoint = [panGes locationInView:panGes.view];
    if (panGes.state == UIGestureRecognizerStateBegan) {
        [self.path moveToPoint: currentPoint];
    } else if (panGes.state == UIGestureRecognizerStateChanged) {
        [self.path addLineToPoint:currentPoint];
    }
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [self.path stroke];
}

@end
