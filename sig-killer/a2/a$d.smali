.class final La2/a$d;
.super Ljava/lang/Object;
.source "ActivityLifecycleTracker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = La2/a;->w(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Landroid/content/Context;


# direct methods
.method constructor <init>(JLjava/lang/String;Landroid/content/Context;)V
    .locals 0

    iput-wide p1, p0, La2/a$d;->a:J

    iput-object p3, p0, La2/a$d;->b:Ljava/lang/String;

    iput-object p4, p0, La2/a$d;->c:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    invoke-static {p0}, Lh2/a;->c(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    invoke-static {}, La2/a;->h()La2/j;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    new-instance v0, La2/j;

    iget-wide v2, p0, La2/a$d;->a:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v2, v1}, La2/j;-><init>(Ljava/lang/Long;Ljava/lang/Long;)V

    invoke-static {v0}, La2/a;->i(La2/j;)La2/j;

    iget-object v0, p0, La2/a$d;->b:Ljava/lang/String;

    invoke-static {}, La2/a;->j()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, La2/a$d;->c:Landroid/content/Context;

    invoke-static {v0, v1, v2, v3}, La2/k;->c(Ljava/lang/String;La2/l;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_0

    :cond_1
    invoke-static {}, La2/a;->h()La2/j;

    move-result-object v0

    invoke-virtual {v0}, La2/j;->e()Ljava/lang/Long;

    move-result-object v0

    if-eqz v0, :cond_3

    iget-wide v2, p0, La2/a$d;->a:J

    invoke-static {}, La2/a;->h()La2/j;

    move-result-object v0

    invoke-virtual {v0}, La2/j;->e()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long/2addr v2, v4

    invoke-static {}, La2/a;->k()I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v4, v0

    cmp-long v0, v2, v4

    if-lez v0, :cond_2

    iget-object v0, p0, La2/a$d;->b:Ljava/lang/String;

    invoke-static {}, La2/a;->h()La2/j;

    move-result-object v2

    invoke-static {}, La2/a;->j()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, La2/k;->e(Ljava/lang/String;La2/j;Ljava/lang/String;)V

    iget-object v0, p0, La2/a$d;->b:Ljava/lang/String;

    invoke-static {}, La2/a;->j()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, La2/a$d;->c:Landroid/content/Context;

    invoke-static {v0, v1, v2, v3}, La2/k;->c(Ljava/lang/String;La2/l;Ljava/lang/String;Landroid/content/Context;)V

    new-instance v0, La2/j;

    iget-wide v2, p0, La2/a$d;->a:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v2, v1}, La2/j;-><init>(Ljava/lang/Long;Ljava/lang/Long;)V

    invoke-static {v0}, La2/a;->i(La2/j;)La2/j;

    goto :goto_0

    :cond_2
    const-wide/16 v0, 0x3e8

    cmp-long v0, v2, v0

    if-lez v0, :cond_3

    invoke-static {}, La2/a;->h()La2/j;

    move-result-object v0

    invoke-virtual {v0}, La2/j;->i()V

    :cond_3
    :goto_0
    invoke-static {}, La2/a;->h()La2/j;

    move-result-object v0

    iget-wide v1, p0, La2/a$d;->a:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, La2/j;->j(Ljava/lang/Long;)V

    invoke-static {}, La2/a;->h()La2/j;

    move-result-object v0

    invoke-virtual {v0}, La2/j;->k()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception v0

    invoke-static {v0, p0}, Lh2/a;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
