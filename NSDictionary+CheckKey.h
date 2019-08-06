//
//  NSDictionary+CheckKey.h
//
//  Created by Shiv on 15/03/16.
//  Copyright © 2016 Mayur. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (CheckKey)
- (BOOL)checkKey:(NSString *)key className:(NSString *)className;
- (BOOL)checkKey:(NSString *)key;
@end

@interface NSMutableArray (JSON)

- (void)recursivelyRemoveNulls;

@end

@interface NSMutableDictionary (JSON)

- (void)recursivelyRemoveNulls;

@end


