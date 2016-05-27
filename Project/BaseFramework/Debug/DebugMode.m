//
//  DebugMode.m
//  Project
//
//  Created by PFei_He on 16/5/9.
//  Copyright © 2016年 PFei_He. All rights reserved.
//
//   __________   __________    _________   ___________  ___________   __________  ___________
//  |  _______ \ |  _______ \  / _______ \ |______   __||  _________| / _________||____   ____|
//  | |       \ || |       \ || /       \ |       | |   | |          | /               | |
//  | |_______/ || |_______/ || |       | |       | |   | |_________ | |               | |
//  |  ________/ |  _____  _/ | |       | | _     | |   |  _________|| |               | |
//  | |          | |     \ \  | |       | || |    | |   | |          | |               | |
//  | |          | |      \ \ | \_______/ || \____/ |   | |_________ | \_________      | |
//  |_|          |_|       \_\ \_________/  \______/    |___________| \__________|     |_|
//
//
//  The framework design by https://github.com/PFei-He/Project-ObjC
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
//  ***** 框架调试模式 *****
//

#import "DebugMode.h"

#import "BaseModel.h"

#import "BaseCollectionViewController.h"
#import "BaseTableViewController.h"
#import "BaseViewController.h"

#import <PFKitObjC/PFKit.h>

@implementation DebugMode

//调试模式
+ (void)open:(BOOL)debugOrNot
{
    [DebugMode debugVersion];
    [PFDebug debugMode:debugOrNot debugTarget:@"PROJECT"];
    
    // MODEL
    [BaseModel debugMode:debugOrNot];
    [BaseRequest debugMode:debugOrNot];
    
    // VIEW MODEL
    [BaseCollectionViewController debugMode:debugOrNot];
    [BaseTableViewController debugMode:debugOrNot];
    [BaseViewController debugMode:debugOrNot];
}

//版本信息
+ (void)debugVersion
{
    NSLog(@"[ PROJECT ][ INFO ] THANK YOU FOR USING !!");
    NSLog(@"[ PROJECT ][ INFO ] Current version: 0.1.0.");
    NSLog(@"[ PROJECT ][ INFO ] Programming language: Objective-C.");
    NSLog(@"[ PROJECT ][ INFO ] Open source license: MIT.");
    NSLog(@"[ PROJECT ][ INFO ] Join me: https://github.com/PFei-He/Project-ObjC.");
    NSLog(@"[ PROJECT ][ INFO ] Using lib: AFNetworking https://github.com/AFNetworking/AFNetworking.");
    NSLog(@"[ PROJECT ][ INFO ] Using lib: PFKitObjC https://github.com/PFei-He/PFKitObjC.");
    NSLog(@"[ PROJECT ][ INFO ] Using lib: SVProgressHUD https://github.com/SVProgressHUD/SVProgressHUD.");
}

@end
