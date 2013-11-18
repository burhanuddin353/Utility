//
//  Utility.m
//  Utility
//
//  Created by Burhanuddin on 18/11/13.
//  Copyright (c) 2013 Burhanuddin. All rights reserved.
//

#import "Utility.h"
#import <sys/utsname.h>

@implementation Utility

#pragma mark - Private Methods

+ (BOOL) objectCanBeAssigned:(id)object {
    
    if ((object != nil) && !([object isKindOfClass:[NSNull class]])) {
        return YES;
    }
    return NO;
}

#pragma mark - Public Methods

+ (NSString*) deviceModelName {
    
    /*
     @"i386"      on the simulator
     @"iPod1,1"   on iPod Touch
     @"iPod2,1"   on iPod Touch Second Generation
     @"iPod3,1"   on iPod Touch Third Generation
     @"iPod4,1"   on iPod Touch Fourth Generation
     @"iPod5,1"   on iPod Touch Fifth Generation
     @"iPhone1,1" on iPhone
     @"iPhone1,2" on iPhone 3G
     @"iPhone2,1" on iPhone 3GS
     @"iPad1,1"   on iPad
     @"iPad2,1"   on iPad 2
     @"iPhone3,1" on iPhone 4
     @"iPhone4,1" on iPhone 4S
     @"iPhone5,1" on iPhone 5
     */
    
    struct utsname systemInfo;
    
    uname(&systemInfo);
    
    NSString *modelName = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if([modelName isEqualToString:@"i386"] || [modelName isEqualToString:@"x86_64"]) {
        modelName = @"iPhone Simulator";
    }
    else if([modelName isEqualToString:@"iPhone1,1"]) {
        modelName = @"iPhone";
    }
    else if([modelName isEqualToString:@"iPhone1,2"]) {
        modelName = @"iPhone 3G";
    }
    else if([modelName isEqualToString:@"iPhone2,1"]) {
        modelName = @"iPhone 3GS";
    }
    else if([modelName isEqualToString:@"iPhone3,1"]) {
        modelName = @"iPhone 4";
    }
    else if([modelName isEqualToString:@"iPhone3,3"]) {
        modelName = @"iPhone 4(CDMA)";
    }
    else if([modelName isEqualToString:@"iPhone4,1"]) {
        modelName = @"iPhone 4S";
    }
    else if([modelName isEqualToString:@"iPhone5,1"]) {
        modelName = @"iPhone 5";
    }
    else if([modelName isEqualToString:@"iPhone5,2"]) {
        modelName = @"iPhone 5(CDMA)";
    }
    else if([modelName isEqualToString:@"iPod1,1"]) {
        modelName = @"iPod 1st Gen";
    }
    else if([modelName isEqualToString:@"iPod2,1"]) {
        modelName = @"iPod 2nd Gen";
    }
    else if([modelName isEqualToString:@"iPod3,1"]) {
        modelName = @"iPod 3rd Gen";
    }
    else if([modelName isEqualToString:@"iPod4,1"]) {
        modelName = @"iPod 4th Gen";
    }
    else if([modelName isEqualToString:@"iPod5,1"]) {
        modelName = @"iPod 5th Gen";
    }
    else if([modelName isEqualToString:@"iPad1,1"]) {
        modelName = @"iPad Original";
    }
    else if([modelName isEqualToString:@"iPad2,1"]) {
        modelName = @"iPad 2(WiFi)";
    }
    else if([modelName isEqualToString:@"iPad2,2"]) {
        modelName = @"iPad 2(GSM)";
    }
    else if([modelName isEqualToString:@"iPad2,3"]) {
        modelName = @"iPad 2(CDMA)";
    }
    else if([modelName isEqualToString:@"iPad2,4"]) {
        modelName = @"iPad 2(WiFi + New Chip)";
    }
    else if([modelName isEqualToString:@"iPad2,5"]) {
        modelName = @"iPad mini (WiFi)";
    }
    else if([modelName isEqualToString:@"iPad2,6"]) {
        modelName = @"iPad mini (GSM)";
    }
    else if([modelName isEqualToString:@"iPad2,7"]) {
        modelName = @"iPad mini (CDMA)";
    }
    else if([modelName isEqualToString:@"iPad3,1"]) {
        modelName = @"iPad 3(WiFi)";
    }
    else if([modelName isEqualToString:@"iPad3,2"]) {
        modelName = @"iPad 3(GSM)";
    }
    else if([modelName isEqualToString:@"iPad3,3"]) {
        modelName = @"iPad 3(CDMA)";
    }
    else if([modelName isEqualToString:@"iPad3,4"]) {
        modelName = @"iPad 4(WiFi)";
    }
    else if([modelName isEqualToString:@"iPad3,5"]) {
        modelName = @"iPad 4(GSM)";
    }
    else if([modelName isEqualToString:@"iPad3,6"]) {
        modelName = @"iPad 4(CDMA)";
    }
    
    return modelName;
}

+ (BOOL) isValidEmailAddressFormat : (NSString *)emailAddress {
    
    NSError *error = NULL;
    NSRegularExpression *emailRegularExpression = [NSRegularExpression regularExpressionWithPattern:@"([a-z0-9_%\\+-]+)(@)([a-z0-9_%\\+-]+)(\\.)([A-Za-z]{2,4})" options:NSRegularExpressionCaseInsensitive error:&error];
    
    return ([emailRegularExpression numberOfMatchesInString:emailAddress options:0 range:NSMakeRange(0, emailAddress.length)] == 1);
}

+ (NSString *)getDefaultString:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        return [NSString stringWithString:object];
    }
    
    return @"";
}

