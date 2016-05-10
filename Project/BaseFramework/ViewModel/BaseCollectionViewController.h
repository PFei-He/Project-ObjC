//
//  BaseCollectionViewController.h
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

#import <UIKit/UIKit.h>

@interface BaseCollectionViewController : UICollectionViewController

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
 *  @note 此方法已实现提示框的处理，如需自定义，请自行重写此方法
 *  @param notification: 请求返回的通知对象
 *  @return 无
 */
- (void)requestWillStartNotification:(NSNotification *)notification;

/**
 *  @brief 请求已经结束
 *  @note 此方法已实现提示框的处理，如需自定义，请自行重写此方法
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
