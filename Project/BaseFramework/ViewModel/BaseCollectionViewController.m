//
//  BaseCollectionViewController.m
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
//  ***** 基础图表视图控制器 *****
//

#import "BaseCollectionViewController.h"
#import "BaseRequest.h"
#import <SVProgressHUD/SVProgressHUD.h>

///调试模式
static BOOL DEBUG_MODE = NO;

@interface BaseCollectionViewController ()

///所有的请求
@property (strong, nonatomic) NSArray *requests;

@end

@implementation BaseCollectionViewController

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
- (void)removeRequests
{
    for (BaseRequest *request in self.requests) {
        [request removeRequester:self];
    }
}

#pragma mark - Notification Management

//请求即将开始
- (void)requestStartedNotification:(NSNotification *)notification
{
    //显示提示框
    [SVProgressHUD showWithStatus:@"加载中"];
    
    if (DEBUG_MODE) {
        NSLog(@"[ PROJECT ][ DEBUG ] Request started with sender: %@.", notification.object);
        NSLog(@"[ PROJECT ][ DEBUG ] Requester: %@.", [self classForCoder]);
    }
}

//请求已经结束
- (void)requestEndedNotification:(NSNotification *)notification
{
    if (_requestSuccess) {//请求成功
        //移除提示框
        [SVProgressHUD dismiss];
    } else {//请求失败
        //显示请求失败的提示框
        [SVProgressHUD showErrorWithStatus:@"请求失败"];
    }
    
    if (DEBUG_MODE) {
        NSLog(@"[ PROJECT ][ DEBUG ] Request ended with sender: %@.", notification.object);
    }
}

//请求成功
- (void)requestSuccessNotification:(NSNotification *)notification
{
    _successObject      = notification.object;
    _additionalObjects  = notification.userInfo;
    _sender             = notification.userInfo[@"sender"];
    _requestSuccess     = YES;
    
    if (DEBUG_MODE) {
        NSLog(@"[ PROJECT ][ DEBUG ] Request success with result: %@.", notification.object);
    }
}

//请求失败
- (void)requestFailedNotification:(NSNotification *)notification
{
    _failedObject       = notification.object;
    _additionalObjects  = notification.userInfo;
    _sender             = notification.userInfo[@"sender"];
    _requestSuccess     = NO;
    
    if (DEBUG_MODE) {
        NSLog(@"[ PROJECT ][ DEBUG ] Request failed with result: %@.", notification.object);
    }
}

#pragma mark - Public Methods

//调试模式
+ (void)debugMode:(BOOL)openOrNot
{
    DEBUG_MODE = openOrNot;
}

@end
