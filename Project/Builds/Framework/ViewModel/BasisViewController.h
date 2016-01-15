//
//  BasisViewController.h
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
//  ***** 基础视图控制器 *****
//

#import <UIKit/UIKit.h>

@interface BasisViewController : UIViewController

///请求成功返回的结果
@property (strong, nonatomic, readonly) id successObject;

///请求失败返回的结果
@property (strong, nonatomic, readonly) id failedObject;

///请求返回的附加结果
@property (strong, nonatomic, readonly) id additionalObjects;

///请求的发送者
@property (strong, nonatomic, readonly) id sender;

///请求是否成功
@property (nonatomic, readonly) BOOL requestSuccess;

/**
 *  @brief 调试模式
 *  @note 无
 *  @param YES 或 NO
 *  @return 无
 */
+ (void)setDebugMode:(BOOL)debugOrNot;

/**
 *  @brief 初始化请求
 *  @note 无
 *  @param requests: 所有的请求
 *  @return 无
 */
- (void)initRequests:(NSArray *)requests;

/**
 *  @brief 移除请求
 *  @note 无
 *  @param requests: 所有的请求
 *  @return 无
 */
//- (void)removeRequests:(NSArray *)requests;

/**
 *  @brief 请求即将开始
 *  @note 无
 *  @param notification: 请求返回的通知对象
 *  @return 无
 */
- (void)requestWillStartNotification:(NSNotification *)notification;

/**
 *  @brief 请求已经结束
 *  @note 无
 *  @param notification: 请求返回的通知对象
 *  @return 无
 */
- (void)requestWasEndedNotification:(NSNotification *)notification;

/**
 *  @brief 请求成功的通知
 *  @note 无
 *  @param notification: 请求返回的通知对象
 *  @return 无
 */
- (void)requestSuccessNotification:(NSNotification *)notification;

/**
 *  @brief 请求失败的通知
 *  @note 无
 *  @param notification: 请求返回的通知对象
 *  @return 无
 */
- (void)requestFailedNotification:(NSNotification *)notification;

@end
