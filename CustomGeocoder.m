//
//  CustomGeocoder.m
//  TaxiUz
//
//  Created by Teofilos on 4/8/14.
//  Copyright (c) 2014 SIA iTIR Solutins. All rights reserved.
//

#import "CustomGeocoder.h"

@implementation CustomGeocoder {}

- (void)startGeoCoding:(CLLocation *)location completionHandler:(GeocodingSuccess)completionHandler {
    NSString *OSMGeoUrl = [NSString stringWithFormat:@"%@%@", @"http://nominatim.openstreetmap.org/reverse?format=json&lat=%lf&lon=%lf&addressdetails=1&accept-language=", [Lang line:@"localizing"]];

    success = Block_copy(completionHandler);
    placeLocation = [[CLLocation alloc] initWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude];
    
    NSString *urlString = [NSString stringWithFormat:OSMGeoUrl, location.coordinate.latitude, location.coordinate.longitude];
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:20.f];
    
    geoConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [geoConnection start];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    success([NSDictionary new], error);
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    receiveData = [NSMutableData new];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receiveData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSDictionary *dataDict = [[CJSONDeserializer deserializer] deserializeAsDictionary:receiveData error:nil];
    success(dataDict, nil);
}

@end
