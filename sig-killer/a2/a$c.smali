.class final La2/a$c;
.super Ljava/lang/Object;
.source "ActivityLifecycleTracker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = La2/a;->t(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    invoke-static {p0}, Lh2/a;->c(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {}, La2/a;->h()La2/j;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-static {}, La2/j;->h()La2/j;

    move-result-object v0

    invoke-static {v0}, La2/a;->i(La2/j;)La2/j;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :cond_1
    return-void

    :catchall_0
    move-exception v0

    invoke-static {v0, p0}, Lh2/a;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
