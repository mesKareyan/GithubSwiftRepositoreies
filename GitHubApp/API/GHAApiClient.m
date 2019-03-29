//
//  ApiClient.m
//  GitHubApp
//
//  Created by Mesrop Kareyan on 29/03/2019.
//  Copyright © 2019 Mesrop Kareyan. All rights reserved.
//

#import "GHAApiClient.h"

@interface GHAApiClient ()

@property (nonatomic, nonnull, readwrite) NSURLSession *session;

@end

@implementation GHAApiClient

- (instancetype)init
{
	self = [super init];
	if (self) {
		_session = NSURLSession.sharedSession;
	}
	return self;
}

#pragma mark - GET

- (void)getRequestWithPath:(NSString *)urlPath
			wirhParameters:(NSDictionary<NSString *, NSString *> *)parameters
				completion:(GHARequestResult)completionBlock {
	NSURLComponents *components = [[NSURLComponents alloc] initWithString:urlPath];
	NSMutableArray *items = [NSMutableArray new];
	for (NSString *key in parameters) {
		NSString *value = parameters[key];
		NSURLQueryItem *item = [[NSURLQueryItem alloc] initWithName:key value:value];
		[items addObject:item];
	}
	components.queryItems = [items copy];
	NSURL *url = components.URL;
	if (!url) {
		return;
	}
	NSURLSessionDataTask *task = [self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data,
																			   NSURLResponse * _Nullable response,

																			   NSError * _Nullable error) {
		if (error) {
			completionBlock(error, nil);
			return;
		}

		if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
			NSInteger statusCode = [(NSHTTPURLResponse *)response statusCode];
			if (statusCode != 200) {
				NSString *description = [NSHTTPURLResponse localizedStringForStatusCode:statusCode];
				NSError *error = [[NSError alloc] initWithDomain:@"MesropK.GitHubApp" code:statusCode
														userInfo:@{ NSLocalizedFailureReasonErrorKey: description }];
				completionBlock(error, nil);
				return;
			}
		}

		if(!data) {
			NSError *error = [[NSError alloc] initWithDomain:@"MesropK.GitHubApp" code:404
													userInfo:@{ NSLocalizedFailureReasonErrorKey:@"Data not found"}];
			completionBlock(error, nil);
			return;
		}

		completionBlock(nil, data);

	}];
	[task resume];
}



@end
