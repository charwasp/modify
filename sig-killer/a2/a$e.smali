.class final La2/a$e;
.super Ljava/lang/Object;
.source "ActivityLifecycleTracker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = La2/a;->v(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Ljava/lang/String;


# direct methods
.method constructor <init>(JLjava/lang/String;)V
    .locals 0

    iput-wide p1, p0, La2/a$e;->a:J

    iput-object p3, p0, La2/a$e;->b:Ljava/lang/String;

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

    if-nez v0, :cond_1

    new-instance v0, La2/j;

    iget-wide v1, p0, La2/a$e;->a:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, La2/j;-><init>(Ljava/lang/Long;Ljava/lang/Long;)V

    invoke-static {v0}, La2/a;->i(La2/j;)La2/j;

    :cond_1
    invoke-static {}, La2/a;->h()La2/j;

    move-result-object v0

    iget-wide v1, p0, La2/a$e;->a:J

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, La2/j;->j(Ljava/lang/Long;)V

    invoke-static {}, La2/a;->l()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-gtz v0, :cond_2

    new-instance v0, La2/a$e$a;

    invoke-direct {v0, p0}, La2/a$e$a;-><init>(La2/a$e;)V

    invoke-static {}, La2/a;->m()Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {}, La2/a;->b()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v2

    invoke-static {}, La2/a;->k()I

    move-result v3

    int-to-long v3, v3

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v2, v0, v3, v4, v5}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    move-result-object v0

    invoke-static {v0}, La2/a;->n(Ljava/util/concurrent/ScheduledFuture;)Ljava/util/concurrent/ScheduledFuture;

    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0

    :cond_2
    :goto_0
    invoke-static {}, La2/a;->e()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-lez v4, :cond_3

    iget-wide v2, p0, La2/a$e;->a:J

    sub-long/2addr v2, v0

    const-wide/16 v0, 0x3e8

    div-long/2addr v2, v0

    :cond_3
    iget-object v0, p0, La2/a$e;->b:Ljava/lang/String;

    invoke-static {v0, v2, v3}, La2/d;->e(Ljava/lang/String;J)V

    invoke-static {}, La2/a;->h()La2/j;

    move-result-object v0

    invoke-virtual {v0}, La2/j;->k()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    return-void

    :catchall_1
    move-exception v0

    invoke-static {v0, p0}, Lh2/a;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
