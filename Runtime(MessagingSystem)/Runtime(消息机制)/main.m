//
//  main.m
//  Runtime(消息机制)
//
//  Created by Herbert Hu on 16/10/10.
//  Copyright © 2016年 Herbert Hu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/message.h>
#import "Rabbit.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        id obj = [NSObject alloc];
        
        obj = [obj init];
        
        
        // 使用 runtime 机制, 创建 obj2 对象
        id obj2 = objc_msgSend([NSObject class], @selector(alloc));
        obj2 = objc_msgSend(obj2, @selector(init));
        
        // runtime 机制, 调用有多个参数的方法
        Rabbit *littleRabit = objc_msgSend(objc_getClass("Rabbit"), sel_registerName("alloc"));
        objc_msgSend(littleRabit, sel_registerName("jumpTo:withCarrots:"), @"tree hole", 2);
        
    }
    return 0;
}


//  15~17L 这段代码会被 前端编译器 Clang 编译为如下代码段

//  id obj = ((NSObject *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("NSObject"), sel_registerName("alloc"));
//
//  obj = ((id (*)(id, SEL))(void *)objc_msgSend)((id)obj, sel_registerName("init"));


