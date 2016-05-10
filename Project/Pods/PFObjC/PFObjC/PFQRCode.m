//
//  PFQRCode.m
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

#import "PFQRCode.h"

@implementation PFQRCode

//生成二维码
+ (UIImage *)createWithString:(NSString *)string codeSize:(CGFloat)size
{
    return [PFQRCode createWithString:string codeSize:size iconNamed:nil];
}

//生成定制二维码
+ (UIImage *)createWithString:(NSString *)string codeSize:(CGFloat)size iconNamed:(NSString *)name
{
    //将要生成二维码的字符串转为数据类型
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    
    //创建滤镜
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    //设置内容和纠错级别
    [filter setValue:data forKey:@"inputMessage"];
    [filter setValue:@"H" forKey:@"inputCorrectionLevel"];
    
    //得到一个矩形
    CGRect extent = CGRectIntegral(filter.outputImage.extent);
    
    //得出缩放倍数
    CGFloat scale = MIN(size/CGRectGetWidth(extent), size/CGRectGetHeight(extent));
    
    //得出大小
    size_t width = CGRectGetWidth(extent) * scale;
    size_t height = CGRectGetHeight(extent) * scale;
    
    //创建一个灰度图
    CGColorSpaceRef cs = CGColorSpaceCreateDeviceGray();
    
    //创建一个位图
    CGContextRef bitmapRef = CGBitmapContextCreate(nil, width, height, 8, 0, cs, (CGBitmapInfo)kCGImageAlphaNone);
    
    //获取CIContext
    CIContext *context = [CIContext contextWithOptions:@{kCIContextUseSoftwareRenderer: @YES}];
    CGImageRef bitmap = [context createCGImage:filter.outputImage fromRect:extent];
    CGContextSetInterpolationQuality(bitmapRef, kCGInterpolationNone);
    CGContextScaleCTM(bitmapRef, scale, scale);
    CGContextDrawImage(bitmapRef, extent, bitmap);
    
    //保存位图到图片
    CGImageRef scaledImage = CGBitmapContextCreateImage(bitmapRef);
    CGContextRelease(bitmapRef);
    CGImageRelease(bitmap);
    
    //生成二维码
    UIImage *QRCode = [UIImage imageWithCGImage:scaledImage];
    
    if (name) {
        
        //中部定制图
        UIImage *iconImage = [UIImage imageNamed:name];
        
        //获取二维码的尺寸
        CGSize size1 = [UIImage imageWithCIImage:[filter.outputImage imageByApplyingTransform:CGAffineTransformMakeScale(20, 20)]].size;
        
        //获取二维码的标尺
        CGRect rect = CGRectMake(0, 0, size1.width, size1.height);
        
        //开始绘图
        UIGraphicsBeginImageContext(rect.size);
        
        //将定制图绘制于二维码中间
        [QRCode drawInRect:rect];
        CGSize size2 = CGSizeMake(rect.size.width * 0.25, rect.size.height * 0.25);
        CGFloat x = (rect.size.width - size2.width) * 0.5;
        CGFloat y = (rect.size.height - size2.height) * 0.5;
        [iconImage drawInRect:CGRectMake(x, y, size2.width, size2.height)];
        
        //生成带图标的二维码
        UIImage *iconQRCode = UIGraphicsGetImageFromCurrentImageContext();
        
        //结束绘图
        UIGraphicsEndImageContext();
        
        //返回定制二维码
        return iconQRCode;
    }
    
    //返回二维码
    return QRCode;
}

@end
