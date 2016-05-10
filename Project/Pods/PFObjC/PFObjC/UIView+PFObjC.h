//
//  UIView+PFObjC.h
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
//  ***** UIView类目 *****
//

#import <UIKit/UIKit.h>

@interface UIView (Metrics)

///坐标
@property (assign, nonatomic)   CGPoint     origin;

///X坐标
@property (assign, nonatomic)   CGFloat     x;

///Y坐标
@property (assign, nonatomic)   CGFloat     y;

///尺寸
@property (assign, nonatomic)   CGSize      size;

///宽
@property (assign, nonatomic)   CGFloat     width;

///高
@property (assign, nonatomic)   CGFloat     height;

///方位
@property (assign, nonatomic)   CGPoint     position;

///上边缘
@property (assign, nonatomic)   CGFloat     top;

///左边缘
@property (assign, nonatomic)   CGFloat     left;

///下边缘
@property (assign, nonatomic)   CGFloat     bottom;

///右边缘
@property (assign, nonatomic)   CGFloat     right;

///中心点
@property (readonly, nonatomic) CGPoint     boundsCenter;

///中心点的X坐标
@property (assign, nonatomic)   CGFloat     centerX;

///中心点的Y坐标
@property (assign, nonatomic)   CGFloat     centerY;

///位移
@property (assign, nonatomic)   CGPoint     offset;

@end
