//
//  NSDictionary+CheckKey.m
//
//  Created by Shiv on 15/03/16.
//  Copyright © 2016 Mayur. All rights reserved.
//

#import "NSDictionary+CheckKey.h"

@implementation NSDictionary (CheckKey)
- (BOOL)checkKey:(NSString *)key className:(NSString *)className
{
    BOOL success = NO;
    id obj = self[key];
    if ( obj != nil ) {
        if ( obj != (id)[NSNull null] ) {
            success = YES;
        }
        else {
          //  DLog(@"Warning! %@: %@ section is empty.", className, key);
        }
    }
    else { 
       // DLog(@"Warning! %@: %@ section is not found.", className, key);
    }
    
    return success;
}
- (BOOL)checkKey:(NSString *)key  {
    BOOL success = NO;
    id obj = self[key];
    if ( obj != nil ) {
        if ( obj != (id)[NSNull null] ) {
            success = YES;
        }
        else {
           // DLog(@"Warning!  %@ section is empty.", key);
        }
    }
    else {
        //DLog(@"Warning!  %@ section is not found.", key);
    }
    
    return success;
}

@end

@implementation NSMutableArray (JSON)

- (void)recursivelyRemoveNulls
{
    [self enumerateObjectsUsingBlock:^(id value, NSUInteger __unused idx, BOOL __unused *nestedStop)
     {
         if ([value isKindOfClass:[NSDictionary class]])
         {
             NSMutableDictionary *modifiedValue = [NSMutableDictionary dictionaryWithDictionary:value];
             [modifiedValue recursivelyRemoveNulls];
             [self removeObject:value];
             [self addObject:modifiedValue];
         }
         else if ([value isKindOfClass:[NSArray class]])
         {
             NSMutableArray *modifiedValue = [NSMutableArray arrayWithArray:value];
             [modifiedValue recursivelyRemoveNulls];
             [self removeObject:value];
             [self addObject:modifiedValue];
         }
     }];
}

@end

@implementation NSMutableDictionary (JSON)

- (void)recursivelyRemoveNulls
{
    [self enumerateKeysAndObjectsUsingBlock:^(NSString *key, id value, BOOL __unused *stop)
     {
         if (value == [NSNull null] || value == nil)
         {
             [self removeObjectForKey:key];
         }
         else if ([value isKindOfClass:[NSDictionary class]])
         {
             NSMutableDictionary *modifiedValue = [NSMutableDictionary dictionaryWithDictionary:value];
             [modifiedValue recursivelyRemoveNulls];
             self[key] = modifiedValue;
         }
         else if ([value isKindOfClass:[NSArray class]])
         {
             NSMutableArray *modifiedValue = [NSMutableArray arrayWithArray:value];
             [modifiedValue recursivelyRemoveNulls];
             self[key] = modifiedValue;
         }
     }];
}

@end
