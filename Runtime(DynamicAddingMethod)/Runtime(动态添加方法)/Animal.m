//
//  Animal.m
//  Runtime(动态添加方法)
//
//  Created by Herbert Hu on 16/10/11.
//  Copyright © 2016年 Herbert Hu. All rights reserved.
//

#import "Animal.h"
#import <objc/message.h>

@implementation Animal

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    
    
    if (sel == NSSelectorFromString(@"learnHunting")) {
        
        class_addMethod([self class], sel, (IMP)learnHunting, "v@:");
        
        return YES;
    }
    
    if (sel == NSSelectorFromString(@"run")) {
        
        class_addMethod([self class], sel, (IMP)run, "v@:@");
        
        return YES;
    }
    
    return [super resolveInstanceMethod:sel];
}

void learnHunting(id self, SEL _cmd) {
    
    NSLog(@"This lion will learn how to hunt.");
}

void run(id self, SEL _cmd, NSNumber *numOfTurns) {
    
    NSLog(@"This lion will run %@ %@.", numOfTurns, ([numOfTurns isEqual:@1])?@"turn":@"turns");
}

@end
