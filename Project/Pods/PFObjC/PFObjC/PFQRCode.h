//
//  PFQRCode.h
//  PFObjC
//
//  Created by PFei_He on 15/11/17.
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
//  ***** 二维码生成 *****
//

#import <UIKit/UIKit.h>

@interface PFQRCode : NSObject

/**
 *  @brief 生成二维码
 *  @note 无
 *  @param string: 用于生成二维码的字符串
 *  @param size: 二维码的尺寸
 *  @return 二维码
 */
+ (UIImage *)createWithString:(NSString *)string codeSize:(CGFloat)size;

/**
 *  @brief 生成定制二维码
 *  @note 无
 *  @param string: 用于生成二维码的字符串
 *  @param size: 二维码的尺寸
 *  @param name: 放置于二维码中间的定制图
 *  @return 二维码
 */
+ (UIImage *)createWithString:(NSString *)string codeSize:(CGFloat)size iconNamed:(NSString *)name;

@end
