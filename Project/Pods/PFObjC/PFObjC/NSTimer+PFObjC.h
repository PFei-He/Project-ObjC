//
//  NSTimer+PFObjC.h
//  PFObjC
//
//  Created by PFei_He on 15/11/24.
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
//  ***** NSTimer类目 *****
//

#import <Foundation/Foundation.h>

@interface NSTimer (PFObjC)

/**
 *  @brief 暂停计时器
 *  @note 无
 *  @param 无
 *  @return 无
 */
- (void)pause;

/**
 *  @brief 恢复计时器
 *  @note 无
 *  @param 无
 *  @return 无
 */
- (void)resume;

/**
 *  @brief 指定时间间隔后恢复计时器
 *  @note 无
 *  @param timeInterval: 时间间隔
 *  @return 无
 */
- (void)resumeAfterTimeInterval:(NSTimeInterval)timeInterval;

@end
