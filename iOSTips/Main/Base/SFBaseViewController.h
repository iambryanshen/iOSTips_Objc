//
//  SFBaseViewController.h
//  iOSTips
//
//  Created by brian on 2018/2/28.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFBaseViewController : UIViewController

@property (nonatomic, strong) NSArray<NSDictionary<NSString *, UIViewController *> *> *dataSource;
@property (nonatomic, strong) NSArray *header;

@end
