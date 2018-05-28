//
//  NSDictionary+ValueForKey.m
//  jyxb_app
//
//  Created by liuhost on 16/1/16.
//  Copyright © 2016年 xiaoyuxiaoyu. All rights reserved.
//

#import "NSDictionary+ValueForKey.h"

@implementation NSDictionary (ValueForKey)

-(NSString *) stringOrNilForKey:(NSString *)key{
    id obj = [self objectForKey:key];
    if (!obj || obj == [NSNull null]) {
        return nil;
    }
    if ([obj isKindOfClass:[NSString class]]) {
        return obj;
    }else{
        return [NSString stringWithFormat:@"%@", obj];
    }
    return [obj description];
}

-(NSValue *) valueOrNilForKey:(NSString *)key{
    id obj = [self objectForKey:key];
    if (!obj || obj == [NSNull null]) {
        return nil;
    }
    if ([obj isKindOfClass:[NSValue class]]) {
        return obj;
    }
    return nil;
}

-(NSNumber *) numberOrNilForKey:(NSString *)key{
    id obj = [self objectForKey:key];
    if (!obj || obj == [NSNull null] || ![obj isKindOfClass:[NSNumber class]]) {
        return nil;
    }
    return obj;
}


-(NSArray *) arrayOrNilForKey:(NSString *)key{
    id obj = [self objectForKey:key];
    if (!obj || obj == [NSNull null] || ![obj isKindOfClass:[NSArray class]]) {
        return nil;
    }
    return obj;
}

-(NSDictionary *) dictOrNilForKey:(NSString *)key{
    id obj = [self objectForKey:key];
    if (!obj || obj == [NSNull null] || ![obj isKindOfClass:[NSDictionary class]]) {
        return nil;
    }
    return obj;
}
@end
