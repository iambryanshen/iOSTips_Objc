
//
//  SFVCView.m
//  iOSTips
//
//  Created by brian on 2018/3/20.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFVCView.h"

@implementation SFVCView


/**
 修改控制器的view的layer为CAReplicatorLayer

 @return 复制层
 */
+ (Class)layerClass {
    return [CAReplicatorLayer class];
}

@end
