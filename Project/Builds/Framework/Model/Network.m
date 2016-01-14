//
//  Network.m
//  Builds
//
//  Created by PFei_He on 16/1/7.
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
//  ***** 网络管理 *****
//

#import "Network.h"
#import <AFNetworking/AFNetworking.h>

///调试模式
static BOOL debugMode = NO;

@implementation Network

//调试模式
+ (void)setDebugMode:(BOOL)debugOrNot
{
    debugMode = debugOrNot;
}

//单例
+ (Network *)sharedInstance
{
    static Network *sharedInstance = nil;
    static dispatch_once_t PFNetwork_onceToken;
    dispatch_once(&PFNetwork_onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

//发送请求
+ (void)requestWithURL:(NSString *)url params:(NSDictionary *)params results:(void (^)(id JSON))block
{
    //发送请求
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
    if (debugMode) {
        NSLog(@"[ %@ ] request url: %@%@", [Network class], [Network sharedInstance].hostAddress, url);
    }
    [manager POST:[NSString stringWithFormat:@"%@%@", [Network sharedInstance].hostAddress, url] parameters:params?params:@{} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {//请求成功
        if ([responseObject isKindOfClass:[NSDictionary class]]) {
            block(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nonnull task, NSError * _Nonnull error) {//请求失败
        if (debugMode) {
            NSLog(@"[ %@ ] request error: %@", [Network class], error);
        }
        block(nil);
    }];
}

@end
