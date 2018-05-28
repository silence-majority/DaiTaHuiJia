//
//  NSDictionary+ValueForKey.h
//  jyxb_app
//
//  Created by liuhost on 16/1/16.
//  Copyright © 2016年 xiaoyuxiaoyu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ValueForKey)

-(NSString *) stringOrNilForKey:(NSString *)key;

-(NSValue *) valueOrNilForKey:(NSString *)key;

-(NSNumber *) numberOrNilForKey:(NSString *)key;

-(NSArray *) arrayOrNilForKey:(NSString *)key;

-(NSDictionary *) dictOrNilForKey:(NSString *)key;

@end
