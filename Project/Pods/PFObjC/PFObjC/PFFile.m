//
//  PFFile.m
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
//  ***** 文件操作 *****
//

#import "PFFile.h"

@implementation PFFile

//创建文件
+ (void)createFileWithName:(NSString *)fileName
{
    NSString *path = [PFFile readFileWithName:fileName directory:@"doucument" type:nil];
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:path]) {//如果文件不存在则创建文件
        [manager createFileAtPath:path contents:nil attributes:nil];
    }
}

//创建文件
+ (void)createFileWithName:(NSString *)fileName params:(NSDictionary *)params
{
    NSString *path = [PFFile readFileWithName:fileName directory:@"doucument" type:nil];
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:path]) {//如果文件不存在则创建文件
        [manager createFileAtPath:path contents:nil attributes:nil];
        [PFFile fileWithName:fileName setParams:params];
    }
}

//读取Dictionary类型文件
+ (NSDictionary *)readDictionaryWithName:(NSString *)fileName
{
    return [[NSDictionary alloc] initWithContentsOfFile:[PFFile readFileWithName:fileName directory:@"doucument" type:nil]];
}

//读取String类型文件
+ (NSString *)readStringWithName:(NSString *)fileName
{
    return [[NSString alloc] initWithContentsOfFile:[PFFile readFileWithName:fileName directory:@"doucument" type:nil] encoding:NSUTF8StringEncoding error:nil];
}

//读取JSON类型文件
+ (NSData *)readJSONWithName:(NSString *)fileName
{
    return [PFFile readFileWithName:fileName directory:@"bundle" type:@"json"];
}

//读取XML类型文件
+ (NSData *)readXMLWithName:(NSString *)fileName
{
    return [PFFile readFileWithName:fileName directory:@"bundle" type:@"xml"];
}

//读取文件的路径
+ (NSString *)readPathWithName:(NSString *)fileName
{
    return [PFFile readFileWithName:fileName directory:@"document" type:nil];
}

//写入文件
+ (BOOL)fileWithName:(NSString *)fileName setParams:(NSDictionary *)params
{
    return [params writeToFile:[PFFile readFileWithName:fileName directory:@"document" type:nil] atomically:YES];
}

//添加参数
+ (BOOL)fileWithName:(NSString *)fileName addParams:(NSDictionary *)params
{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] initWithDictionary:[PFFile readDictionaryWithName:fileName]];
    [dictionary addEntriesFromDictionary:params];
    return [PFFile fileWithName:fileName setParams:dictionary];
}

//删除文件
+ (void)removeFileWithName:(NSString *)fileName
{
    NSString *path = [PFFile readFileWithName:fileName directory:@"doucument" type:nil];
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:path]) {//如果文件存在则删除文件
        [manager removeItemAtPath:path error:nil];
    }
}

///读取资源包文件或沙盒文件
+ (id)readFileWithName:(NSString *)fileName directory:(NSString *)directory type:(NSString *)type
{
    if ([directory isEqualToString:@"bundle"]) {//资源包文件
        NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:type];
        NSString *string = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
        return [string dataUsingEncoding:NSUTF8StringEncoding];
    } else {//沙盒文件
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        return [paths[0] stringByAppendingPathComponent:fileName];
    }
}

@end
