//
//  ViewController.m
//  Runtime(动态添加方法)
//
//  Created by Herbert Hu on 16/10/11.
//  Copyright © 2016年 Herbert Hu. All rights reserved.
//

#import "ViewController.h"
#import "Animal.h"
#import <objc/message.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    Animal *lion = [[Animal alloc] init];
    
    [lion performSelector:@selector(learnHunting)];
    [lion performSelector:@selector(run) withObject:@7];

    
    // 获取方法 setFilled: 的地址(函数指针), 直接调用函数.
    // 避免了每次方法执行发消息的开销.
    
    void (*setter)(id, SEL, BOOL);
    
    setter = (void (*)(id, SEL, BOOL))[self methodForSelector:@selector(setFilled:)];
    
    int i;
    
    for (i = 0 ; i < 10 ; i++) {
        
        setter(self, @selector(setFilled:), YES);
    }
}

- (void)setFilled:(BOOL)isFilled {
    
    NSLog(@"setFilled method imp.");
}

@end
