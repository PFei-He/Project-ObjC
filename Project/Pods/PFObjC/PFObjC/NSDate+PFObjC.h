//
//  NSDate+PFObjC.h
//  PFObjC
//
//  Created by PFei_He on 15/11/19.
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
//  ***** NSDate类目 *****
//

#import <Foundation/Foundation.h>

@interface NSDate (PFObjC)

/**
 *  @brief 将日期时间转换为当前时区日期时间
 *  @note 无
 *  @param date: 日期时间
 *  @return 当前时区日期时间
 */
+ (NSDate *)dateFromCurrentTimeZoneDate:(NSDate *)date;

/**
 *  @brief 将字符串转换为日期时间
 *  @note 时间为标准格式 yyyy-MM-dd HH:mm:ss
 *  @param string: 时间字符串
 *  @return 日期时间
 */
+ (NSDate *)dateFromString:(NSString *)string;

/**
 *  @brief 将字符串转换为日期时间
 *  @note 无
 *  @param string: 时间字符串
 *  @param format: 日期时间格式
 *  @return 日期时间
 */
+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format;

/**
 *  @brief 将字符串转换为日期时间
 *  @note 无
 *  @param string: 时间字符串
 *  @param dateStyle: 日期格式
 *  @param timeStyle: 时间格式
 *  @return 日期时间
 */
+ (NSDate *)dateFromString:(NSString *)string dateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

/**
 *  @brief 将日期时间转换为字符串
 *  @note 时间为标准格式 yyyy-MM-dd HH:mm:ss
 *  @param date: 日期时间
 *  @return 时间字符串
 */
+ (NSString *)stringFromDate:(NSDate *)date;

/**
 *  @brief 将日期时间转换为字符串
 *  @note 无
 *  @param date: 日期时间
 *  @param format: 日期时间格式
 *  @return 时间字符串
 */
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format;

/**
 *  @brief 将日期时间转换为字符串
 *  @note 无
 *  @param date: 日期时间
 *  @param dateStyle: 日期格式
 *  @param timeStyle: 时间格式
 *  @return 时间字符串
 */
+ (NSString *)stringFromDate:(NSDate *)date dateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

@end
