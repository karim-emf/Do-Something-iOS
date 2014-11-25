//
//  FISDoSomethingAPI.h
//  FISDoSomething
//
//  Created by Levan Toturgul on 11/25/14.
//  Copyright (c) 2014 Flatiron iOS 003. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FISCampaign;
@interface FISDoSomethingAPI : NSObject

+ (void)retrieveAllActiveCampaignsWithCompletionHandler:(void (^)(NSArray * campaigns))completionHandler;

+ (void)retrieveMoreInfoOnCampaign:(FISCampaign *)campaign withCompletionHandler:(void (^)())completionHandler;

@end
