//
//  PFTime.m
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

#import "PFTime.h"
#import "NSDate+PFObjC.h"

@implementation PFTime

//获取当前时间
+ (NSString *)currentTime
{
    return [NSDate stringFromDate:[NSDate date]];
}

//获取当前时间
+ (NSString *)currentTimeWithFormat:(NSString *)format
{
    return [NSDate stringFromDate:[NSDate date] format:format];
}

//获取当前时间
+ (NSString *)currentTimeWithDateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    return [NSDate stringFromDate:[NSDate date] dateStyle:dateStyle timeStyle:timeStyle];
}

//将时间戳转换为时间
+ (NSString *)timeFromTimestamp:(double)timestamp
{
    return [NSDate stringFromDate:[NSDate dateWithTimeIntervalSince1970:timestamp]];
}

//将时间戳转换为时间
+ (NSString *)timeFromTimestamp:(double)timestamp format:(NSString *)format
{
    return [NSDate stringFromDate:[NSDate dateWithTimeIntervalSince1970:timestamp] format:format];
}

//将时间戳转换为时间
+ (NSString *)timeFromTimestamp:(double)timestamp dateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    return [NSDate stringFromDate:[NSDate dateWithTimeIntervalSince1970:timestamp] dateStyle:dateStyle timeStyle:timeStyle];
}

//获取当前时间戳
+ (NSString *)currentTimestamp
{
    return [NSString stringWithFormat:@"%ld", (long)[[NSDate date] timeIntervalSince1970]];
}

//将时间转换为时间戳
+ (NSString *)timestampFromTime:(NSString *)time
{
    return [NSString stringWithFormat:@"%ld", (long)[[NSDate dateFromString:time] timeIntervalSince1970]];
}

//将时间转换为时间戳
+ (NSString *)timestampFromTime:(NSString *)time format:(NSString *)format
{
    return [NSString stringWithFormat:@"%ld", (long)[[NSDate dateFromString:time format:format] timeIntervalSince1970]];
}

//将时间转换为时间戳
+ (NSString *)timestampFromTime:(NSString *)time dateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    return [NSString stringWithFormat:@"%ld", (long)[[NSDate dateFromString:time dateStyle:dateStyle timeStyle:timeStyle] timeIntervalSince1970]];
}

//获取当前时区
+ (NSTimeZone *)currentTimeZone
{
    return [NSTimeZone systemTimeZone];
}

@end
