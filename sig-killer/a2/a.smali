.class public La2/a;
.super Ljava/lang/Object;
.source "ActivityLifecycleTracker.java"


# static fields
.field private static final a:Ljava/lang/String; = "a2.a"

.field private static final b:Ljava/util/concurrent/ScheduledExecutorService;

.field private static volatile c:Ljava/util/concurrent/ScheduledFuture;

.field private static final d:Ljava/lang/Object;

.field private static e:Ljava/util/concurrent/atomic/AtomicInteger;

.field private static volatile f:La2/j;

.field private static g:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static h:Ljava/lang/String;

.field private static i:J

.field private static j:I

.field private static k:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/app/Activity;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    sput-object v0, La2/a;->b:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, La2/a;->d:Ljava/lang/Object;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, La2/a;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, La2/a;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    sput v1, La2/a;->j:I

    return-void
.end method

.method static synthetic a()Ljava/lang/String;
    .locals 1

    sget-object v0, La2/a;->a:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic b()Ljava/util/concurrent/ScheduledExecutorService;
    .locals 1

    sget-object v0, La2/a;->b:Ljava/util/concurrent/ScheduledExecutorService;

    return-object v0
.end method

.method static synthetic c()I
    .locals 2

    sget v0, La2/a;->j:I

    add-int/lit8 v1, v0, 0x1

    sput v1, La2/a;->j:I

    return v0
.end method

.method static synthetic d()I
    .locals 2

    sget v0, La2/a;->j:I

    add-int/lit8 v1, v0, -0x1

    sput v1, La2/a;->j:I

    return v0
.end method

.method static synthetic e()J
    .locals 2

    sget-wide v0, La2/a;->i:J

    return-wide v0
.end method

.method static synthetic f(Landroid/app/Activity;)V
    .locals 0

    invoke-static {p0}, La2/a;->v(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic g(Landroid/app/Activity;)V
    .locals 0

    invoke-static {p0}, La2/a;->u(Landroid/app/Activity;)V

    return-void
.end method

.method static synthetic h()La2/j;
    .locals 1

    sget-object v0, La2/a;->f:La2/j;

    return-object v0
.end method

.method static synthetic i(La2/j;)La2/j;
    .locals 0

    sput-object p0, La2/a;->f:La2/j;

    return-object p0
.end method

.method static synthetic j()Ljava/lang/String;
    .locals 1

    sget-object v0, La2/a;->h:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic k()I
    .locals 1

    invoke-static {}, La2/a;->r()I

    move-result v0

    return v0
.end method

.method static synthetic l()Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1

    sget-object v0, La2/a;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static synthetic m()Ljava/lang/Object;
    .locals 1

    sget-object v0, La2/a;->d:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic n(Ljava/util/concurrent/ScheduledFuture;)Ljava/util/concurrent/ScheduledFuture;
    .locals 0

    sput-object p0, La2/a;->c:Ljava/util/concurrent/ScheduledFuture;

    return-object p0
.end method

.method private static o()V
    .locals 3

    sget-object v0, La2/a;->d:Ljava/lang/Object;

    monitor-enter v0

    :try_start_0
    sget-object v1, La2/a;->c:Ljava/util/concurrent/ScheduledFuture;

    if-eqz v1, :cond_0

    sget-object v1, La2/a;->c:Ljava/util/concurrent/ScheduledFuture;

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Ljava/util/concurrent/ScheduledFuture;->cancel(Z)Z

    :cond_0
    const/4 v1, 0x0

    sput-object v1, La2/a;->c:Ljava/util/concurrent/ScheduledFuture;

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public static p()Landroid/app/Activity;
    .locals 1

    sget-object v0, La2/a;->k:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Activity;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public static q()Ljava/util/UUID;
    .locals 1

    sget-object v0, La2/a;->f:La2/j;

    if-eqz v0, :cond_0

    sget-object v0, La2/a;->f:La2/j;

    invoke-virtual {v0}, La2/j;->d()Ljava/util/UUID;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method private static r()I
    .locals 1

    invoke-static {}, Lcom/facebook/d;->f()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/facebook/internal/n;->j(Ljava/lang/String;)Lcom/facebook/internal/m;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-static {}, La2/e;->a()I

    move-result v0

    return v0

    :cond_0
    invoke-virtual {v0}, Lcom/facebook/internal/m;->j()I

    move-result v0

    return v0
.end method

.method public static s()Z
    .locals 1

    sget v0, La2/a;->j:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static t(Landroid/app/Activity;)V
    .locals 1

    sget-object p0, La2/a;->b:Ljava/util/concurrent/ScheduledExecutorService;

    new-instance v0, La2/a$c;

    invoke-direct {v0}, La2/a$c;-><init>()V

    invoke-interface {p0, v0}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method private static u(Landroid/app/Activity;)V
    .locals 0

    invoke-static {p0}, Lw1/b;->l(Landroid/app/Activity;)V

    return-void
.end method

.method private static v(Landroid/app/Activity;)V
    .locals 3

    sget-object v0, La2/a;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    move-result v0

    if-gez v0, :cond_0

    sget-object v0, La2/a;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->set(I)V

    sget-object v0, La2/a;->a:Ljava/lang/String;

    const-string v1, "Unexpected activity pause without a matching activity resume. Logging data may be incorrect. Make sure you call activateApp from your Application\'s onCreate method"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_0
    invoke-static {}, La2/a;->o()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {p0}, Lcom/facebook/internal/x;->q(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0}, Lw1/b;->m(Landroid/app/Activity;)V

    new-instance p0, La2/a$e;

    invoke-direct {p0, v0, v1, v2}, La2/a$e;-><init>(JLjava/lang/String;)V

    sget-object v0, La2/a;->b:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0, p0}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static w(Landroid/app/Activity;)V
    .locals 4

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, La2/a;->k:Ljava/lang/ref/WeakReference;

    sget-object v0, La2/a;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    invoke-static {}, La2/a;->o()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    sput-wide v0, La2/a;->i:J

    invoke-static {p0}, Lcom/facebook/internal/x;->q(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p0}, Lw1/b;->n(Landroid/app/Activity;)V

    invoke-static {p0}, Lv1/a;->d(Landroid/app/Activity;)V

    invoke-static {p0}, Ld2/d;->e(Landroid/app/Activity;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    new-instance v3, La2/a$d;

    invoke-direct {v3, v0, v1, v2, p0}, La2/a$d;-><init>(JLjava/lang/String;Landroid/content/Context;)V

    sget-object p0, La2/a;->b:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {p0, v3}, Ljava/util/concurrent/ScheduledExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static x(Landroid/app/Application;Ljava/lang/String;)V
    .locals 3

    sget-object v0, La2/a;->g:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    sget-object v0, Lcom/facebook/internal/k$d;->f:Lcom/facebook/internal/k$d;

    new-instance v1, La2/a$a;

    invoke-direct {v1}, La2/a$a;-><init>()V

    invoke-static {v0, v1}, Lcom/facebook/internal/k;->a(Lcom/facebook/internal/k$d;Lcom/facebook/internal/k$c;)V

    sput-object p1, La2/a;->h:Ljava/lang/String;

    new-instance p1, La2/a$b;

    invoke-direct {p1}, La2/a$b;-><init>()V

    invoke-virtual {p0, p1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    return-void
.end method
