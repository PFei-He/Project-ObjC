//
//  BasisRequest.h
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

#import <PFObjC/PFObjC.h>

@interface BasisRequest : PFModel

///请求地址的接口
@property (copy, nonatomic) NSString *requestAPI;

/**
 *  @brief 调试模式
 *  @note 无
 *  @param YES 或 NO
 *  @return 无
 */
+ (void)setDebugMode:(BOOL)debugOrNot;

/**
 *  @brief 发送请求
 *  @note 无
 *  @param JSON: 请求返回的JSON数据
 *  @return 无
 */
- (void)send:(void (^)(id JSON))block;

/**
 *  @brief 发送请求
 *  @note 无
 *  @param api: 接口地址
 *  @param JSON: 请求返回的JSON数据
 *  @return 无
 */
- (void)sendWithAPI:(NSString *)api results:(void (^)(id JSON))block;

/**
 *  @brief 发送请求
 *  @note 无
 *  @param api: 接口地址
 *  @param params: 请求参数
 *  @param JSON: 请求返回的JSON数据
 *  @return 无
 */
- (void)sendWithAPI:(NSString *)api params:(NSDictionary *)params results:(void (^)(id JSON))block;

/**
 *  @brief 添加请求者
 *  @note 无
 *  @param requester: 请求者
 *  @return 无
 */
- (void)addRequester:(id)requester;

/**
 *  @brief 请求即将开始
 *  @note 无
 *  @param 无
 *  @return 无
 */
- (void)requestWillStart;

/**
 *  @brief 请求已经结束
 *  @note 无
 *  @param 无
 *  @return 无
 */
- (void)requestWasEnded;

/**
 *  @brief 请求成功
 *  @note 无
 *  @param object: 请求结果
 *  @return 无
 */
- (void)requestSuccessWithObject:(id)object;

/**
 *  @brief 请求成功
 *  @note 无
 *  @param object: 请求结果
 *  @param userInfo: 附带参数
 *  @return 无
 */
- (void)requestSuccessWithObject:(id)object userInfo:(NSDictionary *)userInfo;

/**
 *  @brief 请求失败
 *  @note 无
 *  @param object: 请求结果
 *  @return 无
 */
- (void)requestFailedWithObject:(id)object;

/**
 *  @brief 请求失败
 *  @note 无
 *  @param object: 请求结果
 *  @param userInfo: 附带参数
 *  @return 无
 */
- (void)requestFailedWithObject:(id)object userInfo:(NSDictionary *)userInfo;

/**
 *  @brief 移除请求者
 *  @note 无
 *  @param requester: 请求者
 *  @return 无
 */
- (void)removeRequester:(id)requester;

@end
