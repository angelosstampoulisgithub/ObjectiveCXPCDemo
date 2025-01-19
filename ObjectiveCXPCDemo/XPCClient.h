//
//  XPCClient.h
//  ObjectiveCXPCDemo
//
//  Created by Angelos Staboulis on 19/1/25.
//

#import <Foundation/Foundation.h>
#import "XPCService.h"
NS_ASSUME_NONNULL_BEGIN

@interface XPCClient : NSObject
@property (nonatomic, strong) NSXPCConnection *connection;
@property (nonatomic, copy) NSString *message;
- (void)establishConnection;
@property (nonatomic, strong) id<XPCServiceProtocol> xpcClient;
- (void)invalidateConnection;

@end

NS_ASSUME_NONNULL_END
