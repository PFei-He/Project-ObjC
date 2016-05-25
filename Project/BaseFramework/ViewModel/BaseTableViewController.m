//
//  BaseTableViewController.m
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
//  ***** 基础列表视图控制器 *****
//

#import "BaseTableViewController.h"
#import "BaseRequest.h"
#import <SVProgressHUD/SVProgressHUD.h>

///调试模式
static BOOL DEBUG_MODE = NO;

@interface BaseTableViewController ()

///所有的请求
@property (strong, nonatomic) NSArray *requests;

@end

@implementation BaseTableViewController

#pragma mark - Life Cycle

- (void)dealloc
{
    [self removeAllRequests];
}

#pragma mark - Request Management

//初始化请求
- (void)addRequests:(NSArray *)requests
{
    self.requests = requests;
    for (BaseRequest *request in requests) {
        [request addRequester:self];
    }
}

//移除请求
//- (void)removeRequests:(NSArray *)requests
//{
//    for (BaseRequest *request in requests) {
//        [request removeRequester:self];
//    }
//}

//移除请求
- (void)removeAllRequests
{
    for (BaseRequest *request in self.requests) {
        [request removeRequester:self];
    }
}

#pragma mark - Notification Management

//请求开始通知
- (void)requestStartedNotification:(NSNotification *)notification
{
    if (DEBUG_MODE) {//调试模式
        NSLog(@"[ PROJECT ][ DEBUG ] Request started with sender: %@.", notification.object);
        NSLog(@"[ PROJECT ][ DEBUG ] Requester: %@.", [self classForCoder]);
    }
    
    //请求开始
    [self requestStarted];
}

//请求结束通知
- (void)requestEndedNotification:(NSNotification *)notification
{
    if (DEBUG_MODE) {//调试模式
        NSLog(@"[ PROJECT ][ DEBUG ] Request ended with sender: %@.", notification.object);
    }
    
    //请求结束
    [self requestEnded];
}

//请求成功通知
- (void)requestSuccessNotification:(NSNotification *)notification
{
    if (DEBUG_MODE) {//调试模式
        NSLog(@"[ PROJECT ][ DEBUG ] Request success with result: %@.", notification.object);
    }
    
    //处理请求结果
    _successObject      = notification.object;
    if ([notification.userInfo isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:(NSDictionary *)notification.userInfo];
        [dictionary removeObjectForKey:@"sender"];
        _additionalObjects = dictionary;
    }
    _sender             = notification.userInfo[@"sender"];
    _requestIsSuccess   = YES;
    
    //请求成功
    [self requestSuccess];
}

//请求失败通知
- (void)requestFailedNotification:(NSNotification *)notification
{
    if (DEBUG_MODE) {//调试模式
        NSLog(@"[ PROJECT ][ DEBUG ] Request failed with result: %@.", notification.object);
    }
    
    //处理请求结果
    _failureObject      = notification.object;
    if ([notification.userInfo isKindOfClass:[NSDictionary class]]) {
        NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:(NSDictionary *)notification.userInfo];
        [dictionary removeObjectForKey:@"sender"];
        _additionalObjects = dictionary;
    }
    _sender             = notification.userInfo[@"sender"];
    _requestIsSuccess   = NO;
    
    //请求失败
    [self requestFailed];
}

#pragma mark - Public Methods

//请求开始
- (void)requestStarted
{
    //显示提示框
    [SVProgressHUD showWithStatus:@"加载中"];
}

//请求结束
- (void)requestEnded
{
    if (_requestIsSuccess) {//请求成功
        //移除提示框
        [SVProgressHUD dismiss];
    } else {//请求失败
        //显示请求失败的提示框
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }
}

//请求成功
- (void)requestSuccess
{
    // Override this method to process the request when request success.
}

//请求失败
- (void)requestFailed
{
    // Override this method to process the request when request failed.
}

//调试模式
+ (void)debugMode:(BOOL)openOrNot
{
    DEBUG_MODE = openOrNot;
}

@end
