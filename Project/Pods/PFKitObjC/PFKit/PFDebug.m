//
//  PFDebug.m
//  PFKit
//
//  Created by PFei_He on 16/5/12.
//  Copyright © 2016年 PFei_He. All rights reserved.
//
//  https://github.com/PFei-He/PFKitObjC
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
//  ***** 调试 *****
//

#import "PFDebug.h"
#import "PFFile.h"
#import "PFModel.h"
#import "PFScanner.h"

@implementation PFDebug

//版本信息
+ (void)debugVersion
{
    NSLog(@"[ PFKit ][ INFO ] THANK YOU FOR USING !!");
    NSLog(@"[ PFKit ][ INFO ] Current version: 0.0.7.");
    NSLog(@"[ PFKit ][ INFO ] Programming language: Objective-C.");
    NSLog(@"[ PFKit ][ INFO ] Open source license: MIT.");
    NSLog(@"[ PFKit ][ INFO ] Join me: https://github.com/PFei-He/PFKitObjC.");
}

//调试模式
+ (void)debugMode:(BOOL)openOrNot
{
    [PFFile debugMode:openOrNot debugTarget:@"PFKit"];
    [PFModel debugMode:openOrNot debugTarget:@"PFKit"];
    [PFScanner debugMode:openOrNot debugTarget:@"PFKit"];
}

//调试模式
+ (void)debugMode:(BOOL)openOrNot debugTarget:(NSString *)target
{
    [PFFile debugMode:openOrNot debugTarget:target];
    [PFModel debugMode:openOrNot debugTarget:target];
    [PFScanner debugMode:openOrNot debugTarget:target];
}

@end
