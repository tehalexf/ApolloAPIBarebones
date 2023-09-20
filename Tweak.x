#import "Tweak.h"
#import <Foundation/Foundation.h>

%hook NSURLSession
- (NSURLSessionDataTask *)dataTaskWithURL:(NSURL *)url completionHandler:(void (^)(NSData *, NSURLResponse *, NSError *))completionHandler {
    if ([[url host] containsString:@"apollogur"]) {
        NSArray<NSString *> *apollogurComponents = url.pathComponents;
        NSString *endpointType = apollogurComponents[2];

        if ([endpointType isEqualToString:@"image"] || [endpointType isEqualToString:@"album"]) {
            NSURL *modifiedURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.imgur.com/3/%@/%@.json?client_id=%@", endpointType, apollogurComponents[3], @"jRedBBcLbLl3cGNrrU9CxQ"]];
            return %orig(modifiedURL, completionHandler);
        }
    }

    return %orig;
}
%end
