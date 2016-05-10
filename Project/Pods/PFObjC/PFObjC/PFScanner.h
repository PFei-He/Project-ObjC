//
//  PFScanner.h
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
//  ***** 扫描器 *****
//

#import <UIKit/UIKit.h>

@class PFScanner;

@protocol PFScannerDelegate <NSObject>

/**
 *  @brief 扫描完成
 *  @note 无
 *  @param string: 扫描结果转换成的字符串
 *  @return 无
 */
- (void)scanner:(PFScanner *)scanner captureCompletedWithString:(NSString *)string;

@end

@interface PFScanner : NSObject

/* 详见AVCaptureOutput类的rectOfInterest */
///扫描器的工作区域
@property (assign, nonatomic)   CGRect                  rectOfInterest;
///代理
@property (weak, nonatomic)     id<PFScannerDelegate>   delegate;

/**
 *  @brief 创建扫描器
 *  @note 无
 *  @param view: 添加扫描器的视图
 *  @return 无
 */
- (void)createInView:(UIView *)view;

@end
