//
//  SingletonModeTool.h
//  iOSTips
//
//  Created by brian on 2018/3/1.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingletonModeTool : NSObject <NSCopying, NSMutableCopying>

+ (instancetype)share;
+ (instancetype)shareTool;
+ (instancetype)shareInstance;

@end
