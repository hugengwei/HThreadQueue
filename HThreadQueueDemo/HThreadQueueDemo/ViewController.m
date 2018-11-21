//
//  ViewController.m
//  HThreadQueueDemo
//
//  Created by 金色榜样研发组 on 2018/11/21.
//  Copyright © 2018年 Golden Bangyang (beijing) Cul Ture Media Investment Co. All rights reserved.
//

#import "ViewController.h"
#import "HThreadQueue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self demo1];
}

//执行一个异步任务（子线程执行）
- (void)demo1
{
    [[HThreadQueue defaultQueue] asyncWork:^{
        NSLog(@"%@",[NSThread currentThread]);
    }];
}

- (void)dealloc
{
    
}

@end
