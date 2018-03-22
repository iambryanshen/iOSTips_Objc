//
//  UIImage+SFImage.m
//  iOSTips
//
//  Created by brian on 2018/3/22.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "UIImage+SFImage.h"
#import <objc/runtime.h>

@implementation UIImage (SFImage)

+ (void)load {
    
    // 获取系统类方法
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    
    // 获取自己实现的类方法
    Method sf_imageNamedMethod = class_getClassMethod(self, @selector(sf_imageNamed:));
    
    // 交换方法
    method_exchangeImplementations(imageNamedMethod, sf_imageNamedMethod);
}

+ (UIImage *)sf_imageNamed:(NSString *)name {
    
    UIImage *image = [UIImage sf_imageNamed:name];
    
    if (image) {
        NSLog(@"加载成功");
    } else {
        NSLog(@"加载失败");
    }
    
    return image;
}

@end
