//
//  GithubSwiftApiClient.m
//  GitHubApp
//
//  Created by Mesrop Kareyan on 29/03/2019.
//  Copyright © 2019 Mesrop Kareyan. All rights reserved.
//

#import "GHAGithubSwiftApiClient.h"

static NSString *const  GHAGithubSwiftApiClientGetRepositoriesEndpoint = @"https://api.github.com/search/repositories";
static const NSUInteger GHAGithubSwiftApiClientPageDefaultSize = 20;

@implementation GHAGithubSwiftApiClient

- (void)getSwiftLibsAtPage:(NSUInteger)page completion:(GHARequestResult)completionBlock {
	return [self getSwiftLibsAtPage:page itemsInPage:GHAGithubSwiftApiClientPageDefaultSize completion:completionBlock];
}

- (void)getSwiftLibsAtPage:(NSUInteger)page itemsInPage:(NSUInteger)itemsPerPage
				completion:(GHARequestResult)completionBlock {
	NSDictionary *parameters = @{@"q" : @"language:swift",
								 @"order": @"desc",
								 @"page": [NSString stringWithFormat:@"%lu", (unsigned long)page],
								 @"per_page": [NSString stringWithFormat:@"%lu", (unsigned long)itemsPerPage],
								 };
	[self getRequestWithPath:GHAGithubSwiftApiClientGetRepositoriesEndpoint
			  wirhParameters:parameters
				  completion:completionBlock];
}

@end
