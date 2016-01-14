//
//  NSString+PFObjC.h
//  PFObjC
//
//  Created by PFei_He on 15/11/17.
//  Copyright © 2015年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/PFObjC
//
//  vesion: 0.2.3
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
//  ***** NSString类目 *****
//

#import <Foundation/Foundation.h>

@interface NSString (PFJudge)

/**
 *  @brief 判断是否QQ号码
 *  @note 无
 *  @param 无
 *  @return 判断结果
 */
- (BOOL)isQQ;

/**
 *  @brief 判断是否邮箱地址
 *  @note 无
 *  @param 无
 *  @return 判断结果
 */
- (BOOL)isEmail;

/**
 *  @brief 判断是否URL
 *  @note 无
 *  @param 无
 *  @return 判断结果
 */
- (BOOL)isURL;

/**
 *  @brief 判断是否手机号码
 *  @note 无
 *  @param 无
 *  @return 判断结果
 */
- (BOOL)isMobilePhoneNumber;

/**
 *  @brief 判断是否ip地址
 *  @note 无
 *  @param 无
 *  @return 判断结果
 */
- (BOOL)isIPAddress;

/**
 *  @brief 匹配邮箱地址
 *  @note 无
 *  @param string: 需要匹配的字符串
 *  @return 寻找出的邮箱地址
 */
- (NSString *)matchesEmail:(NSString *)string;

/**
 *  @brief 匹配URL
 *  @note 无
 *  @param string: 需要匹配的字符串
 *  @return 寻找出的URL
 */
- (NSString *)matchesURL:(NSString *)string;

@end

@interface NSString (PFLocalized)

/**
 *  @brief 本地化
 *  @note 无
 *  @param 无
 *  @return 当前语言环境对应的值
 */
- (NSString *)localized;

/**
 *  @brief 本地化带注释
 *  @note 无
 *  @param comment: 本地化文件中的注释
 *  @return 当前语言环境对应的值
 */
- (NSString *)localizedWithComment:(NSString *)comment;

@end
