//
//  PFTime.h
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
//  ***** 时间获取和转换 *****
//

#import <Foundation/Foundation.h>

@interface PFTime : NSObject

/**
 *  @brief 获取当前时间
 *  @note 时间为标准格式 yyyy-MM-dd HH:mm:ss
 *  @param 无
 *  @return 当前时间
 */
+ (NSString *)currentTime;

/**
 *  @brief 获取当前时间
 *  @note 无
 *  @param format: 日期时间格式
 *  @return 当前时间
 */
+ (NSString *)currentTimeWithFormat:(NSString *)format;

/**
 *  @brief 获取当前时间
 *  @note 无
 *  @param dateStyle: 日期格式
 *  @param timeStyle: 时间格式
 *  @return 当前时间
 */
+ (NSString *)currentTimeWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

/**
 *  @brief 将时间戳转换为时间
 *  @note 时间为标准格式 yyyy-MM-dd HH:mm:ss
 *  @param timestamp: 时间戳
 *  @return 时间
 */
+ (NSString *)timeFromTimestamp:(double)timestamp;

/**
 *  @brief 将时间戳转换为时间
 *  @note 无
 *  @param timestamp: 时间戳
 *  @param format: 日期时间格式
 *  @return 时间
 */
+ (NSString *)timeFromTimestamp:(double)timestamp format:(NSString *)format;

/**
 *  @brief 将时间戳转换为时间
 *  @note 无
 *  @param timestamp: 时间戳
 *  @param dateStyle: 日期格式
 *  @param timeStyle: 时间格式
 *  @return 时间
 */
+ (NSString *)timeFromTimestamp:(double)timestamp dateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

/**
 *  @brief 获取当前时间戳
 *  @note 无
 *  @param 无
 *  @return 当前时间戳
 */
+ (NSString *)currentTimestamp;

/**
 *  @brief 将时间转换为时间戳
 *  @note 时间为标准格式 yyyy-MM-dd HH:mm:ss
 *  @param time: 时间
 *  @return 时间戳
 */
+ (NSString *)timestampFromTime:(NSString *)time;

/**
 *  @brief 将时间转换为时间戳
 *  @note 无
 *  @param time: 时间
 *  @param format: 日期时间格式
 *  @return 时间戳
 */
+ (NSString *)timestampFromTime:(NSString *)time format:(NSString *)format;

/**
 *  @brief 将时间转换为时间戳
 *  @note 无
 *  @param time: 时间
 *  @param dateStyle: 日期格式
 *  @param timeStyle: 时间格式
 *  @return 时间戳
 */
+ (NSString *)timestampFromTime:(NSString *)time dateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle;

/**
 *  @brief 获取当前时区
 *  @note 无
 *  @param 无
 *  @return 当前时区
 */
+ (NSTimeZone *)currentTimeZone;

@end
