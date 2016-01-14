//
//  NSString+PFObjC.m
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

#import "NSString+PFObjC.h"

@implementation NSString (PFJudge)

//判断是否QQ号码
- (BOOL)isQQ
{
    NSString *regex = @"(^[0-9]*$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:self];
}

//判断是否邮箱地址
- (BOOL)isEmail
{
    NSString *regex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [predicate evaluateWithObject:self];
}

//判断是否URL
- (BOOL)isURL
{
    NSString *regex = @"(http[s]{0,1}|ftp):\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    
    return [predicate evaluateWithObject:self];
}

//判断是否手机号码
- (BOOL)isMobilePhoneNumber
{
    NSString *regexMobile = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString *regexCM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString *regexCU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString *regexCT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString *regexPHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *predicateMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexMobile];
    NSPredicate *predicateCM = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexCM];
    NSPredicate *predicateCU = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexCU];
    NSPredicate *predicateCT = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexCT];
    NSPredicate *predicatePHS = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regexPHS];
    
    return  [predicateMobile evaluateWithObject:self]   ||
    [predicateCM evaluateWithObject:self]       ||
    [predicateCU evaluateWithObject:self]       ||
    [predicateCT evaluateWithObject:self]       ||
    [predicatePHS evaluateWithObject:self];
}

//判断是否ip地址
- (BOOL)isIPAddress
{
    NSArray *components = [self componentsSeparatedByString:@"."];
    NSCharacterSet *set = [[NSCharacterSet characterSetWithCharactersInString:@"1234567890"] invertedSet];
    
    if ( [components count] == 4 )
    {
        NSString *part1 = [components objectAtIndex:0];
        NSString *part2 = [components objectAtIndex:1];
        NSString *part3 = [components objectAtIndex:2];
        NSString *part4 = [components objectAtIndex:3];
        
        if ([part1 rangeOfCharacterFromSet:set].location == NSNotFound &&
            [part2 rangeOfCharacterFromSet:set].location == NSNotFound &&
            [part3 rangeOfCharacterFromSet:set].location == NSNotFound &&
            [part4 rangeOfCharacterFromSet:set].location == NSNotFound )
        {
            if ( [part1 intValue] < 255 &&
                [part2 intValue] < 255 &&
                [part3 intValue] < 255 &&
                [part4 intValue] < 255 )
            {
                return YES;
            }
        }
    }
    
    return NO;
}

//匹配邮箱地址
- (NSString *)matchesEmail:(NSString *)string
{
    NSError *error;
    NSString *regulaStr = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    NSString *matchesStr = nil;
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        matchesStr = [string substringWithRange:match.range];
    }
    
    return matchesStr;
}

//匹配URL
- (NSString *)matchesURL:(NSString *)string
{
    NSError *error;
    NSString *regulaStr = @"(http[s]{0,1}|ftp):\\/\\/([\\w-]+\\.)+[\\w-]+(\\/[\\w- .\\/?%&=]*)?";
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regulaStr options:NSRegularExpressionCaseInsensitive error:&error];
    NSArray *arrayOfAllMatches = [regex matchesInString:string options:0 range:NSMakeRange(0, [string length])];
    
    NSString *matchesStr = nil;
    for (NSTextCheckingResult *match in arrayOfAllMatches) {
        matchesStr = [string substringWithRange:match.range];
    }
    
    return matchesStr;
}

@end

@implementation NSString (PFLocalized)

//本地化
- (NSString *)localized
{
    return NSLocalizedStringWithDefaultValue(self, nil, [NSBundle mainBundle], nil, nil);
}

//本地化带注释
- (NSString *)localizedWithComment:(NSString *)comment
{
    return NSLocalizedStringWithDefaultValue(self, nil, [NSBundle mainBundle], nil, comment);
}

@end
