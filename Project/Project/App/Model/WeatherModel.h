//
//  WeatherModel.h
//  Project
//
//  Created by PFei_He on 16/1/11.
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
//  ***** 天气接口 *****
//

#import "BasisRequest.h"

@interface WeatherResult : PFModel

@property (copy, nonatomic)     NSString        *Radar;
@property (copy, nonatomic)     NSString        *SD;
@property (copy, nonatomic)     NSString        *WD;
@property (copy, nonatomic)     NSString        *WS;
@property (strong, nonatomic)   NSNumber        *WSE;
@property (copy, nonatomic)     NSString        *city;
@property (strong, nonatomic)   NSNumber        *cityid;
@property (strong, nonatomic)   NSNumber        *isRadar;
@property (copy, nonatomic)     NSString        *njd;
@property (strong, nonatomic)   NSNumber        *qy;
@property (strong, nonatomic)   NSNumber        *temp;
@property (copy, nonatomic)     NSString        *time;

@end

@interface WeatherModel : PFModel

@property (strong, nonatomic)   NSDictionary    *weatherinfo;

@end

@interface WeatherRequest : BasisRequest

/**
 *  @brief 发送请求
 *  @note 无
 *  @param 无
 *  @return 无
 */
- (void)send;

@end
