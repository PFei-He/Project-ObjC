//
//  NSDate+PFObjC.m
//  PFObjC
//
//  Created by PFei_He on 15/11/19.
//  Copyright © 2015年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/PFObjC
//
//  vesion: 0.4.0
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

#import "NSDate+PFObjC.h"
#import "PFTime.h"

@implementation NSDate (PFObjC)

///日期时间格式器
+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format dateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    if (format) {
        formatter.dateFormat = format;
    } else if (dateStyle != NSDateFormatterNoStyle && timeStyle != NSDateFormatterNoStyle) {
        formatter.dateStyle = dateStyle;
        formatter.timeStyle = timeStyle;
    }
    return formatter;
}

//将日期时间转换为当前时区日期时间
+ (NSDate *)dateFromCurrentTimeZoneDate:(NSDate *)date
{
    return [date dateByAddingTimeInterval:[[PFTime currentTimeZone] secondsFromGMTForDate:date]];
}

//将字符串转换为日期时间
+ (NSDate *)dateFromString:(NSString *)string
{
    return [[NSDate dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss" dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterNoStyle] dateFromString:string];
}

//将字符串转换为日期时间
+ (NSDate *)dateFromString:(NSString *)string format:(NSString *)format
{
    return [[NSDate dateFormatterWithFormat:format dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterNoStyle] dateFromString:string];
}

//将字符串转换为日期时间
+ (NSDate *)dateFromString:(NSString *)string dateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    return [[NSDate dateFormatterWithFormat:nil dateStyle:dateStyle timeStyle:timeStyle] dateFromString:string];
}

//将日期时间转换为字符串
+ (NSString *)stringFromDate:(NSDate *)date
{
    return [[NSDate dateFormatterWithFormat:@"yyyy-MM-dd HH:mm:ss" dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterNoStyle] stringFromDate:date];
}

//将日期时间转换为字符串
+ (NSString *)stringFromDate:(NSDate *)date format:(NSString *)format
{
    return [[NSDate dateFormatterWithFormat:format dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterNoStyle] stringFromDate:date];
}

//将日期时间转换为字符串
+ (NSString *)stringFromDate:(NSDate *)date dateStyle:(NSDateFormatterStyle)dateStyle timeStyle:(NSDateFormatterStyle)timeStyle
{
    return [[NSDate dateFormatterWithFormat:nil dateStyle:dateStyle timeStyle:timeStyle] stringFromDate:date];
}

@end
