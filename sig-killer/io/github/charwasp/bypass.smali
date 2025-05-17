.class public Lio/github/charwasp/bypass;
.super Ljava/lang/Object;
.source "SigningInfo.java"


# static fields
.field static sig_data:Ljava/lang/String;

.field public static signatures:[Landroid/content/pm/Signature;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "AQAAAywwggMoMIIC5qADAgECAgQuZP+JMAsGByqGSM44BAMFADBlMQswCQYDVQQGEwJqcDEOMAwGA1UECBMFVG9reW8xDjAMBgNVBAcTBUphcGFuMRAwDgYDVQQKEwdVbmtub3duMRAwDgYDVQQLEwdVbmtub3duMRIwEAYDVQQDEwltYXRzdXpha2kwIBcNMTUwOTA2MDkzNzQ2WhgPMjE1MjA3MjkwOTM3NDZaMGUxCzAJBgNVBAYTAmpwMQ4wDAYDVQQIEwVUb2t5bzEOMAwGA1UEBxMFSmFwYW4xEDAOBgNVBAoTB1Vua25vd24xEDAOBgNVBAsTB1Vua25vd24xEjAQBgNVBAMTCW1hdHN1emFraTCCAbcwggEsBgcqhkjOOAQBMIIBHwKBgQD9f1OBHXUSKVLfSpwu7OTn9hG3UjzvRADDHj+AtlEmaUVdQCJR+1k9jVj6v8X1ujD2y5tVbNeBO4AdNG/yZmC3a5lQpaSfn+gEexAiwk+7qdf+t8Yb+DtX58aophUPBPuD9tPFHsMCNVQTWhaRMvZ1864rYdcq7/IiAxmd0UgBxwIVAJdgUI8VIwvMspK5gqLrhAvwWBz1AoGBAPfhoIXWmz3ey7yrXDa4V7l5lK+7+jrqgvlXTAs9B4JnUVlXjrrUWU/mcQcQgYC0SRZxI+hMKBYTt88JMozIpuE8FnqLVHyNKOCjrh4rs6Z1kW6jfwv6ITVi8ftiegEkO8yk8b6oUZCJqIPf4VrlnwaSi2ZegHtVJWQBTDv+z0kqA4GEAAKBgEPKuYwBTGMstAnoPfipnSoyoym8lG4xl9kkBOBoYwPc6O5cSZyniGMn66JJ53tZG0vtqZK7wNulA9JnF1b2cilFS9ou46+qbGxRKeADWfuDVkDWbJvGH7ZkwIXSnZRJizslmEKSipWT5bYCwz2CbIdGyQxH4aIrq3XG+TnnkWDeoyEwHzAdBgNVHQ4EFgQUd1vq2A+W6JndN+3ZwBN/sO//4vswCwYHKoZIzjgEAwUAAy8AMCwCFDCuUu/rySuo0RQiZgcTytRgTuDIAhRXn9FyE6iBjv9BniZVjPGf+hUrgg=="

    sput-object v0, Lio/github/charwasp/bypass;->sig_data:Ljava/lang/String;

    const/4 v0, 0x0

    sput-object v0, Lio/github/charwasp/bypass;->signatures:[Landroid/content/pm/Signature;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static a()V
    .locals 6

    :try_start_0
    new-instance v0, Ljava/io/DataInputStream;

    new-instance v1, Ljava/io/ByteArrayInputStream;

    sget-object v2, Lio/github/charwasp/bypass;->sig_data:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v0, v1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {v0}, Ljava/io/DataInputStream;->read()I

    move-result v1

    and-int/lit16 v1, v1, 0xff

    new-array v1, v1, [[B

    const/4 v2, 0x0

    :goto_0
    array-length v3, v1

    if-ge v2, v3, :cond_0

    invoke-virtual {v0}, Ljava/io/DataInputStream;->readInt()I

    move-result v3

    new-array v3, v3, [B

    aput-object v3, v1, v2

    aget-object v3, v1, v2

    invoke-virtual {v0, v3}, Ljava/io/DataInputStream;->readFully([B)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    array-length v2, v1

    new-array v2, v2, [Landroid/content/pm/Signature;

    sput-object v2, Lio/github/charwasp/bypass;->signatures:[Landroid/content/pm/Signature;

    const/4 v2, 0x0

    :goto_1
    sget-object v3, Lio/github/charwasp/bypass;->signatures:[Landroid/content/pm/Signature;

    array-length v4, v3

    if-ge v2, v4, :cond_1

    new-instance v4, Landroid/content/pm/Signature;

    aget-object v5, v1, v2

    invoke-direct {v4, v5}, Landroid/content/pm/Signature;-><init>([B)V

    aput-object v4, v3, v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_1
    goto :goto_2

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_2
    return-void
.end method

.method public static getApkContentsSigners(Landroid/content/pm/SigningInfo;)[Landroid/content/pm/Signature;
    .locals 1

    sget-object v0, Lio/github/charwasp/bypass;->signatures:[Landroid/content/pm/Signature;

    if-nez v0, :cond_0

    invoke-static {}, Lio/github/charwasp/bypass;->a()V

    sget-object v0, Lio/github/charwasp/bypass;->signatures:[Landroid/content/pm/Signature;

    return-object v0

    :cond_0
    return-object v0
.end method

.method public static getSigningCertificateHistory(Landroid/content/pm/SigningInfo;)[Landroid/content/pm/Signature;
    .locals 1

    invoke-virtual {p0}, Landroid/content/pm/SigningInfo;->hasMultipleSigners()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return-object v0

    :cond_0
    sget-object v0, Lio/github/charwasp/bypass;->signatures:[Landroid/content/pm/Signature;

    if-nez v0, :cond_1

    invoke-static {}, Lio/github/charwasp/bypass;->a()V

    sget-object v0, Lio/github/charwasp/bypass;->signatures:[Landroid/content/pm/Signature;

    return-object v0

    :cond_1
    return-object v0
.end method
