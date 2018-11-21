//
//  HThreadQueue.m
//  ImmerseTeachings
//
//  Created by 金色榜样研发组 on 2018/9/25.
//  Copyright © 2018年 Golden Bangyang (beijing) Cul Ture Media Investment Co. All rights reserved.
//

#import "HThreadQueue.h"
/** 获取延时时间，单位：毫秒*/
#define  WLDelayTime(wlec) dispatch_time(DISPATCH_TIME_NOW,(dispatch_time_t)(NSEC_PER_MSEC * (dispatch_time_t)wlec))
@implementation HThreadQueue
+ (instancetype _Nonnull) defaultQueue
{
    return [[self alloc] init];
}

/**
 * 执行一个异步任务（背景线程执行）
 *
 * @param block 背景任务
 */
- (void)asyncWork:(void (^_Nonnull)(void))block
{
    [self asyncWorkWithDelay:0 work:block];
}

/**
 * 延时执行一个异步任务（背景线程执行）
 * @param ms 延时时间（单位：毫秒）
 * @param block 背景任务
 */
- (void)asyncWorkWithDelay:(NSUInteger)ms work:(void (^_Nonnull)(void))block
{
    [self onEnqueueWithDelay:ms work:block];
}

/**
 * 执行一个异步任务（背景线程执行）,当背景作务执行完成后，在主线程执行 ui 操作。
 *
 * @param block 任务
 * @param ui UI操作任务
 */
- (void)asyncWork:(id _Nullable (^ _Nonnull)(void))block
             main:(void(^ _Nullable)(id _Nullable result))ui
{
    [self asyncWorkWithDelay:0 work:block main:ui];
}

/**
 * 延时执行一个异步任务（背景线程执行）,当背景作务执行完成后，在主线程执行 ui 操作。
 *
 * @param ms 延时时间（单位：毫秒）
 * @param block 任务
 * @param ui UI操作任务
 */
- (void)asyncWorkWithDelay:(NSUInteger)ms
                      work:(id _Nullable (^ _Nonnull)(void))block
                      main:(void(^ _Nullable)(id _Nullable result))ui
{
    [self onEnqueueWithDelay:ms
                        work:^{
                            __block id result = block();
                            if (ui){
                                dispatch_sync(dispatch_get_main_queue(), ^{
                                    ui(result);
                                });
                            }
                        }];
}

/**
 * 执行一个异步任务（主线程执行）
 *
 * @param block 任务
 */
- (void)asyncMain:(void (^ _Nonnull)(void))block
{
    [self asyncMainWithDelay:0 main:block];
}

/**
 * 执行一个异步任务（主线程执行）
 *
 * @param ms 延时时间（单位：毫秒）
 * @param block 任务
 */
- (void)asyncMainWithDelay:(NSUInteger)ms
                      main:(void (^ _Nonnull)(void))block
{
    if (ms == 0) {
        dispatch_async(dispatch_get_main_queue(), block);
    } else {
        dispatch_after(WLDelayTime(ms), dispatch_get_main_queue(), block);
    }
    
}

#pragma mark -
#pragma mark Override

/**
 * 入列一个异步工作任务（背景线程），该方法供子类重字用，不要直接调用。
 *
 * @param block 任务
 */
- (void)onEnqueueWithDelay:(NSUInteger)ms
                      work:(void (^_Nonnull)(void))block
{
    if (ms == 0) {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
    } else {
        dispatch_after(WLDelayTime(ms),dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
    }
}

@end
