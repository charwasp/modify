.class La2/a$e$a;
.super Ljava/lang/Object;
.source "ActivityLifecycleTracker.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = La2/a$e;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:La2/a$e;


# direct methods
.method constructor <init>(La2/a$e;)V
    .locals 0

    iput-object p1, p0, La2/a$e$a;->a:La2/a$e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

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

    iget-object v2, p0, La2/a$e$a;->a:La2/a$e;

    iget-wide v2, v2, La2/a$e;->a:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-direct {v0, v2, v1}, La2/j;-><init>(Ljava/lang/Long;Ljava/lang/Long;)V

    invoke-static {v0}, La2/a;->i(La2/j;)La2/j;

    :cond_1
    invoke-static {}, La2/a;->l()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-gtz v0, :cond_2

    iget-object v0, p0, La2/a$e$a;->a:La2/a$e;

    iget-object v0, v0, La2/a$e;->b:Ljava/lang/String;

    invoke-static {}, La2/a;->h()La2/j;

    move-result-object v2

    invoke-static {}, La2/a;->j()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v2, v3}, La2/k;->e(Ljava/lang/String;La2/j;Ljava/lang/String;)V

    invoke-static {}, La2/j;->a()V

    invoke-static {v1}, La2/a;->i(La2/j;)La2/j;

    :cond_2
    invoke-static {}, La2/a;->m()Ljava/lang/Object;

    move-result-object v0

    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :try_start_1
    invoke-static {v1}, La2/a;->n(Ljava/util/concurrent/ScheduledFuture;)Ljava/util/concurrent/ScheduledFuture;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    :catchall_1
    move-exception v0

    invoke-static {v0, p0}, Lh2/a;->b(Ljava/lang/Throwable;Ljava/lang/Object;)V

    return-void
.end method
