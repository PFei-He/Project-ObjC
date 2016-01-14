//
//  UIView+PFObjC.m
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
//  ***** UIView类目 *****
//

#import "UIView+PFObjC.h"

@implementation UIView (Metrics)

#pragma mark - ORIGIN

//坐标
- (CGPoint)origin
{
    return self.frame.origin;
}

//坐标
- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

//X坐标
- (CGFloat)x
{
    return self.frame.origin.x;
}

//X坐标
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

//Y坐标
- (CGFloat)y
{
    return self.frame.origin.y;
}

//Y坐标
- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

#pragma mark - SIZE

//尺寸
- (CGSize)size
{
    return self.frame.size;
}

//尺寸
- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

//宽
- (CGFloat)width
{
    return self.frame.size.width;
}

//宽
- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

//高
- (CGFloat)height
{
    return self.frame.size.height;
}

//高
- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - POSITION

//方位
- (CGPoint)position
{
    return self.frame.origin;
}

//方位
- (void)setPosition:(CGPoint)position
{
    CGRect frame = self.frame;
    frame.origin = position;
    self.frame = frame;
}

//上边缘
- (CGFloat)top
{
    return self.frame.origin.y;
}

//上边缘
- (void)setTop:(CGFloat)top
{
    CGRect frame = self.frame;
    frame.origin.y = top;
    self.frame = frame;
}

//左边缘
- (CGFloat)left
{
    return self.frame.origin.x;
}

//左边缘
- (void)setLeft:(CGFloat)left
{
    CGRect frame = self.frame;
    frame.origin.x = left;
    self.frame = frame;
}

//下边缘
- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

//下边缘
- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

//右边缘
- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

//右边缘
- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

#pragma mark - CENTER

//中心点
- (CGPoint)boundsCenter
{
    return CGPointMake( CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
}

//中心点的X坐标
- (CGFloat)centerX
{
    return self.center.x;
}

//中心点的X坐标
- (void)setCenterX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

//中心点的Y坐标
- (CGFloat)centerY
{
    return self.center.y;
}

//中心点的Y坐标
- (void)setCenterY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

#pragma mark - OFFSET

//位移
- (CGPoint)offset
{
    CGPoint point = CGPointZero;
    UIView *view = self;
    
    while ( view ) {
        point.x += view.frame.origin.x;
        point.y += view.frame.origin.y;
        view = view.superview;
    }
    
    return point;
}

//位移
- (void)setOffset:(CGPoint)offset
{
    UIView * view = self;
    if ( nil == view )
        return;
    
    CGPoint point = offset;
    
    while ( view ) {
        point.x += view.superview.frame.origin.x;
        point.y += view.superview.frame.origin.y;
        view = view.superview;
    }
    
    CGRect frame = self.frame;
    frame.origin = point;
    self.frame = frame;
}

@end
