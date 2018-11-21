//
//  HThreadQueue.h
//  ImmerseTeachings
//
//  Created by 金色榜样研发组 on 2018/9/25.
//  Copyright © 2018年 Golden Bangyang (beijing) Cul Ture Media Investment Co. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HThreadQueue : NSObject

+ (instancetype _Nonnull) defaultQueue;

/**
 * 执行一个异步任务（背景线程执行）
 *
 * @param block 背景任务
 */
- (void)asyncWork:(void (^_Nonnull)(void))block;

/**
 * 延时执行一个异步任务（背景线程执行）
 * @param ms 延时时间（单位：毫秒）
 * @param block 背景任务
 */
- (void)asyncWorkWithDelay:(NSUInteger)ms work:(void (^_Nonnull)(void))block;

/**
 * 执行一个异步任务（背景线程执行）,当背景作务执行完成后，在主线程执行 ui 操作。
 *
 * @param block 任务
 * @param ui UI操作任务
 */
- (void)asyncWork:(id _Nullable (^ _Nonnull)(void))block
             main:(void(^ _Nullable)(id _Nullable result))ui;

/**
 * 延时执行一个异步任务（背景线程执行）,当背景作务执行完成后，在主线程执行 ui 操作。
 *
 * @param ms 延时时间（单位：毫秒）
 * @param block 任务
 * @param ui UI操作任务
 */
- (void)asyncWorkWithDelay:(NSUInteger)ms
                      work:(id _Nullable (^ _Nonnull)(void))block
                      main:(void(^ _Nullable)(id _Nullable result))ui;

/**
 * 执行一个异步任务（主线程执行）
 *
 * @param block 任务
 */
- (void)asyncMain:(void (^ _Nonnull)(void))block;

/**
 * 执行一个异步任务（主线程执行）
 *
 * @param ms 延时时间（单位：毫秒）
 * @param block 任务
 */
- (void)asyncMainWithDelay:(NSUInteger)ms
                      main:(void (^ _Nonnull)(void))block;

#pragma mark -
#pragma mark Override

/**
 * 入列一个异步工作任务（背景线程），该方法供子类重字用，不要直接调用。
 *
 * @param ms 延时时间（单位：毫秒）
 * @param block 任务
 */
- (void)onEnqueueWithDelay:(NSUInteger)ms
                      work:(void (^_Nonnull)(void))block;
@end
