//
//  UIAlertView+PFObjC.m
//  PFObjC
//
//  Created by PFei_He on 15/12/4.
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
//  ***** UIAlertView类目 *****
//

#import "UIAlertView+PFObjC.h"

@implementation UIAlertView (PFObjC)

//显示警告
+ (void)showWithTitles:(NSArray *)titles message:(NSString *)message target:(id)target
{
    UIAlertView *alertView = [[UIAlertView alloc] init];
    alertView.title = titles[0];
    alertView.message = message;
    alertView.delegate = target;
    if (titles.count > 1) {
        for (NSString *string in [titles objectsAtIndexes:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(1, titles.count-1)]]) {
            [alertView addButtonWithTitle:string];
        }
    }
    [alertView show];
}

@end
