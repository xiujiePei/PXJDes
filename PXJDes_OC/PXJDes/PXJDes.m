//
//  PXJDes.m
//  PXJDes
//
//  Created by PXJ on 15/9/2.
//  Copyright (c) 2015年 PXJ. All rights reserved.
//

#import "PXJDes.h"

#define DESkey @"isPXJDes"//注意key字符串长度超过8，则按8计算

@implementation PXJDes

+ (NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key
{
    
    NSData *data = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    Byte iv[] = {1,2,3,4,5,6,7,8};
    size_t numBytesEncrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          [key UTF8String], kCCKeySizeDES,
                                          iv,
                                          [data bytes], [data length],
                                          buffer, 1024,
                                          &numBytesEncrypted);
    
    NSString *ciphertext = nil;
    if (cryptStatus == kCCSuccess) {
        NSData *data = [[NSData alloc] initWithBytes:buffer length:numBytesEncrypted];
        ciphertext = [[NSString alloc] initWithData:[GTMBase64 encodeData:data] encoding:NSUTF8StringEncoding];
    }
    return ciphertext;
}

//解密
+ (NSString *) decryptUseDES:(NSString*)cipherText key:(NSString*)key
{
    NSData *cipherData = [[NSData alloc] initWithData:[GTMBase64 decodeString:cipherText]];
    unsigned char buffer[1024];
    memset(buffer, 0, sizeof(char));
    size_t numBytesDecrypted = 0;
    Byte iv[] = {1,2,3,4,5,6,7,8};
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt,
                                          kCCAlgorithmDES,
                                          kCCOptionPKCS7Padding|kCCOptionECBMode,
                                          [key UTF8String],
                                          kCCKeySizeDES,
                                          iv,
                                          [cipherData bytes],
                                          [cipherData length],
                                          buffer,
                                          1024,
                                          &numBytesDecrypted);
    NSString *plainText1 = nil;
    if (cryptStatus == kCCSuccess) {
        NSData* data = [NSData dataWithBytes:buffer length:(NSUInteger)numBytesDecrypted];
        plainText1 = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    return plainText1;
}


+ (NSString *)encryptUseDES:(NSString *)plainText{
    return [PXJDes encryptUseDES:plainText key:DESkey];
}

+ (NSString *)decryptUseDES:(NSString *)cipherText{
    return [PXJDes decryptUseDES:cipherText key:DESkey];
}
@end
