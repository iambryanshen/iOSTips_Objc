//
//  SFProperty.h
//  iOSTips
//
//  Created by brian on 2018/3/23.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFProperty : NSObject

/*成员变量
{
    NSArray *_body;
    NSString *_section_count;
    NSString *_tag_name;
    NSString *_color;
}
 */

// 属性：@property会自动生成和属性对应的带有下划线的成员变量和set、get方法
@property (nonatomic, strong) NSArray *body;
@property (nonatomic, strong) NSString *section_count;
@property (nonatomic, strong) NSString *tag_name;
@property (nonatomic, strong) NSString *_color;

// __kindof本意是将此类型指定为class_name或class_name的子类，告诉编译器这两者均能适配
+ (__kindof SFProperty *)propertyWithDict:(NSDictionary *)dict;

@end
