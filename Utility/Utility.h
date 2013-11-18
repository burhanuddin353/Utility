//
//  Utility.h
//  Utility
//
//  Created by Burhanuddin on 18/11/13.
//  Copyright (c) 2013 Burhanuddin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Utility : NSObject

+ (NSString *)deviceModelName;

+ (BOOL)isValidEmailAddressFormat:(NSString *)emailAddress;

+ (NSString *)getDefaultString:(id)object;
+ (NSString *)getDefaultLink:(id)object;

+ (NSNumber *)getDefaultChar:(id)object;
+ (NSNumber *)getDefaultUnsignedChar:(id)object;
+ (NSNumber *)getDefaultShort:(id)object;
+ (NSNumber *)getDefaultUnsignedShort:(id)object;
+ (NSNumber *)getDefaultInt:(id)object;
+ (NSNumber *)getDefaultUnsignedInt:(id)object;
+ (NSNumber *)getDefaultLong:(id)object;
+ (NSNumber *)getDefaultUnsignedLong:(id)object;
+ (NSNumber *)getDefaultLongLong:(id)object;
+ (NSNumber *)getDefaultUnsignedLongLong:(id)object;
+ (NSNumber *)getDefaultFloat:(id)object;
+ (NSNumber *)getDefaultDouble:(id)object;
+ (NSNumber *)getDefaultInteger:(id)object;
+ (NSNumber *)getDefaultUnsignedInteger:(id)object;
+ (NSNumber *)getDefaultBool:(id)object;

// Date Functions
+ (NSDate *)getDefaultDate:(id)object;
+ (BOOL) isToday : (NSDate *)date;
+ (BOOL) isTomorrow : (NSDate *)date;
+ (NSString *)getStringForRelativeDate:(NSDate *)date;

@end
