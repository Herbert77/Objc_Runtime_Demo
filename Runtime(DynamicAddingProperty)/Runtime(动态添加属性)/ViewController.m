//
//  ViewController.m
//  Runtime(动态添加属性)
//
//  Created by Herbert Hu on 16/10/12.
//  Copyright © 2016年 Herbert Hu. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+AddProperty.h"

// 动态添加属性的本质:
// 让某个属性与对象产生关联.

// 需求:让 NSObject 类, 保存一个字符串.

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSObject *obj = [[NSObject alloc] init];
    
    // NSObject 类属于系统类, 并不具有 name 属性.
    // 通过 NSObject 分类, 动态添加.
    obj.name = @"Peter";
    
    NSLog(@"obj.name = %@", [obj name]);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
