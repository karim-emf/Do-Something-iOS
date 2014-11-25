//
//  FISDoSomethingAPI.m
//  FISDoSomething
//
//  Created by Levan Toturgul on 11/25/14.
//  Copyright (c) 2014 Flatiron iOS 003. All rights reserved.
//

#import "FISDoSomethingAPI.h"
#import "FISCampaign.h"
#import <AFNetworking/AFNetworking.h>



@implementation FISDoSomethingAPI

+(void)retrieveAllActiveCampaignsWithCompletionHandler:(void (^)(NSArray * campaigns))completionHandler{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://www.dosomething.org/api/v1/campaigns.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        completionHandler([FISCampaign generateCampaignsFromResponseObject:responseObject]);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

+ (void)retrieveMoreInfoOnCampaign:(FISCampaign *)campaign withCompletionHandler:(void (^)())completionHandler{
    NSString *url = [NSString stringWithFormat:@"https://www.dosomething.org/api/v1/content/%@.json",campaign.nid];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {        
        NSLog(@"%@",responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       NSLog(@"Error: %@", error);
    }];
    
}
@end