+ (NSString *) getDefaultLink:(id)object {
    
    if ([object isKindOfClass:[NSString class]]) {
        
        if (![object rangeOfString:@"http"].length) {
                return [NSString stringWithFormat:@"http://%@",object];
        }
        else {
            
            return object;
        }
    }
    
    return @"http://";
}

+ (NSNumber *)getDefaultChar:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithChar:[(NSNumber *)object charValue]];
    }
    
    return [NSNumber numberWithChar:'0'];
}

+ (NSNumber *)getDefaultUnsignedChar:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithUnsignedChar:[(NSNumber *)object unsignedCharValue]];
    }
    
    return [NSNumber numberWithUnsignedChar:'0'];
}

+ (NSNumber *)getDefaultShort:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithShort:[(NSNumber *)object shortValue]];
    }
    
    return [NSNumber numberWithShort:0];
}

+ (NSNumber *)getDefaultUnsignedShort:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithUnsignedShort:[(NSNumber *)object unsignedShortValue]];
    }
    
    return [NSNumber numberWithUnsignedShort:0];
}

+ (NSNumber *)getDefaultInt:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithInt:[(NSNumber *)object intValue]];
    }
    
    return [NSNumber numberWithInt:0];
}

+ (NSNumber *)getDefaultUnsignedInt:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithUnsignedInt:[(NSNumber *)object unsignedIntValue]];
    }
    
    return [NSNumber numberWithUnsignedInt:0];
}

+ (NSNumber *)getDefaultLong:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithLong:[(NSNumber *)object longValue]];
    }
    
    return [NSNumber numberWithLong:0];
}

+ (NSNumber *)getDefaultUnsignedLong:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithUnsignedLong:[(NSNumber *)object unsignedLongValue]];
    }
    
    return [NSNumber numberWithUnsignedLong:0];
}

+ (NSNumber *)getDefaultLongLong:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithLongLong:[(NSNumber *)object longLongValue]];
    }
    
    return [NSNumber numberWithLongLong:0];
}

+ (NSNumber *)getDefaultUnsignedLongLong:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithUnsignedLongLong:[(NSNumber *)object unsignedLongLongValue]];
    }
    
    return [NSNumber numberWithUnsignedLongLong:0];
}

+ (NSNumber *)getDefaultFloat:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithFloat:[(NSNumber *)object floatValue]];
    }
    
    return [NSNumber numberWithFloat:0];
}

+ (NSNumber *)getDefaultDouble:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithDouble:[(NSNumber *)object doubleValue]];
    }
    
    return [NSNumber numberWithDouble:0];
}

+ (NSNumber *)getDefaultInteger:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithInteger:[(NSNumber *)object integerValue]];
    }
    
    return [NSNumber numberWithInteger:0];
}

+ (NSNumber *)getDefaultUnsignedInteger:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithUnsignedInteger:[(NSNumber *)object unsignedIntegerValue]];
    }
    
    return [NSNumber numberWithUnsignedInteger:0];
}

+ (NSNumber *)getDefaultBool:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSNumber numberWithBool:[(NSNumber *)object boolValue]];
    }
    
    return [NSNumber numberWithBool:NO];
}

#pragma mark Date Functions
+ (NSDate *)getDefaultDate:(id)object {
    
    if ([object isKindOfClass:[NSNumber class]]) {
        
        return [NSDate dateWithTimeIntervalSince1970:[(NSNumber *)object integerValue]];
    }
    
    return [NSDate date];
}

+ (BOOL) isDate:(NSDate *)date aheadOfCurrentDateByDays:(int)days {
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit;
    NSDateComponents *dateComponents = [gregorian components:unitFlags fromDate:date];
    NSDateComponents *currentDateComponents = [gregorian components:unitFlags fromDate:[[NSDate date] dateByAddingTimeInterval:60 * 60 * 24 * days]];
    
    if (currentDateComponents.day == dateComponents.day &&
        currentDateComponents.month == dateComponents.month &&
        currentDateComponents.year == dateComponents.year) {
        
        return YES;
    }
    return NO;
}

+ (BOOL)isToday:(NSDate *)date {
    
    return [self isDate:date aheadOfCurrentDateByDays:0];
}

+ (BOOL)isTomorrow:(NSDate *)date {
    
    return [self isDate:date aheadOfCurrentDateByDays:1];
}

+ (NSString *) getStringForRelativeDate:(NSDate *)date {
    
    NSDate *currentDate = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSUInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSDateComponents *components = [gregorian components:unitFlags fromDate:date toDate:currentDate options:0];
	NSString *str_string = @"";
	
    if (date) {
        if([components year]){
            
            str_string = [NSString stringWithFormat:@"%li year%c ago", [components year], components.year > 1 ? 's' : '\0'];
        }
        else if([components month]){
            
            str_string = [NSString stringWithFormat:@"%li month%c ago", [components month], components.month > 1 ? 's' : '\0'];
        }
        else if([components day]){
            
            str_string = [NSString stringWithFormat:@"%li day%c ago", [components day], components.day > 1 ? 's' : '\0'];
        }
        else if([components hour]){
            
            str_string = [NSString stringWithFormat:@"%li hour%c ago", [components hour], components.hour > 1 ? 's' : '\0'];
        }
        else if([components  minute]){
            
            str_string = [NSString stringWithFormat:@"%li minute%c ago", [components minute], components.minute > 1 ? 's' : '\0'];
        }
        else if([components  second]){
            
            str_string = [NSString stringWithFormat:@"%li second%c ago", [components second], components.second > 1 ? 's' : '\0'];
        }
        else {
            
            str_string = @"just now";
        }
    }
    
	return 	str_string;
}

@end
