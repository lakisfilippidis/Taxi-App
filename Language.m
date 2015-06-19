//
//  Language.m
//  TaxiUz
//
//  Created by Teofilos on 7/6/14.
//  Copyright (c) 2014 SIA iTIR Solutins. All rights reserved.
//

#import "Lang.h"

@implementation Lang

+ (void)setLanguage:(NSString *)languageString {
    [[NSUserDefaults standardUserDefaults] setObject:languageString forKey:@"AppLanguage"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)line:(NSString *)key {
    return NSLocalizedStringFromTable(key, [[NSUserDefaults standardUserDefaults] objectForKey:@"AppLanguage"], nil);
}

@end
