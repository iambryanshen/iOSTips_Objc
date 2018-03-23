//
//  SFPerson.h
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SFBody;

@interface SFPerson : NSObject

@property (nonatomic, strong) SFBody *body;

@property (nonatomic, strong) NSString *section_count;

@property (nonatomic, strong) NSString *tag_name;

@property (nonatomic, strong) NSString *color;

@end
