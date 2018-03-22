//
//  SFSendMsgViewController.m
//  iOSTips
//
//  Created by brian on 2018/3/15.
//  Copyright © 2018年 Brian Inc. All rights reserved.
//

#import "SFSendMsgViewController.h"
/*
 在objc中想要使用Runtime，需要手动导入以下框架
 > 直接导入#import <objc/runtime.h>也可以，但是建议导入#import <objc/message.h>
 > 原因：点进去#import <objc/message.h>会发现#import <objc/message.h>包含了#import <objc/runtime.h>
 
 objc_getClass:根据类名获得类对象
 sel_registerName:注册方法
 
 runtime的使用场景：
 1. 封装框架，让框架看起来有逼格
 2. 调用私有方法，私有方法通过Objc直接调用会报错，通过runtime可以调用私有方法。
 
 */
#import <objc/message.h>

#import "Person.h"


@interface SFSendMsgViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation SFSendMsgViewController

/*
 首先要对XCode编译器进行设置，因为在XCode6以后，苹果对开发者使用Runtime进行了限制
 直接输入objc_msgSend得到的是没有参数的函数objc_msgSend()，需要在build setting中搜索msg设置Enable strict checking of objc_msgSend calls为No
 然后输入objc_msgSend得到有参数的函数objc_msgSend(<#id  _Nullable self#>, <#SEL  _Nonnull op, ...#>)
 */

- (IBAction)objcSendMessage:(id)sender {
    
    /*
     // 原生objc实现创建objc对象，分配内存并初始化
     NSObject *objc = [NSObject alloc];
     objc = [objc init];
     */
    
    // 通过runtime实现创建objc对象，分配内存并初始化
    NSObject *objc = objc_msgSend(objc_getClass("NSObject"), sel_registerName("alloc"));
    objc = objc_msgSend(objc, sel_registerName("init"));
    
    /*
     以上创建objc对象分配内存和初始化的过程的编译后C++源码
     NSObject *objc = ((NSObject *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("NSObject"), sel_registerName("alloc"));
     objc = ((NSObject *(*)(id, SEL))(void *)objc_msgSend)((id)objc, sel_registerName("init"));
     */
}


- (IBAction)personSendMessage:(id)sender {
    
 
    Person *p = objc_msgSend(objc_getClass("Person"), sel_registerName("alloc"));
    p = objc_msgSend(p, sel_registerName("init"));
    
    NSLog(@"%@", p);
    objc_msgSend(p, sel_registerName("run:dis:"), 30, 20);
}

/*
 内存分为5大区：
 (1): 栈区
 (2): 堆区：
        > 堆是向高地址扩展的数据结构，不连续的内存区域。
        > 系统用链表储存空闲地址的。链表遍历由低向高。
        > 堆大小直接受设备有效虚拟内存影响。
            1.首先应该知道操作系统有一个记录空闲内存地址的链表。
            2.当系统收到程序的申请时，会遍历该链表，寻找第一个空间大于所申请空间的堆结点，然后将该结点从空闲结点链表中删除，并将该结点的空间分配给程序。
            3.由于找到的堆结点的大小不一定正好等于申请的大小，系统会自动的将多余的那部分重新放入空闲链表中
        > 使用: 存放实体对象的。由程序员分配和释放(arc自动插入分配和释放代码)，例如alloc 申请的会放入堆中。
 (3): 全局\静态区(static)
        > 静态变量和全局变量是存储在一起的。
        > 初始化的全局变量和静态变量存放在一块区域，未初始化的全局变量和静态变量在相邻的另一块区域
        > 程序结束后有系统释放。
            int a;//未初始化的静态区
            int b = 10;//初始化的静态区
 (4): 文字常量区
        > 存放常量字符串，程序结束系统释放
 (5): 程序代码区
        > 存放函数实现的二进制代码

 
 方法调用的流程：
    > 方法调用的本质是让对象发消息
    > 对象方法保存在对应的类中，类中有一个保存全部对象方法的方法列表。类方法保存在元类中
    > 发送消息的时候，对象根据对应的isa指针（isa = (class)Person）去对应的类的方法列表中根据方法编号（sel_registerName("run:dis:")中的“run:dis:”就是方法编号）找对应的方法名run:dis:
    > 根据方法名就可以在内存中“程序代码区”找到对应的函数实现
 
 （方法编号是一串数字，因为系统操作数字比操作字符串更快，所以需要通过方法编号找到方法名，而不是直接找方法名）
 
 所有的OC方法都会转换成函数实现。所以方法调用的流程最后一步是通过方法名在程序代码去区找到对应的函数实现
 */

- (IBAction)exchangeMethod:(id)sender {
    
    /*
     如果希望交换方法起作用的话，比如希望让系统方法：[UIImage imagedName: @"imagename"]，使用自己的实现，需要在类UIImage加载进内存前起作用。所以需要在load方法里交换方法，因为load方法在类被加载进内存前调用
     */
    
    self.imageView.image = [UIImage imageNamed:@"卡哇伊"];
}

- (IBAction)dynamicAddMethod:(id)sender {
    
    Person *p = [Person new];
    
    //[p performSelector:@selector(aaaa)];
    [p performSelector:@selector(bbbb:) withObject:@10];
}

@end
