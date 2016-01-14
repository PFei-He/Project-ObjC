//
//  Initialization.h
//  Project
//
//  Created by PFei_He on 16/1/6.
//  Copyright © 2016年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/Project-ObjC
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
//  ***** 初始化 *****
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Initialization : NSObject

/**
 *  @brief 初始化登录页
 *  @note 无
 *  @param 无
 *  @return 根视图控制器
 */
+ (UIViewController *)initLaunch;

/**
 *  @brief 初始化主机地址
 *  @note 无
 *  @param url: 主机地址
 *  @return 无
 */
+ (void)initHost:(NSString *)url;

/**
 *  @brief 初始化接口
 *  @note 无
 *  @param 无
 *  @return 无
 */
+ (void)initApi;

/**
 *  @brief 初始化用户文件
 *  @note 无
 *  @param 无
 *  @return 无
 */
+ (void)initUserFile;

@end
