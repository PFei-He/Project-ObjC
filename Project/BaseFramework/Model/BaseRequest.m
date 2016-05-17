//
//  BaseRequest.m
//  Project
//
//  Created by PFei_He on 16/5/9.
//  Copyright © 2016年 PFei_He. All rights reserved.
//
//   __________   __________    _________   ___________  ___________   __________  ___________
//  |  _______ \ |  _______ \  / _______ \ |______   __||  _________| / _________||____   ____|
//  | |       \ || |       \ || /       \ |       | |   | |          | /               | |
//  | |_______/ || |_______/ || |       | |       | |   | |_________ | |               | |
//  |  ________/ |  _____  _/ | |       | | _     | |   |  _________|| |               | |
//  | |          | |     \ \  | |       | || |    | |   | |          | |               | |
//  | |          | |      \ \ | \_______/ || \____/ |   | |_________ | \_________      | |
//  |_|          |_|       \_\ \_________/  \______/    |___________| \__________|     |_|
//
//
//  The framework design by https://github.com/PFei-He/Project-ObjC
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

#import "BaseRequest.h"
#import <AFNetworking/AFNetworking.h>

///调试模式
static BOOL DEBUG_MODE = NO;

@implementation BaseRequest

//调试模式
+ (void)debugMode:(BOOL)openOrNot
{
    DEBUG_MODE = openOrNot;
}

//单例
+ (BaseRequest *)sharedInstance
{
    static BaseRequest *sharedInstance = nil;
    static dispatch_once_t BaseRequest_onceToken;
    dispatch_once(&BaseRequest_onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
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
    //发送请求开始的通知
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Started"] object:[self classForCoder]];
    
    if (DEBUG_MODE) {
        NSLog(@"[ PROJECT ][ DEBUG ] Request url: %@%@.", [BaseRequest sharedInstance].hostAddress, api);
        if (![params isEqualToDictionary:@{}]) {
            NSLog(@"[ PROJECT ][ DEBUG ] Request params: %@.", params);
        }
    }
    
    //发送请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    
    [manager POST:[NSString stringWithFormat:@"%@%@", [BaseRequest sharedInstance].hostAddress, api] parameters:params?params:@{} success:^(NSURLSessionDataTask * _Nonnull task, id _Nonnull responseObject) {//请求成功
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            block(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {//请求失败
        if (DEBUG_MODE) {
            NSLog(@"[ PROJECT ][ DEBUG ] Request error: %@.", error);
        }
        block(nil);
    }];
}

//添加请求者
- (void)addRequester:(id)requester
{
    [[NSNotificationCenter defaultCenter] addObserver:requester selector:NSSelectorFromString(@"requestStartedNotification:") name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Started"] object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:requester selector:NSSelectorFromString(@"requestEndedNotification:") name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Ended"] object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:requester selector:NSSelectorFromString(@"requestSuccessNotification:") name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Success"] object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:requester selector:NSSelectorFromString(@"requestFailedNotification:") name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Failed"] object:nil];
}

//请求即将开始
//- (void)requestWillStart
//{
//    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"WillStart"] object:[self classForCoder]];
//}

//请求已经结束
//- (void)requestWasEnded
//{
//    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"WasEnded"] object:[self classForCoder]];
//}

//请求成功
- (void)requestSuccessWithObject:(id)object
{
    //发送请求成功通知
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Success"] object:object userInfo:@{@"sender": [self classForCoder]}];
    
    //发送请求结束通知
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Ended"] object:[self classForCoder]];
}

//请求成功
- (void)requestSuccessWithObject:(id)object userInfo:(NSDictionary *)userInfo
{
    //发送请求成功通知
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:userInfo];
    [dictionary addEntriesFromDictionary:@{@"sender": [self classForCoder]}];
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Success"] object:object userInfo:dictionary];
    
    //发送请求结束通知
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Ended"] object:[self classForCoder]];
}

//请求失败
- (void)requestFailedWithObject:(id)object
{
    //发送请求失败通知
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Failed"] object:object userInfo:@{@"sender": [self classForCoder]}];
    
    //发送请求结束通知
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Ended"] object:[self classForCoder]];
}

//请求失败
- (void)requestFailedWithObject:(id)object userInfo:(NSDictionary *)userInfo
{
    //发送请求失败通知
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:userInfo];
    [dictionary addEntriesFromDictionary:@{@"sender": [self classForCoder]}];
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Failed"] object:object userInfo:dictionary];
    
    //发送请求结束通知
    [[NSNotificationCenter defaultCenter] postNotificationName:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Ended"] object:[self classForCoder]];
}

//移除请求者
- (void)removeRequester:(id)requester
{
    [[NSNotificationCenter defaultCenter] removeObserver:requester name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Started"] object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:requester name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Ended"] object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:requester name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Success"] object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:requester name:[NSString stringWithFormat:@"%@%@", [self classForCoder], @"Failed"] object:nil];
}

@end
