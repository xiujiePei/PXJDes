//
//  PXJDes.h
//  PXJDes
//
//  Created by PXJ on 15/9/2.
//  Copyright (c) 2015年 PXJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"
@interface PXJDes : NSObject

/**
 *  DES加密方法，此方法需要加密key
 *
 *  @param plainText 待加密的字符串
 *  @param key       加密key值，注意长度是8(同加密key)，长度超过8按照8计算
 *
 *  @return 加密后的密文
 */
+ (NSString *) encryptUseDES:(NSString *)plainText key:(NSString *)key;

/**
 *  DES解密方法，此方法需要解密key(同加密key)
 *
 *  @param cipherText  需要解密的密文
 *  @param key         解密key值，注意长度是8(同加密key)
 *
 *  @return 解密后的明文
 */
+ (NSString *) decryptUseDES:(NSString*)cipherText key:(NSString*)key;

/**
 *  DES加密方法，此方法在PXJDes.m文件中已经定义了全局宏定义的DESkey，则不需要输入（初次使用时请自行填写DESkey对应的值）
 *
 *  @param cipherText 待加密的字符串
 *
 *  @return 加密后的密文
 */

+ (NSString *) decryptUseDES:(NSString*)cipherText;

/**
 *  DES解密方法，此方法在PXJDes.m文件中已经定义了全局宏定义的DESkey，则不需要输入
 *
 *  @param plainText 需要解密的密文
 *
 *  @return 解密后的明文
 */
+ (NSString *) encryptUseDES:(NSString *)plainText;

@end
