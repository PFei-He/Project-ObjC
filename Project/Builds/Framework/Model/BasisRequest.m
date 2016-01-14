//
//  BasisRequest.m
//  Builds
//
//  Created by PFei_He on 16/1/8.
//  Copyright © 2016年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/Project-ObjC
//
//  vesion: 0.0.1
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//
//  ***** 基础请求处理 *****
//

#import "BasisRequest.h"
#import "Network.h"

///调试模式
static BOOL debugMode = NO;

@implementation BasisRequest

//调试模式
+ (void)setDebugMode:(BOOL)debugOrNot
{
    debugMode = debugOrNot;
}

//发送请求
- (void)send:(void (^)(id))block
{
    [self sendWithAPI:self.requestAPI results:block];
}

//发送请求
- (void)sendWithAPI:(NSString *)api results:(void (^)(id))block
{
    [self sendWithAPI:api params:[self createJSON] results:block];
}

//发送请求
- (void)sendWithAPI:(NSString *)api params:(NSDictionary *)params results:(void (^)(id))block
{
    if (debugMode) {
        NSLog(@"[ %@ ] request sender: %@", [Network class], [self classForCoder]);
        if (![params isEqualToDictionary:@{}]) {
            NSLog(@"[ %@ ] request params: %@", [self classForCoder], params);
        }
    }
    [Network requestWithURL:api params:params results:block];
}

//添加请求者
- (void)addRequester:(id)requester
{
    [[NSNotificationCenter defaultCenter] addObserver:requester selector:NSSelectorFromString(@"requestWillStartNotification:") name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"WillStart"] object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:requester selector:NSSelectorFromString(@"requestWasEndedNotification:") name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"WasEnded"] object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:requester selector:NSSelectorFromString(@"requestSuccessNotification:") name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Success"] object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:requester selector:NSSelectorFromString(@"requestFailedNotification:") name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Failed"] object:nil];
}

//请求即将开始
- (void)requestWillStart
{
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"WillStart"] object:[self classForCoder]];
}

//请求已经结束
- (void)requestWasEnded
{
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"WasEnded"] object:[self classForCoder]];
}

//请求成功
- (void)requestSuccessWithObject:(id)object
{
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Success"] object:object userInfo:@{@"sender": [self classForCoder]}];
}

//请求成功
- (void)requestSuccessWithObject:(id)object userInfo:(NSDictionary *)userInfo
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:userInfo];
    [dictionary addEntriesFromDictionary:@{@"sender": [self classForCoder]}];
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Success"] object:object userInfo:dictionary];
}

//请求失败
- (void)requestFailedWithObject:(id)object
{
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Failed"] object:object userInfo:@{@"sender": [self classForCoder]}];
}

//请求失败
- (void)requestFailedWithObject:(id)object userInfo:(NSDictionary *)userInfo
{
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:userInfo];
    [dictionary addEntriesFromDictionary:@{@"sender": [self classForCoder]}];
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Failed"] object:object userInfo:dictionary];
}

//移除请求者
- (void)removeRequester:(id)requester
{
    [[NSNotificationCenter defaultCenter] removeObserver:requester name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"WillStart"] object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:requester name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"WasEnded"] object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:requester name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Success"] object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:requester name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Failed"] object:nil];
}

@end
