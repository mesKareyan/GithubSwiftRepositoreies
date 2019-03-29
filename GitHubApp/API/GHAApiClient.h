//
//  ApiClient.h
//  GitHubApp
//
//  Created by Mesrop Kareyan on 29/03/2019.
//  Copyright © 2019 Mesrop Kareyan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^GHARequestResult)(NSError *error, NSData *data);

NS_ASSUME_NONNULL_BEGIN

@interface GHAApiClient : NSObject

@property (nonatomic, nonnull, readonly) NSURLSession *session;

- (void)getRequestWithPath:(NSString *)urlPath
			wirhParameters:(NSDictionary *)parameters
				completion:(GHARequestResult)completionBlock;

@end

NS_ASSUME_NONNULL_END
