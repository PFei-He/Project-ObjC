//
//  PFModel.m
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
//  ***** 数据模型基类 *****
//

#import "PFModel.h"
#import <objc/runtime.h>

///调试模式
static BOOL DEBUG_MODE = NO;
///调试目标
static NSString *DEBUG_TARGET = @"";

@interface PFModel () <NSXMLParserDelegate>

///节点
@property (strong, nonatomic) NSMutableArray    *array;
///节点中的值
@property (strong, nonatomic) NSMutableString   *string;

@end

@implementation PFModel

#pragma mark - Life Cycle

//初始化
+ (instancetype)model
{
    return [[self alloc] init];
}

//初始化
- (instancetype)initWithJSON:(id)JSON
{
    self.JSON = JSON;
    return [self init];
}

//初始化
+ (instancetype)modelWithJSON:(id)JSON
{
    PFModel *model = [[self alloc] init];
    model.JSON = JSON;
    return model;
}

//初始化
- (instancetype)initWithXML:(id)XML
{
    self.XML = XML;
    return [self init];
}

//初始化
+ (instancetype)modelWithXML:(id)XML
{
    PFModel *model = [[self alloc] init];
    model.XML = XML;
    return model;
}

#pragma mark - Property Methods

//JSON数据
- (void)setJSON:(id)JSON
{
    _JSON = JSON;
    [self parseJSON:JSON];
}

//XML数据
- (void)setXML:(id)XML
{
    _XML = XML;
    [self parseXML:XML];
}

#pragma mark - Private Methods

///解析JSON
- (void)parseJSON:(id)JSON
{
    //判断数据类型
    if (![JSON isKindOfClass:[NSDictionary class]] && ![JSON isKindOfClass:[NSData class]]) {
        if (DEBUG_MODE) {
            NSLog(@"[ %@ ][ ERROR ] The JSON object must be type of dictionary or data.", DEBUG_TARGET);
            NSLog(@"[ %@ ][ ERROR ] Class: %@.", DEBUG_TARGET, [self classForCoder]);
        }
        return;
    } else if ([JSON isKindOfClass:[NSData class]]) {
        JSON = [NSJSONSerialization JSONObjectWithData:JSON options:NSJSONReadingAllowFragments error:nil];
    }
    //将键值设置为属性（解析JSON）
    [self setValuesForKeysWithDictionary:JSON];
}

///解析XML
- (void)parseXML:(id)XML
{
    //节点
    self.array = [[NSMutableArray alloc] init];
    [self.array addObject:[NSMutableDictionary dictionary]];
    
    //节点中的值
    self.string = [[NSMutableString alloc] init];
    
    //判断数据类型
    if (![XML isKindOfClass:[NSString class]] && ![XML isKindOfClass:[NSData class]]) {
        if (DEBUG_MODE) {
            NSLog(@"[ %@ ][ ERROR ] The XML object must be type of string or data.", DEBUG_TARGET);
            NSLog(@"[ %@ ][ ERROR ] Class: %@.", DEBUG_TARGET, [self classForCoder]);
        }
        return;
    } else if ([XML isKindOfClass:[NSString class]]) {
        XML = [XML dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    //XML解析器
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:XML];
    parser.delegate = self;
    if ([parser parse]) {//解析XML
        self.JSON = self.array[0];
    } else if (DEBUG_MODE) {
        NSLog(@"[ %@ ][ ERROR ] XML data can't be parse.", DEBUG_TARGET);
        NSLog(@"[ %@ ][ ERROR ] Class: %@.", DEBUG_TARGET, [self classForCoder]);
    }
}

#pragma mark - Public Methods

//获取未被声明的键值
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if (DEBUG_MODE) {
        NSLog(@"[ %@ ][ ERROR ] Found undefined key when parsing.", DEBUG_TARGET);
        NSLog(@"[ %@ ][ ERROR ] Class: %@.", DEBUG_TARGET, [self classForCoder]);
        NSLog(@"[ %@ ][ ERROR ] Key: %@.", DEBUG_TARGET, key);
        NSLog(@"[ %@ ][ ERROR ] Type: %@.", DEBUG_TARGET, [value classForCoder]);
        NSLog(@"[ %@ ][ ERROR ] Value: %@.", DEBUG_TARGET, value);
    }
}

//创建JSON（将键值转化为字典）
- (NSDictionary *)createJSON
{
    //获取属性列表
    unsigned int count = 0;
    objc_property_t *list = class_copyPropertyList([self classForCoder], &count);
    NSMutableArray *array = [NSMutableArray array];
    if (list != NULL) {
        for (int i = 0; i < count; i++) {
            //获取属性名
            NSString *key = [NSString stringWithUTF8String:property_getName(list[i])];
            
            //将属性放入到数组中
            [array addObject:key];
        }
    }
    //释放对象
    free(list);
    
    //去除空值
    NSDictionary *dictionary = [NSDictionary dictionaryWithDictionary:[self dictionaryWithValuesForKeys:array]];
    NSMutableDictionary *JSON = [NSMutableDictionary dictionary];
    for (NSString *string in dictionary) {
        if ([dictionary[string] isKindOfClass:[NSNull class]]) {
            [JSON setObject:@"" forKey:string];
        } else {
            [JSON setObject:dictionary[string] forKey:string];
        }
    }
    
    //返回JSON对象
    return JSON;
}

//调试模式
+ (void)debugMode:(BOOL)openOrNot debugTarget:(NSString *)target
{
    DEBUG_MODE = openOrNot;
    DEBUG_TARGET = target;
}

#pragma mark - NSXMLParserDelegate Methods

//读取节点头
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    //父节点
    NSMutableDictionary *parentDict = [self.array lastObject];
    
    //子节点
    NSMutableDictionary *childDict = [NSMutableDictionary dictionary];
    [childDict addEntriesFromDictionary:attributeDict];
    
    //将节点转为字典的键值
    id value = parentDict[elementName];
    if (value) {
        NSMutableArray *array = nil;
        if ([value isKindOfClass:[NSMutableArray class]]) {
            array = (NSMutableArray *)value;
        } else {
            array = [NSMutableArray array];
            [array addObject:value];
            [parentDict setObject:array forKey:elementName];
        }
        [array addObject:childDict];
    } else {
        [parentDict setObject:childDict forKey:elementName];
    }
    [self.array addObject:childDict];
}

//读取节点尾
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSMutableDictionary *dictionary = self.array.lastObject;
    
    if (self.string.length > 0) {//剪切字符串，去掉空白和换行
        NSString *string = [self.string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [dictionary setObject:string forKey:elementName];
        self.string = [NSMutableString new];
    }
    [self.array removeLastObject];
}

//读取节点中的值
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    [self.string appendString:string];
}

@end
