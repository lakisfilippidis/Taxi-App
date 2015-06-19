//
//  CustomGeocoder.h
//  TaxiUz
//
//  Created by Teofilos on 4/8/14.
//  Copyright (c) 2014 SIA iTIR Solutins. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "CJSONDeserializer.h"

typedef void (^GeocodingSuccess)(NSDictionary *geoObject, NSError *error);

@interface CustomGeocoder : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate> {
    NSMutableData *receiveData;
    NSURLConnection *geoConnection;
    GeocodingSuccess success;
    CLLocation *placeLocation;
}

- (void)startGeoCoding:(CLLocation *)location completionHandler:(GeocodingSuccess)completionHandler;

@end
