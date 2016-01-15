//
//  BasisTableViewController.m
//  Builds
//
//  Created by PFei_He on 16/1/7.
//  Copyright © 2016年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/Project-ObjC
//
//  vesion: 0.0.2
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
//  ***** 基础列表视图控制器 *****
//

#import "BasisTableViewController.h"
#import "BasisRequest.h"
#import <SVProgressHUD/SVProgressHUD.h>

///调试模式
static BOOL debugMode = NO;

@interface BasisTableViewController ()

///所有的请求
@property (strong, nonatomic) NSArray *requests;

@end

@implementation BasisTableViewController

#pragma mark - Life Cycle

- (void)dealloc
{
    [self removeRequests];
}

#pragma mark - Request Management

//初始化请求
- (void)initRequests:(NSArray *)requests
{
    self.requests = requests;
    for (BasisRequest *request in requests) {
        [request addRequester:self];
    }
}

//移除请求
//- (void)removeRequests:(NSArray *)requests
//{
//    for (PFModel *request in requests) {
//        [request removeRequester:self];
//    }
//}

//移除请求
- (void)removeRequests
{
    for (BasisRequest *request in self.requests) {
        [request removeRequester:self];
    }
}

#pragma mark - Notification Management

//请求即将开始
- (void)requestWillStartNotification:(NSNotification *)notification
{
    //显示提示框
    [SVProgressHUD showWithStatus:@"加载中"];
    
    if (debugMode) {
        NSLog(@"[ %@ ] request will start with sender: %@", [self classForCoder], notification.object);
    }
}

//请求已经结束
- (void)requestWasEndedNotification:(NSNotification *)notification
{
    if (_requestSuccess) {//请求成功
        //移除提示框
        [SVProgressHUD dismiss];
    } else {//请求失败
        //显示请求失败的提示框
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }
    
    if (debugMode) {
        NSLog(@"[ %@ ] request was ended with sender: %@", [self classForCoder], notification.object);
    }
}

//请求成功
- (void)requestSuccessNotification:(NSNotification *)notification
{
    _successObject      = notification.object;
    _additionalObjects  = notification.userInfo;
    _sender             = notification.userInfo[@"sender"];
    _requestSuccess     = YES;
    
    if (debugMode) {
        NSLog(@"[ %@ ] request result: %@", [_sender classForCoder], notification.object);
    }
}

//请求失败
- (void)requestFailedNotification:(NSNotification *)notification
{
    _failedObject       = notification.object;
    _additionalObjects  = notification.userInfo;
    _sender             = notification.userInfo[@"sender"];
    _requestSuccess     = NO;
    
    if (debugMode) {
        NSLog(@"[ %@ ] request result: %@", [_sender classForCoder], notification.object);
    }
}

#pragma mark - Public Methods

//调试模式
+ (void)setDebugMode:(BOOL)debugOrNot
{
    debugMode = debugOrNot;
}

@end
