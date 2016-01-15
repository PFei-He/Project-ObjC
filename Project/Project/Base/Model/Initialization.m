//
//  Initialization.m
//  Project
//
//  Created by PFei_He on 16/1/6.
//  Copyright © 2016年 PF-Lib. All rights reserved.
//
//  https://github.com/PFei-He/Project-ObjC
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
//  ***** 初始化 *****
//

#import "Initialization.h"
#import "BasisRequest.h"
#import "Api.h"

@implementation Initialization

//初始化登录页
+ (UIViewController *)initLaunch
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"launch"]) {
        UITabBarController *tabBarController = (UITabBarController *)[[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
        tabBarController.viewControllers = @[[[UIStoryboard storyboardWithName:@"Home" bundle:[NSBundle mainBundle]] instantiateInitialViewController],
                                             [[UIStoryboard storyboardWithName:@"More" bundle:[NSBundle mainBundle]] instantiateInitialViewController]];
        return tabBarController;
    } else {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"launch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Guide" bundle:[NSBundle mainBundle]] instantiateInitialViewController];
        return viewController;
    }
}

//初始化主机地址
+ (void)initHost:(NSString *)url
{
    [BasisRequest sharedInstance].hostAddress = url;
}

//初始化接口
+ (void)initApi
{
    [Api sharedInstance].JSON = [PFFile readJSONWithName:@"api"];
}

//初始化用户文件
+ (void)initUserFile
{
    [PFFile createFileWithName:@"User-Settings.txt"];
}

@end
