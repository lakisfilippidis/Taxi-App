//
//  Language.h
//  TaxiUz
//
//  Created by Teofilos on 7/6/14.
//  Copyright (c) 2014 SIA iTIR Solutins. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Lang : NSObject

+ (void)setLanguage:(NSString *)languageString;
+ (NSString *)line:(NSString *)key;

@end
